package store.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import store.bean.Immigration;
import store.service.ImmigrationService;

@Controller
@RequestMapping("/immigration")
public class ImmigrationController {

    @Autowired
    private ImmigrationService immigrationService;

    // 每页显示的记录数
    private static final int PAGE_SIZE = 10;

    @RequestMapping("/list")
    public String list(Model model,
                      @RequestParam(value = "searchColumn", required = false) String searchColumn,
                      @RequestParam(value = "keyword", required = false) String keyword,
                      @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                      @RequestParam(value = "message", required = false) String message) {

        // 添加消息处理
        if (message != null) {
            switch (message) {
                case "add_success":
                    model.addAttribute("operationMessage", "移民记录添加成功！");
                    break;
                case "edit_success":
                    model.addAttribute("operationMessage", "移民记录修改成功！");
                    break;
                case "delete_success":
                    model.addAttribute("operationMessage", "移民记录删除成功！");
                    break;
                case "delete_fail":
                    model.addAttribute("operationMessage", "移民记录删除失败！");
                    break;
            }
        }
        
        // 确保页码不小于1
        if (pageNum < 1) {
            pageNum = 1;
        }

        // 创建查询条件
        Immigration condition = new Immigration();
        if (searchColumn != null && keyword != null && !keyword.isEmpty()) {
            if ("immigration_name".equals(searchColumn)) {
                condition.setImmigrationName(keyword);
            } else if ("immigration_number".equals(searchColumn)) {
                condition.setImmigrationNumber(keyword);
            }
        }

        // 获取总记录数用于分页
        int totalCount;
        if (condition.getImmigrationName() != null || condition.getImmigrationNumber() != null) {
            totalCount = immigrationService.countImmigrationsByCondition(condition);
        } else {
            totalCount = immigrationService.countAllImmigrations();
        }

        // 计算总页数
        int totalPages = (totalCount + PAGE_SIZE - 1) / PAGE_SIZE;

        // 确保页码不超过总页数
        if (totalPages > 0 && pageNum > totalPages) {
            pageNum = totalPages;
        }

        // 计算分页起始索引
        int startIndex = (pageNum - 1) * PAGE_SIZE;

        // 获取分页移民记录列表
        List<Immigration> immigrationList;
        if (condition.getImmigrationName() != null || condition.getImmigrationNumber() != null) {
            immigrationList = immigrationService.getImmigrationsByConditionWithPagination(condition, startIndex, PAGE_SIZE);
        } else {
            immigrationList = immigrationService.getAllImmigrationsWithPagination(startIndex, PAGE_SIZE);
        }
        
        // 设置分页相关属性
        model.addAttribute("list", immigrationList);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalCount", totalCount);

        // 保留搜索条件
        model.addAttribute("searchColumn", searchColumn);
        model.addAttribute("keyword", keyword);

        return "immigration_list";
    }

    @RequestMapping("/add")
    public String add(Immigration immigration, HttpServletRequest request) {
        // 验证姓名
        if (immigration.getImmigrationName() == null || immigration.getImmigrationName().isEmpty()) {
            request.setAttribute("error", "姓名不能为空");
            return "immigration_add";
        }

        // 验证移民编号
        if (immigration.getImmigrationNumber() == null || immigration.getImmigrationNumber().isEmpty()) {
            request.setAttribute("error", "移民编号不能为空");
            return "immigration_add";
        }

        // 验证移民编号唯一性
        if (immigrationService.isImmigrationNumberExists(immigration.getImmigrationNumber())) {
            request.setAttribute("error", "移民编号已存在，请使用其他编号");
            return "immigration_add";
        }

        immigration.setCreateBy("admin"); // 实际应该从session获取当前登录用户
        int result = immigrationService.addImmigration(immigration);
        if (result > 0) {
            // 添加成功，设置成功消息
            return "redirect:/immigration/list?message=add_success";
        } else {
            request.setAttribute("error", "添加移民记录失败");
            return "immigration_add";
        }
    }

