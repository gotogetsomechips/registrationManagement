package store.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import store.bean.Household;
import store.service.HouseholdService;

@Controller
@RequestMapping("/household")
public class HouseholdController {

    @Autowired
    private HouseholdService householdService;

    // 每页显示的记录数
    private static final int PAGE_SIZE = 10;
    @PostMapping("/checkNameExists")
    @ResponseBody
    public String checkNameExists(@RequestParam("householdName") String householdName,
                                  @RequestParam(value = "excludeId", required = false) Integer excludeId) {
        // 检查姓名是否已存在
        boolean exists = householdService.isHouseholdNameExists(householdName, excludeId);
        return Boolean.toString(exists);
    }
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
                    model.addAttribute("operationMessage", "户籍添加成功！");
                    break;
                case "edit_success":
                    model.addAttribute("operationMessage", "户籍修改成功！");
                    break;
                case "delete_success":
                    model.addAttribute("operationMessage", "户籍删除成功！");
                    break;
                case "delete_fail":
                    model.addAttribute("operationMessage", "户籍删除失败！");
                    break;
            }
        }

        // 确保页码不小于1
        if (pageNum < 1) {
            pageNum = 1;
        }

        // 创建查询条件
        Household condition = new Household();
        if (searchColumn != null && keyword != null && !keyword.isEmpty()) {
            if ("household_name".equals(searchColumn)) {
                condition.setHouseholdName(keyword);
            } else if ("phone".equals(searchColumn)) {
                condition.setPhone(keyword);
            } else if ("district".equals(searchColumn)) {
                condition.setDistrict(keyword);
            }
        }

        // 获取总记录数用于分页
        int totalCount;
        if (condition.getHouseholdName() != null || condition.getPhone() != null || condition.getDistrict() != null) {
            totalCount = householdService.countHouseholdsByCondition(condition);
        } else {
            totalCount = householdService.countAllHouseholds();
        }

        // 计算总页数
        int totalPages = (totalCount + PAGE_SIZE - 1) / PAGE_SIZE;

        // 确保页码不超过总页数
        if (totalPages > 0 && pageNum > totalPages) {
            pageNum = totalPages;
        }

        // 计算分页起始索引
        int startIndex = (pageNum - 1) * PAGE_SIZE;

        // 获取分页户籍列表
        List<Household> householdList;
        if (condition.getHouseholdName() != null || condition.getPhone() != null || condition.getDistrict() != null) {
            householdList = householdService.getHouseholdsByConditionWithPagination(condition, startIndex, PAGE_SIZE);
        } else {
            householdList = householdService.getAllHouseholdsWithPagination(startIndex, PAGE_SIZE);
        }

        // 设置分页相关属性
        model.addAttribute("list", householdList);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalCount", totalCount);

        // 保留搜索条件
        model.addAttribute("searchColumn", searchColumn);
        model.addAttribute("keyword", keyword);

        return "household_list";
    }

    @RequestMapping("/add")
    public String add(Household household, HttpServletRequest request) {
        // 验证姓名
        if (household.getHouseholdName() == null || household.getHouseholdName().isEmpty()) {
            request.setAttribute("error", "姓名不能为空");
            return "household_add";
        }

        // 验证手机号格式
        if (household.getPhone() == null || !household.getPhone().matches("^1[3-9]\\d{9}$")) {
            request.setAttribute("error", "请输入有效的11位手机号码");
            return "household_add";
        }

        household.setCreateBy("admin"); // 实际应该从session获取当前登录用户
        int result = householdService.addHousehold(household);
        if (result > 0) {
            // 添加成功，设置成功消息
            return "redirect:/household/list?message=add_success";
        } else {
            request.setAttribute("error", "添加户籍失败");
            return "household_add";
        }
    }

    @RequestMapping("/edit")
    public String edit(Household household, HttpServletRequest request,
                      @RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
        // 验证姓名
        if (household.getHouseholdName() == null || household.getHouseholdName().isEmpty()) {
            request.setAttribute("error", "姓名不能为空");
            // 重新获取户籍信息
            Household originalHousehold = householdService.getHouseholdById(household.getId());
            request.setAttribute("vo", originalHousehold);
            return "household_edit";
        }

        // 验证手机号格式
        if (household.getPhone() == null || !household.getPhone().matches("^1[3-9]\\d{9}$")) {
            request.setAttribute("error", "请输入有效的11位手机号码");
            Household originalHousehold = householdService.getHouseholdById(household.getId());
            request.setAttribute("vo", originalHousehold);
            return "household_edit";
        }

        // 获取原始户籍数据
        Household originalHousehold = householdService.getHouseholdById(household.getId());

        // 检查是否有实际修改
        boolean hasChanged = !household.getHouseholdName().equals(originalHousehold.getHouseholdName()) ||
                !household.getGender().equals(originalHousehold.getGender()) ||
                !household.getPhone().equals(originalHousehold.getPhone()) ||
                !household.getDistrict().equals(originalHousehold.getDistrict()) ||
                !household.getHouseNumber().equals(originalHousehold.getHouseNumber()) ||
                !household.getUnit().equals(originalHousehold.getUnit()) ||
                !household.getHouseType().equals(originalHousehold.getHouseType()) ||
                (household.getRemark() == null && originalHousehold.getRemark() != null) ||
                (household.getRemark() != null && !household.getRemark().equals(originalHousehold.getRemark()));

        if (!hasChanged) {
            request.setAttribute("error", "未做任何修改，无需提交");
            request.setAttribute("vo", originalHousehold);
            return "household_edit";
        }

        int result = householdService.updateHousehold(household);
        if (result > 0) {
            // 修改成功，设置成功消息
            return "redirect:/household/list?message=edit_success&pageNum=" + pageNum;
        } else {
            request.setAttribute("error", "更新户籍失败");
            request.setAttribute("vo", originalHousehold);
            return "household_edit";
        }
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("id") Integer id,
                        @RequestParam(value = "pageNum", defaultValue = "1") int pageNum) {
        int result = householdService.deleteHousehold(id);
        if (result > 0) {
            return "redirect:/household/list?message=delete_success&pageNum=" + pageNum;
        } else {
            return "redirect:/household/list?message=delete_fail&pageNum=" + pageNum;
        }
    }

    @RequestMapping("/info")
    public String info(@RequestParam("id") Integer id, Model model) {
        Household household = householdService.getHouseholdById(id);
        model.addAttribute("vo", household);
        return "household_info";
    }

    @RequestMapping("/toAdd")
    public String toAdd() {
        return "household_add";
    }

    @RequestMapping("/toEdit")
    public String toEdit(@RequestParam("id") Integer id,
                        @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                        Model model) {
        Household household = householdService.getHouseholdById(id);
        model.addAttribute("vo", household);
        model.addAttribute("pageNum", pageNum);
        return "household_edit";
    }
}