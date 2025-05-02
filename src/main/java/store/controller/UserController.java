package store.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import store.bean.User;
import store.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

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
                    model.addAttribute("operationMessage", "用户添加成功！");
                    break;
                case "edit_success":
                    model.addAttribute("operationMessage", "用户修改成功！");
                    break;
                case "delete_success":
                    model.addAttribute("operationMessage", "用户删除成功！");
                    break;
                case "delete_fail":
                    model.addAttribute("operationMessage", "用户删除失败！");
                    break;
            }
        }
        // 确保页码不小于1
        if (pageNum < 1) {
            pageNum = 1;
        }

        // 创建查询条件
        User condition = new User();
        if (searchColumn != null && keyword != null && !keyword.isEmpty()) {
            if ("real_name".equals(searchColumn)) {
                condition.setRealName(keyword);
            } else if ("username".equals(searchColumn)) {
                condition.setUsername(keyword);
            } else if ("user_phone".equals(searchColumn)) {
                condition.setUserPhone(keyword);
            }
        }

        // 获取总记录数用于分页
        int totalCount;
        if (condition.getRealName() != null || condition.getUsername() != null || condition.getUserPhone() != null) {
            totalCount = userService.countUsersByCondition(condition);
        } else {
            totalCount = userService.countAllUsers();
        }

        // 计算总页数
        int totalPages = (totalCount + PAGE_SIZE - 1) / PAGE_SIZE;

        // 确保页码不超过总页数
        if (totalPages > 0 && pageNum > totalPages) {
            pageNum = totalPages;
        }

        // 计算分页起始索引
        int startIndex = (pageNum - 1) * PAGE_SIZE;

        // 获取分页用户列表（加入排序条件）
        List<User> userList;
        if (condition.getRealName() != null || condition.getUsername() != null || condition.getUserPhone() != null) {
            userList = userService.getUsersByConditionWithPagination(condition, startIndex, PAGE_SIZE);
        } else {
            userList = userService.getAllUsersWithPagination(startIndex, PAGE_SIZE);
        }
        // 设置分页相关属性
        model.addAttribute("list", userList);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalCount", totalCount);

        // 保留搜索条件和排序条件
        model.addAttribute("searchColumn", searchColumn);
        model.addAttribute("keyword", keyword);

        return "user_list";
    }

    @RequestMapping("/add")
    public String add(User user, HttpServletRequest request) {
        // 验证用户名
        if (user.getUsername() == null || user.getUsername().isEmpty()) {
            request.setAttribute("error", "用户名不能为空");
            return "user_add";
        }

        // 验证用户名是否存在
        if (userService.isUsernameExist(user.getUsername())) {
            request.setAttribute("error", "用户名已存在");
            return "user_add";
        }

        // 验证密码长度
        if (user.getPassword() == null || user.getPassword().length() < 8) {
            request.setAttribute("error", "密码长度不能少于8位");
            return "user_add";
        }

        // 验证手机号格式
        if (user.getUserPhone() == null || !user.getUserPhone().matches("^1[3-9]\\d{9}$")) {
            request.setAttribute("error", "请输入有效的11位手机号码");
            return "user_add";
        }

        user.setCreateBy("admin"); // 实际应该从session获取当前登录用户
        int result = userService.addUser(user);
        if (result > 0) {
            // 添加成功，设置成功消息
            return "redirect:/user/list?message=add_success";
        } else {
            request.setAttribute("error", "添加用户失败");
            return "user_add";
        }
    }

    @RequestMapping("/edit")
    public String edit(User user, HttpServletRequest request,
                      @RequestParam(value = "pageNum", defaultValue = "1") int pageNum){
        // 验证用户名
        if (user.getUsername() == null || user.getUsername().isEmpty()) {
            request.setAttribute("error", "用户名不能为空");
            // 重新获取用户信息
            User originalUser = userService.getUserById(user.getId());
            request.setAttribute("vo", originalUser);
            return "user_edit";
        }

        // 获取原始用户数据
        User originalUser = userService.getUserById(user.getId());

        // 检查用户名是否已被修改，如果修改了，需要检查唯一性
        if (!user.getUsername().equals(originalUser.getUsername())) {
            if (userService.isUsernameExist(user.getUsername())) {
                request.setAttribute("error", "用户名已存在");
                request.setAttribute("vo", originalUser);
                return "user_edit";
            }
        }

        // 验证密码长度
        if (user.getPassword() == null || user.getPassword().length() < 8) {
            request.setAttribute("error", "密码长度不能少于8位");
            request.setAttribute("vo", originalUser);
            return "user_edit";
        }

        // 验证手机号格式
        if (user.getUserPhone() == null || !user.getUserPhone().matches("^1[3-9]\\d{9}$")) {
            request.setAttribute("error", "请输入有效的11位手机号码");
            request.setAttribute("vo", originalUser);
            return "user_edit";
        }

        // 检查是否有实际修改
        boolean hasChanged = !user.getUsername().equals(originalUser.getUsername()) ||
                !user.getPassword().equals(originalUser.getPassword()) ||
                !user.getRealName().equals(originalUser.getRealName()) ||
                !user.getUserSex().equals(originalUser.getUserSex()) ||
                !user.getUserPhone().equals(originalUser.getUserPhone()) ||
                // 备注可能为null，需要特殊处理
                (user.getUserText() == null && originalUser.getUserText() != null) ||
                (user.getUserText() != null && !user.getUserText().equals(originalUser.getUserText())) ||
                !user.getUserType().equals(originalUser.getUserType());

        if (!hasChanged) {
            request.setAttribute("error", "未做任何修改，无需提交");
            request.setAttribute("vo", originalUser);
            return "user_edit";
        }

        int result = userService.updateUser(user);
        if (result > 0) {
            // 修改成功，设置成功消息

            return "redirect:/user/list?message=edit_success&pageNum=" + pageNum;

        } else {
            request.setAttribute("error", "更新用户失败");
            request.setAttribute("vo", originalUser);
            return "user_edit";
        }
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam("id") Integer id,
                        @RequestParam(value = "pageNum", defaultValue = "1") int pageNum){
        int result = userService.deleteUser(id);
        if (result > 0) {
            return "redirect:/user/list?message=delete_success&pageNum=" + pageNum;
        } else {
            return "redirect:/user/list?message=delete_success&pageNum=" + pageNum;
        }
    }
    @RequestMapping("/info")
    public String info(@RequestParam("id") Integer id, Model model) {
        User user = userService.getUserById(id);
        model.addAttribute("vo", user);
        return "user_info";
    }

    @RequestMapping("/toAdd")
    public String toAdd() {
        return "user_add";
    }

    @RequestMapping("/toEdit")
    public String toEdit(@RequestParam("id") Integer id,
                        @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
                        Model model) {
                User user = userService.getUserById(id);
                model.addAttribute("vo", user);
                model.addAttribute("pageNum", pageNum);
        return "user_edit";
    }

    @ResponseBody
    @RequestMapping(value = "/checkUsername", method = RequestMethod.POST)
    public String checkUsername(@RequestParam("username") String username) {
        boolean exists = userService.isUsernameExist(username);
        return exists ? "false" : "true";
    }
}