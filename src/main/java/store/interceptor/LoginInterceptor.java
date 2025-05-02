package store.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import store.bean.User;

public class LoginInterceptor implements HandlerInterceptor {

    private static final String LOGIN_USER_KEY = "loginUser";

    // 不需要登录就可以访问的路径
    private static final String[] ALLOWED_PATHS = {
            "/auth/toLogin",
            "/auth/login",
            "/auth/validationCode",
            "/auth/needValidationCode",
            "/register",
            "/css/",
            "/js/",
            "/img/"
    };

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {

        String requestURI = request.getRequestURI();
        String contextPath = request.getContextPath();

        // 先移除上下文路径前缀，保证匹配的准确性
        if (!contextPath.equals("") && requestURI.startsWith(contextPath)) {
            requestURI = requestURI.substring(contextPath.length());
        }

        // 检查是否是允许的路径
        for (String path : ALLOWED_PATHS) {
            // 对于目录路径使用startsWith，对于具体URI使用equals
            if (path.endsWith("/")) {
                if (requestURI.startsWith(path)) {
                    return true;
                }
            } else {
                if (requestURI.equals(path)) {
                    return true;
                }
            }
        }

        // 获取会话中的用户信息
        HttpSession session = request.getSession();
        User loginUser = (User) session.getAttribute(LOGIN_USER_KEY);

        // 如果用户未登录，重定向到登录页面
        if (loginUser == null) {
            response.sendRedirect(request.getContextPath() + "/auth/toLogin");
            return false;
        }

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        // 方法实现为空
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        // 方法实现为空
    }
}