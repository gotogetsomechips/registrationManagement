package store.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import store.bean.User;
import store.service.UserService;

@Controller
@RequestMapping("/auth")
public class AuthController {

    private static final String VALIDATION_CODE_KEY = "VALIDATION_CODE";
    private static final String LOGIN_USER_KEY = "loginUser";
    private static final int MAX_LOGIN_ATTEMPTS = 6; // 最大登录尝试次数
    private static final int VALIDATION_CODE_THRESHOLD = 3; // 显示验证码的阈值

    @Autowired
    private UserService userService;

    /**
     * 登录页面
     */
    @RequestMapping("/toLogin")
    public String toLogin() {
        return "login";
    }

    /**
     * 登录处理
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            @RequestParam(value = "validationCode", required = false) String validationCode,
            HttpServletRequest request, HttpServletResponse response) {
        
        HttpSession session = request.getSession();
        
        // 获取用户信息
        User user = userService.getUserByUsername(username);
        
        // 如果用户不存在
        if (user == null) {
            request.setAttribute("alert_msg", "用户名不存在");
            return "login";
        }
        
        // 检查用户是否被锁定
        if (user.getTryCount() != null && user.getTryCount() >= MAX_LOGIN_ATTEMPTS) {
            request.setAttribute("alert_msg", "账户已被锁定，请联系管理员解锁");
            return "login";
        }
        
        // 检查是否需要验证码
        boolean needValidationCode = user.getTryCount() != null && user.getTryCount() >= VALIDATION_CODE_THRESHOLD;
        
        // 如果需要验证码但没有提供或验证码错误
        if (needValidationCode) {
            String sessionValidationCode = (String) session.getAttribute(VALIDATION_CODE_KEY);
            if (validationCode == null || !validationCode.equalsIgnoreCase(sessionValidationCode)) {
                request.setAttribute("alert_msg", "验证码错误");
                incrementLoginAttempts(user);
                return "login";
            }
        }
        
        // 验证密码
        if (!password.equals(user.getPassword())) {
            incrementLoginAttempts(user);
            
            String msg = "密码错误";
            if (user.getTryCount() >= VALIDATION_CODE_THRESHOLD) {
                msg += "，请输入验证码";
            }
            if (user.getTryCount() >= MAX_LOGIN_ATTEMPTS) {
                msg = "账户已被锁定，请联系管理员解锁";
            }
            
            request.setAttribute("alert_msg", msg);
            return "login";
        }
        
        // 登录成功，重置登录尝试次数
        user.setTryCount(0);
        userService.updateUser(user);
        
        // 将用户信息存入会话
        session.setAttribute(LOGIN_USER_KEY, user);
        
        // 登录成功，重定向到主页
        return "redirect:/index";
    }

    /**
     * 增加登录尝试次数
     */
    private void incrementLoginAttempts(User user) {
        if (user.getTryCount() == null) {
            user.setTryCount(1);
        } else {
            user.setTryCount(user.getTryCount() + 1);

            // 当尝试次数达到最大值时，设置status为0（锁定状态）
            if (user.getTryCount() >= MAX_LOGIN_ATTEMPTS) {
                user.setStatus(0); // 0表示锁定状态
            }
        }
        userService.updateUser(user);
    }
    /**
     * 生成验证码
     */
    @RequestMapping("/validationCode")
    public void generateValidationCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 创建验证码图片
        int width = 100;
        int height = 30;
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        
        // 获取图形上下文
        Graphics g = image.getGraphics();
        
        // 生成随机类
        Random random = new Random();
        
        // 设置背景颜色
        g.setColor(Color.WHITE);
        g.fillRect(0, 0, width, height);
        
        // 设置字体
        g.setFont(new Font("Times New Roman", Font.BOLD, 24));
        
        // 生成随机验证码
        StringBuilder validationCode = new StringBuilder();
        for (int i = 0; i < 4; i++) {
            String rand = String.valueOf(random.nextInt(10));
            validationCode.append(rand);
            
            // 将验证码显示到图像中
            g.setColor(new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255)));
            g.drawString(rand, 20 * i + 10, 20);
        }
        
        // 添加干扰线
        for (int i = 0; i < 5; i++) {
            g.setColor(new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255)));
            g.drawLine(random.nextInt(width), random.nextInt(height), 
                       random.nextInt(width), random.nextInt(height));
        }
        
        // 将验证码存入会话
        request.getSession().setAttribute(VALIDATION_CODE_KEY, validationCode.toString());
        
        // 图像生效
        g.dispose();
        
        // 输出图像到页面
        ImageIO.write(image, "JPEG", response.getOutputStream());
    }

    /**
     * 检查是否需要验证码
     */
    @ResponseBody
    @RequestMapping("/needValidationCode")
    public String needValidationCode(@RequestParam("username") String username) {
        User user = userService.getUserByUsername(username);
        if (user != null && user.getTryCount() != null && user.getTryCount() >= VALIDATION_CODE_THRESHOLD) {
            return "true";
        }
        return "false";
    }

    /**
     * 退出登录
     */
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        request.getSession().removeAttribute(LOGIN_USER_KEY);
        return "redirect:/auth/toLogin";
    }
}