package mr.yang.yqsc.controller;


import mr.yang.yqsc.common.JsonResult;
import mr.yang.yqsc.common.PageBean;
import mr.yang.yqsc.entity.Member;
import mr.yang.yqsc.service.MemberSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    private MemberSerivce memberSerivce;

    /*@RequestMapping("/list")
    @ResponseBody
    public List<Member> findAll(){

       return memberSerivce.findAll();
    }*/

    @RequestMapping("/list")
    public ModelAndView list(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
                             @RequestParam(value = "pageSize", defaultValue = "2") Integer pageSize,
                             @RequestParam(value = "mname", defaultValue = "") String mname) {
        //跳转页面

        PageBean<Member> pageBean = memberSerivce.findAll(pageNo, pageSize, mname);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/admin/memberlist");
        mv.addObject("pageBean", pageBean);
        mv.addObject("mname", mname);
        return mv;
    }

    @RequestMapping("/toAddMemberPage")
    public String toAddPage() {

        return "admin/memberadd";
    }

    @RequestMapping("/insertMember")
    @ResponseBody
    public JsonResult saveMember(Member member) {

        if(member.getMoney()==null) member.setMoney(0.0);
        boolean b = memberSerivce.save(member);

        return new JsonResult(b, "");
    }

    @RequestMapping("/toUpdateMemberPage")
    public ModelAndView toUpatePage(Integer mid) {

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/memberupdate");
        Member m = memberSerivce.findMemberByMid(mid);
        modelAndView.addObject("member", m);

        return modelAndView;
    }

    @RequestMapping("/updateMember")
    @ResponseBody
    public JsonResult updateMember(Member member){
        boolean b = memberSerivce.update(member);

        return new JsonResult(b, "");
    }


    @RequestMapping("/delByid")
    @ResponseBody
    public JsonResult delByid(Integer mid){
        boolean b = memberSerivce.delByid(mid);
        return new JsonResult(b);
    }

    @RequestMapping("toChongzhi")
    public ModelAndView toChongzhiPage(Integer mid){

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/chongzhi");
        modelAndView.addObject("member",memberSerivce.findMemberByMid(mid));

        return modelAndView;
    }


    @RequestMapping(value = "/login")
    @ResponseBody
    public JsonResult loginAdmin(Member member, HttpSession session) {




        Member m = memberSerivce.login(member);

        if (m == null) {
            return new JsonResult(false, "用户不存在或账号密码错误");
        } else {
            session.setAttribute("memberSession", m);
            return new JsonResult(true, "登录成功");

        }



        // return new ModelAndView("/admin/login");
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session, SessionStatus sessionStatus) {
        session.removeAttribute("memberSession");
        sessionStatus.setComplete();
        return "redirect:/pages/list";
    }




}