    @RequestMapping("/edit")
    public String edit(Immigration immigration, HttpServletRequest request,
                       @RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
        // 验证姓名
        if (immigration.getImmigrationName() == null || immigration.getImmigrationName().isEmpty()) {
            request.setAttribute("error", "姓名不能为空");
            // 重新获取原始记录
            Immigration originalImmigration = immigrationService.getImmigrationById(immigration.getId());
            request.setAttribute("vo", originalImmigration);
            return "immigration_edit";
        }

        // 验证移民编号
        if (immigration.getImmigrationNumber() == null || immigration.getImmigrationNumber().isEmpty()) {
            request.setAttribute("error", "移民编号不能为空");
            // 重新获取原始记录
            Immigration originalImmigration = immigrationService.getImmigrationById(immigration.getId());
            request.setAttribute("vo", originalImmigration);
            return "immigration_edit";
        }

        // 获取原始记录
        Immigration originalImmigration = immigrationService.getImmigrationById(immigration.getId());

        // 如果移民编号已更改，则检查唯一性
        if (!immigration.getImmigrationNumber().equals(originalImmigration.getImmigrationNumber())) {
            if (immigrationService.isImmigrationNumberExists(immigration.getImmigrationNumber())) {
                request.setAttribute("error", "移民编号已存在，请使用其他编号");
                request.setAttribute("vo", originalImmigration);
                return "immigration_edit";
            }
        }

        // 检查是否有实际修改
        boolean hasChanged = !immigration.getImmigrationName().equals(originalImmigration.getImmigrationName()) ||
                !immigration.getImmigrationNumber().equals(originalImmigration.getImmigrationNumber()) ||
                !immigration.getImmigrationDate().equals(originalImmigration.getImmigrationDate()) ||
                (immigration.getImmigrationText() == null && originalImmigration.getImmigrationText() != null) ||
                (immigration.getImmigrationText() != null && !immigration.getImmigrationText().equals(originalImmigration.getImmigrationText()));

        if (!hasChanged) {
            request.setAttribute("error", "未做任何修改，无需提交");
            request.setAttribute("vo", originalImmigration);
            return "immigration_edit";
        }

        int result = immigrationService.updateImmigration(immigration);
        if (result > 0) {
            // 修改成功，设置成功消息
            return "redirect:/immigration/list?message=edit_success&pageNum=" + pageNum;
        } else {
            request.setAttribute("error", "更新移民记录失败");
            request.setAttribute("vo", originalImmigration);
            return "immigration_edit";
        }
    }
    @RequestMapping("/delete")
    public String delete(@RequestParam("id") Integer id,
                        @RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
        int result = immigrationService.deleteImmigration(id);
        if (result > 0) {
            return "redirect:/immigration/list?message=delete_success&pageNum=" + pageNum;
        } else {
            return "redirect:/immigration/list?message=delete_fail&pageNum=" + pageNum;
        }
    }
    @RequestMapping("/checkNumber")
    @ResponseBody
    public String checkImmigrationNumberExists(
            @RequestParam("number") String immigrationNumber,
            @RequestParam(value = "id", required = false) Integer id) {

        boolean exists;
        if (id != null) {
            // 编辑模式 - 排除当前ID
            exists = immigrationService.isImmigrationNumberExistsExcludeId(immigrationNumber, id);
        } else {
            // 添加模式 - 检查全部
            exists = immigrationService.isImmigrationNumberExists(immigrationNumber);
        }

        // 返回"true"表示编号已存在，"false"表示编号可用
        return Boolean.toString(exists);
    }
    @RequestMapping("/info")
    public String info(@RequestParam("id") Integer id, Model model) {
        Immigration immigration = immigrationService.getImmigrationById(id);
        model.addAttribute("vo", immigration);
        return "immigration_info";
    }

    @RequestMapping("/toAdd")
    public String toAdd() {
        return "immigration_add";
    }

    @RequestMapping("/toEdit")
    public String toEdit(@RequestParam("id") Integer id,
                        @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                        Model model) {
        Immigration immigration = immigrationService.getImmigrationById(id);
        model.addAttribute("vo", immigration);
        model.addAttribute("pageNum", pageNum);
        return "immigration_edit";
    }
}