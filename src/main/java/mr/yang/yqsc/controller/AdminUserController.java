package mr.yang.yqsc.controller;


import mr.yang.yqsc.common.JsonResult;
import mr.yang.yqsc.common.MD5Util;
import mr.yang.yqsc.entity.AdminUser;
import mr.yang.yqsc.mapper.AdminUserDao;
import mr.yang.yqsc.service.AdminUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminUserController {

    @Autowired
    private AdminUserService adminUserService;

    @Autowired
    private AdminUserDao adminUserDao;

    @RequestMapping(value = "/loginIn", method = RequestMethod.POST)
    @ResponseBody
    public JsonResult loginAdmin(AdminUser adminUser, HttpSession session) {


        System.out.println(adminUser);

        AdminUser ad = adminUserService.login(adminUser);

        System.out.println(ad);
        if (ad == null) {
            return new JsonResult(false, "用户不存在或账号密码错误");
        } else {
            if (ad.getStatus() != 1) {
                return new JsonResult(false, "用户未启用");
            } else {
                session.setAttribute("adminUserSession", ad);
                return new JsonResult(true, "登录成功");
            }
        }


        // return new ModelAndView("/admin/login");
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session, SessionStatus sessionStatus) {
        session.removeAttribute("adminUserSession");
        sessionStatus.setComplete();
        return "admin/login";
    }

    @RequestMapping("/index")
    public String toIndex(HttpSession session, Model model) {

        AdminUser adminUser = (AdminUser) session.getAttribute("adminUserSession");

        if(adminUser == null) return "admin/login";

        return "admin/index";
    }

    @RequestMapping("/login")
    public String toLogin() {
        return "admin/login";
    }
    @RequestMapping("/toadminList")
    public String toadminList() {
        return "admin/adminlist";
    }


    //删除id
    @RequestMapping("/delbyids")
    @ResponseBody
    public JsonResult delbyids( Integer[] ids) {
        //TODO
        if (ids != null && ids.length > 0){
            adminUserService.delByIds(ids);
        }
        return new JsonResult(true);
    }

    //更新
    @RequestMapping("/updateAdmin")
    @ResponseBody
    public JsonResult updateAdmin(AdminUser adminUser) {


        System.out.println(adminUser);

        boolean b = adminUserService.update(adminUser);

        return new JsonResult(b,"");
    }

    //查询
    @RequestMapping("/queryAdmin")
    public ModelAndView queryAdmin() {
        //TODO
        ModelAndView mv = new ModelAndView("admin/adminlist");
        mv.addObject("adminLists",adminUserService.findAll());
        return mv;
    }

    //停用 启用
    @RequestMapping("/stopAdmin")
    @ResponseBody
    public JsonResult stopAdmin(AdminUser adminUser) {
        boolean b = adminUserService.updateStatus(adminUser);

        if(b){
            return new JsonResult(true,"成功");
        }

        return new JsonResult(false,"失败");
    }

    //修改密码
    @RequestMapping("/updateAdminPwd")
    @ResponseBody
    public JsonResult updateAdminPwd(@RequestParam Map<String,String> map) {
//        System.out.println(map.keySet());
       // [aid, oldpass, newpass, repass]
        String aid = map.get("aid");
        String oldpass = map.get("oldpass");
        String repass = map.get("repass");
        String newpass = map.get("newpass");
        boolean b = false;
        if(repass.equals(newpass)){
             b = adminUserService.updatePwd(Integer.parseInt(aid),newpass,oldpass);
        }


        return new JsonResult(b,"成功");
    }


    //添加页
    @RequestMapping("/toAddAdminView")
    public String toAddAdminView() {
        //TODO
        return "admin/adminadd";
    }

    //修改页
    @RequestMapping("/toupdateAdminView")
    public ModelAndView toupdateAdminView(Integer aid) {

        AdminUser user = adminUserService.findByid(aid);
        //TODO
        return new ModelAndView("admin/adminup").addObject("updateUser",user);
    }

    //密码页
    @RequestMapping("/toAdminpass")
    public ModelAndView topass(Integer aid) {
        //TODO

        return new ModelAndView("admin/adminpassword").addObject("aid",aid);
    }



    //修改密码
    @RequestMapping("/insertAdmin")
    @ResponseBody
    public JsonResult insertAdmin(AdminUser adminUser) {
        boolean b = false;

        b = adminUserService.insertAdmin(adminUser);



        return new JsonResult(b,"");
    }


    //
    //test
    @RequestMapping("/tt")
    @ResponseBody
    public JsonResult tt(@RequestParam("username")String username) {

        System.out.println("测试空格");
        System.out.println(adminUserDao.findByUsernameLike(username));

        return new JsonResult(true);



    }








}
