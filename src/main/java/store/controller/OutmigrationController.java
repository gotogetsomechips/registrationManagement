package store.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import store.bean.Outmigration;
import store.service.OutmigrationService;

@Controller
@RequestMapping("/outmigration")
public class OutmigrationController {

    @Autowired
    private OutmigrationService outmigrationService;

    private static final int PAGE_SIZE = 10;

    @RequestMapping("/list")
    public String list(Model model,
                      @RequestParam(value = "searchColumn", required = false) String searchColumn,
                      @RequestParam(value = "keyword", required = false) String keyword,
                      @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                      @RequestParam(value = "sortField", required = false) String sortField,
                      @RequestParam(value = "sortDirection", required = false) String sortDirection,
                      @RequestParam(value = "message", required = false) String message) {

        // 处理操作消息
        if (message != null) {
            switch (message) {
                case "add_success":
                    model.addAttribute("operationMessage", "迁出记录添加成功！");
                    break;
                case "edit_success":
                    model.addAttribute("operationMessage", "迁出记录修改成功！");
                    break;
                case "delete_success":
                    model.addAttribute("operationMessage", "迁出记录删除成功！");
                    break;
                case "delete_fail":
                    model.addAttribute("operationMessage", "迁出记录删除失败！");
                    break;
            }
        }

        // 确保页码不小于1
        if (pageNum < 1) {
            pageNum = 1;
        }

        // 创建查询条件
        Outmigration condition = new Outmigration();
        if (searchColumn != null && keyword != null && !keyword.isEmpty()) {
            if ("name".equals(searchColumn)) {
                condition.setName(keyword);
            }
        }

        // 获取总记录数
        int totalCount;
        if (condition.getName() != null) {
            totalCount = outmigrationService.countOutmigrationsByCondition(condition);
        } else {
            totalCount = outmigrationService.countAllOutmigrations();
        }

        // 计算总页数
        int totalPages = (totalCount + PAGE_SIZE - 1) / PAGE_SIZE;

        // 确保页码不超过总页数
        if (totalPages > 0 && pageNum > totalPages) {
            pageNum = totalPages;
        }

        // 计算分页起始索引
        int startIndex = (pageNum - 1) * PAGE_SIZE;

        // 获取分页数据
        List<Outmigration> outmigrationList;
        if (condition.getName() != null) {
            outmigrationList = outmigrationService.getOutmigrationsByConditionWithPagination(condition, startIndex, PAGE_SIZE);
        } else {
            outmigrationList = outmigrationService.getAllOutmigrationsWithPagination(startIndex, PAGE_SIZE);
        }

        // 设置模型属性
        model.addAttribute("sortField", sortField);
        model.addAttribute("sortDirection", sortDirection);
        model.addAttribute("list", outmigrationList);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("searchColumn", searchColumn);
        model.addAttribute("keyword", keyword);

        return "outmigration_list";
    }
    @RequestMapping("/add")
    public String add(Outmigration outmigration, HttpServletRequest request) {
        // 验证姓名
        if (outmigration.getName() == null || outmigration.getName().isEmpty()) {
            request.setAttribute("error", "姓名不能为空");
            return "outmigration_add";
        }
        // 姓名唯一性校验
        Outmigration existingOutmigration = outmigrationService.getOutmigrationByName(outmigration.getName());
        if (existingOutmigration != null) {
            request.setAttribute("error", "该姓名已存在，请使用其他姓名");
            return "outmigration_add";
        }

        // 验证金额
        if (outmigration.getAmount() == null || outmigration.getAmount() <= 0) {
            request.setAttribute("error", "迁出金额必须大于0");
            return "outmigration_add";
        }

        // 验证缴费方式
        if (outmigration.getPaymentMethod() == null || outmigration.getPaymentMethod().isEmpty()) {
            request.setAttribute("error", "请选择缴费方式");
            return "outmigration_add";
        }

        outmigration.setCreateBy("admin"); // 实际应从session获取
        int result = outmigrationService.addOutmigration(outmigration);
        if (result > 0) {
            return "redirect:/outmigration/list?message=add_success";
        } else {
            request.setAttribute("error", "添加迁出记录失败");
            return "outmigration_add";
        }
    }

