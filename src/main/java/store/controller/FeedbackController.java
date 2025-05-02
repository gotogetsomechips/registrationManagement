package store.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import store.bean.Feedback;
import store.service.FeedbackService;

@Controller
@RequestMapping("/feedback")
public class FeedbackController {

    @Autowired
    private FeedbackService feedbackService;

    // 每页显示的记录数
    private static final int PAGE_SIZE = 10;

    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "searchColumn", required = false) String searchColumn,
                       @RequestParam(value = "keyword", required = false) String keyword,
                       @RequestParam(value = "sortField", required = false) String sortField,
                       @RequestParam(value = "sortDirection", required = false) String sortDirection,
                       @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                       HttpSession session) {

        // 从会话中获取闪存消息
        String flashMessage = (String) session.getAttribute("flash_message");
        session.removeAttribute("flash_message"); // 立即移除，确保只显示一次

        // 添加消息处理
        if (flashMessage != null) {
            switch (flashMessage) {
                case "add_success":
                    model.addAttribute("success", "反馈添加成功！");
                    break;
                case "edit_success":
                    model.addAttribute("success", "反馈修改成功！");
                    break;
                case "delete_success":
                    model.addAttribute("success", "反馈删除成功！");
                    break;
                case "delete_fail":
                    model.addAttribute("error", "反馈删除失败！");
                    break;
            }
        }

        // 确保页码不小于1
        if (pageNum < 1) {
            pageNum = 1;
        }

        // 创建查询条件
        Feedback condition = new Feedback();
        if (searchColumn != null && keyword != null && !keyword.isEmpty()) {
            if ("feedback_name".equals(searchColumn)) {
                condition.setFeedbackName(keyword);
            } else if ("feedback_phone".equals(searchColumn)) {
                condition.setFeedbackPhone(keyword);
            } else if ("feedback_title".equals(searchColumn)) {
                condition.setFeedbackTitle(keyword);
            }
        }

        // 获取总记录数用于分页
        int totalCount;
        if (condition.getFeedbackName() != null || condition.getFeedbackPhone() != null || condition.getFeedbackTitle() != null) {
            totalCount = feedbackService.countFeedbacksByCondition(condition);
        } else {
            totalCount = feedbackService.countAllFeedbacks();
        }

        // 计算总页数
        int totalPages = (totalCount + PAGE_SIZE - 1) / PAGE_SIZE;

        // 确保页码不超过总页数
        if (totalPages > 0 && pageNum > totalPages) {
            pageNum = totalPages;
        }

        // 计算分页起始索引
        int startIndex = (pageNum - 1) * PAGE_SIZE;

        // 获取分页反馈列表（加入排序条件）
        List<Feedback> feedbackList;
        String orderBy = (sortField != null && sortDirection != null) ?
                         sortField + " " + sortDirection : "id DESC";

        if (condition.getFeedbackName() != null || condition.getFeedbackPhone() != null || condition.getFeedbackTitle() != null) {
            feedbackList = feedbackService.getFeedbacksByConditionOrderByWithPagination(condition, orderBy, startIndex, PAGE_SIZE);
        } else {
            feedbackList = feedbackService.getAllFeedbacksOrderByWithPagination(orderBy, startIndex, PAGE_SIZE);
        }

        // 设置分页相关属性
        model.addAttribute("list", feedbackList);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalCount", totalCount);

        // 保留搜索条件和排序条件
        model.addAttribute("searchColumn", searchColumn);
        model.addAttribute("keyword", keyword);
        model.addAttribute("sortField", sortField);
        model.addAttribute("sortDirection", sortDirection);

        return "feedback_list";
    }

    @RequestMapping("/add")
    public String add(Feedback feedback, HttpServletRequest request, HttpSession session) {
        // 验证反馈人姓名
        if (feedback.getFeedbackName() == null || feedback.getFeedbackName().isEmpty()) {
            request.setAttribute("error", "反馈人姓名不能为空");
            return "feedback_add";
        }
        // 验证反馈人姓名是否已存在
        if (feedbackService.isFeedbackNameExist(feedback.getFeedbackName())) {
            request.setAttribute("error", "反馈人姓名已存在");
            return "feedback_add";
        }

        // 验证手机号格式
        if (feedback.getFeedbackPhone() == null || !feedback.getFeedbackPhone().matches("^1[3-9]\\d{9}$")) {
            request.setAttribute("error", "请输入有效的11位手机号码");
            return "feedback_add";
        }

        // 验证标题
        if (feedback.getFeedbackTitle() == null || feedback.getFeedbackTitle().isEmpty()) {
            request.setAttribute("error", "反馈标题不能为空");
            return "feedback_add";
        }

        int result = feedbackService.addFeedback(feedback);
        if (result > 0) {
            session.setAttribute("flash_message", "add_success");
            return "redirect:/feedback/list";
        } else {
            request.setAttribute("error", "添加反馈失败");
            return "feedback_add";
        }
    }

    @RequestMapping("/edit")
    public String edit(Feedback feedback, HttpServletRequest request,
                       @RequestParam(value = "pageNum", defaultValue = "1") int pageNum, HttpSession session) {
        // 验证反馈人姓名
        if (feedback.getFeedbackName() == null || feedback.getFeedbackName().isEmpty()) {
            request.setAttribute("error", "反馈人姓名不能为空");
            Feedback originalFeedback = feedbackService.getFeedbackById(feedback.getId());
            request.setAttribute("vo", originalFeedback);
            return "feedback_edit";
        }

        // 验证手机号格式
        if (feedback.getFeedbackPhone() == null || !feedback.getFeedbackPhone().matches("^1[3-9]\\d{9}$")) {
            request.setAttribute("error", "请输入有效的11位手机号码");
            Feedback originalFeedback = feedbackService.getFeedbackById(feedback.getId());
            request.setAttribute("vo", originalFeedback);
            return "feedback_edit";
        }
        // 验证反馈人姓名是否已存在（排除当前记录）
        if (feedbackService.isFeedbackNameExistExcludeId(feedback.getFeedbackName(), feedback.getId())) {
            request.setAttribute("error", "反馈人姓名已存在");
            Feedback originalFeedback = feedbackService.getFeedbackById(feedback.getId());
            request.setAttribute("vo", originalFeedback);
            return "feedback_edit";
        }
        // 验证标题
        if (feedback.getFeedbackTitle() == null || feedback.getFeedbackTitle().isEmpty()) {
            request.setAttribute("error", "反馈标题不能为空");
            Feedback originalFeedback = feedbackService.getFeedbackById(feedback.getId());
            request.setAttribute("vo", originalFeedback);
            return "feedback_edit";
        }

        Feedback originalFeedback = feedbackService.getFeedbackById(feedback.getId());

        // 检查是否有实际修改
        boolean hasChanged = !feedback.getFeedbackName().equals(originalFeedback.getFeedbackName()) ||
                !feedback.getFeedbackPhone().equals(originalFeedback.getFeedbackPhone()) ||
                !feedback.getFeedbackTitle().equals(originalFeedback.getFeedbackTitle()) ||
                (feedback.getFeedbackText() == null && originalFeedback.getFeedbackText() != null) ||
                (feedback.getFeedbackText() != null && !feedback.getFeedbackText().equals(originalFeedback.getFeedbackText())) ||
                !feedback.getStatus().equals(originalFeedback.getStatus());

        if (!hasChanged) {
            request.setAttribute("error", "未做任何修改，无需提交");
            request.setAttribute("vo", originalFeedback);
            return "feedback_edit";
        }

        int result = feedbackService.updateFeedback(feedback);
        if (result > 0) {
            session.setAttribute("flash_message", "edit_success");
            return "redirect:/feedback/list?pageNum=" + pageNum;
        } else {
            request.setAttribute("error", "更新反馈失败");
            request.setAttribute("vo", originalFeedback);
            return "feedback_edit";
        }
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("id") Integer id,
                         @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                         HttpSession session) {
        int result = feedbackService.deleteFeedback(id);
        if (result > 0) {
            session.setAttribute("flash_message", "delete_success");
        } else {
            session.setAttribute("flash_message", "delete_fail");
        }
        return "redirect:/feedback/list?pageNum=" + pageNum;
    }


    @RequestMapping("/info")
    public String info(@RequestParam("id") Integer id, Model model) {
        Feedback feedback = feedbackService.getFeedbackById(id);
        model.addAttribute("vo", feedback);
        return "feedback_info";
    }

    @RequestMapping("/toAdd")
    public String toAdd() {
        return "feedback_add";
    }

    @RequestMapping("/toEdit")
    public String toEdit(@RequestParam("id") Integer id, Model model,
                         @RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
        Feedback feedback = feedbackService.getFeedbackById(id);
        model.addAttribute("vo", feedback);
        model.addAttribute("pageNum", pageNum);
        return "feedback_edit";
    }
}