package store.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import store.bean.User;
import store.service.UserService;

@Controller
@RequestMapping("/register")
public class RegisterController {

    @Autowired
    private UserService userService;

    /**
     * 显示注册页面
     */
    @RequestMapping(method = RequestMethod.GET)
    public String showRegisterPage() {
        return "register";
    }

    /**
     * 处理注册请求
     */
    @RequestMapping(method = RequestMethod.POST)
    public String processRegistration(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            @RequestParam("realName") String realName,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes) {

        // 验证用户名
        if (username == null || username.trim().isEmpty()) {
            request.setAttribute("alert_msg", "用户名不能为空");
            return "register";
        }

        // 验证用户名是否存在
        if (userService.isUsernameExist(username)) {
            request.setAttribute("alert_msg", "用户名已存在");
            return "register";
        }

        // 验证密码长度
        if (password == null || password.length() < 8) {
            request.setAttribute("alert_msg", "密码长度不能少于8位");
            return "register";
        }

        // 验证真实姓名
        if (realName == null || realName.trim().isEmpty()) {
            request.setAttribute("alert_msg", "真实姓名不能为空");
            return "register";
        }

        // 创建用户对象
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setRealName(realName);
        user.setUserType("普通用户"); // 默认为普通用户
        user.setStatus(1); // 状态正常
        user.setTryCount(0); // 初始化尝试次数
        user.setCreateBy("self_register"); // 标记为自注册

        // 保存用户
        int result = userService.addUser(user);

        if (result > 0) {
            // 注册成功，重定向到登录页面
            redirectAttributes.addFlashAttribute("alert_msg", "注册成功，请登录");
            return "redirect:/auth/toLogin";
        } else {
            // 注册失败
            request.setAttribute("alert_msg", "注册失败，请稍后重试");
            return "register";
        }
    }
}