    @RequestMapping("/edit")
    public String edit(Outmigration outmigration, HttpServletRequest request,
                      @RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
        // 验证姓名
        if (outmigration.getName() == null || outmigration.getName().isEmpty()) {
            request.setAttribute("error", "姓名不能为空");
            Outmigration original = outmigrationService.getOutmigrationById(outmigration.getId());
            request.setAttribute("vo", original);
            return "outmigration_edit";
        }
        // 姓名唯一性校验（排除当前ID）
        Outmigration existingOutmigration = outmigrationService.getOutmigrationByNameExcludeId(outmigration.getName(), outmigration.getId());
        if (existingOutmigration != null) {
            request.setAttribute("error", "该姓名已存在，请使用其他姓名");
            Outmigration original = outmigrationService.getOutmigrationById(outmigration.getId());
            request.setAttribute("vo", original);
            return "outmigration_edit";
        }
        // 验证金额
        if (outmigration.getAmount() == null || outmigration.getAmount() <= 0) {
            request.setAttribute("error", "迁出金额必须大于0");
            Outmigration original = outmigrationService.getOutmigrationById(outmigration.getId());
            request.setAttribute("vo", original);
            return "outmigration_edit";
        }

        // 验证缴费方式
        if (outmigration.getPaymentMethod() == null || outmigration.getPaymentMethod().isEmpty()) {
            request.setAttribute("error", "请选择缴费方式");
            Outmigration original = outmigrationService.getOutmigrationById(outmigration.getId());
            request.setAttribute("vo", original);
            return "outmigration_edit";
        }

        int result = outmigrationService.updateOutmigration(outmigration);
        if (result > 0) {
            return "redirect:/outmigration/list?message=edit_success&pageNum=" + pageNum;
        } else {
            request.setAttribute("error", "更新迁出记录失败");
            Outmigration original = outmigrationService.getOutmigrationById(outmigration.getId());
            request.setAttribute("vo", original);
            return "outmigration_edit";
        }
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("id") Integer id,
                        @RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
        int result = outmigrationService.deleteOutmigration(id);
        if (result > 0) {
            return "redirect:/outmigration/list?message=delete_success&pageNum=" + pageNum;
        } else {
            return "redirect:/outmigration/list?message=delete_fail&pageNum=" + pageNum;
        }
    }

    @RequestMapping("/info")
    public String info(@RequestParam("id") Integer id, Model model) {
        Outmigration outmigration = outmigrationService.getOutmigrationById(id);
        model.addAttribute("vo", outmigration);
        return "outmigration_info";
    }

    @RequestMapping("/toAdd")
    public String toAdd() {
        return "outmigration_add";
    }

    @RequestMapping("/toEdit")
    public String toEdit(@RequestParam("id") Integer id,
                        @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                        Model model) {
        Outmigration outmigration = outmigrationService.getOutmigrationById(id);
        model.addAttribute("vo", outmigration);
        model.addAttribute("pageNum", pageNum);
        return "outmigration_edit";
    }
    // 新增异步校验方法
    @RequestMapping(value = "/checkName", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Boolean> checkName(@RequestParam("name") String name) {
        Map<String, Boolean> response = new HashMap<>();
        response.put("exists", outmigrationService.getOutmigrationByName(name) != null);
        return response;
    }

    @RequestMapping(value = "/checkNameExcludeId", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Boolean> checkNameExcludeId(
            @RequestParam("name") String name,
            @RequestParam("id") Integer id) {
        Map<String, Boolean> response = new HashMap<>();
        response.put("exists", outmigrationService.getOutmigrationByNameExcludeId(name, id) != null);
        return response;
    }
}