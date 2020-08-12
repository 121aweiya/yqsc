package mr.yang.yqsc.common;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 登录拦截器
 */
public class LoginInterceptor implements HandlerInterceptor {

    private String[] allowURLs;

    public String[] getAllowURLs() {
        return allowURLs;
    }

    public void setAllowURLs(String[] allowURLs) {
        this.allowURLs = allowURLs;
    }


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        String path = request.getServletPath();
        for (String url : allowURLs) {
            if (path.contains(url)) {
                return true;
            }
        }


        if(path.contains("admin")){
            //后台
            if (session.getAttribute("adminUserSession") == null) {
                response.sendRedirect(request.getContextPath() + "/admin/login");
                return false;
            }
            return true;
        }else {


            //公共业务处在后台。放行
            if (session.getAttribute("adminUserSession") != null) {
                return true;
            }


            //公共业务处在前台，部分禁止
            //TODO

            //前台
           /* if (session.getAttribute("memberSession") == null) {
               response.sendRedirect(request.getContextPath() + "/front/login");
                return false;
            }*/
        }



        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
