package mr.yang.yqsc.controller;


import mr.yang.yqsc.common.PageBean;
import mr.yang.yqsc.entity.*;
import mr.yang.yqsc.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 前台
 */

@Controller
@RequestMapping("/pages")
public class FrontController {


    @Autowired
    private CategoryService categoryService;

    @Autowired
    private YueqiService yueqiService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private MemberSerivce memberSerivce;


    @Autowired
    private MyOderService myOderService;


    //首页
    @RequestMapping("/list")
    public ModelAndView list() {
        ModelAndView mv = new ModelAndView("pages/index");
        List<Category> categories = categoryService.findAll();
        mv.addObject("categories", categories);//类别
        PageBean<Yueqi> pageBean = yueqiService.findAllToAdmin(1, 10, "", -1, 1, -1);
        mv.addObject("pageBean", pageBean);


        return mv;
    }


    //全部
    @RequestMapping("/alllist")
    public ModelAndView list(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
                             @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
                             @RequestParam(value = "catId", defaultValue = "-1") Integer catId,
                             @RequestParam(value = "yname", defaultValue = "") String yname,
                             @RequestParam(value = "isHot", defaultValue = "-1") Integer isHot) {
        //跳转页面
        if (pageNo <= 0) pageNo = 1;
        PageBean<Yueqi> pageBean = yueqiService.findAllToAdmin(pageNo, pageSize, yname, catId, 1, isHot);
        ModelAndView mv = new ModelAndView("pages/allList");
        List<Category> categories = categoryService.findAll();
        mv.addObject("categories", categories);//类别
        mv.addObject("pageBean", pageBean);
        mv.addObject("catId", catId);
        mv.addObject("yname", yname);
        mv.addObject("isHot", isHot);
        return mv;
    }

    //详情
    @RequestMapping("/detail")
    public ModelAndView deltail(@RequestParam(value = "yqid", defaultValue = "1") Integer yqid) {
        //跳转页面
        ModelAndView mv = new ModelAndView("pages/detail");

        Yueqi yueqi = yueqiService.findByIdForDetail(yqid);
        mv.addObject("detail", yueqi);

        //TODO 评论
        List<Comment> comments = commentService.findByYid(yqid);
        mv.addObject("comments", comments);
        return mv;
    }

    //详价
    @RequestMapping("/pj")
    @ResponseBody
    public Map<String, Object> pj(@RequestParam(value = "yqid", defaultValue = "-1") Integer yqid,
                                  @RequestParam(value = "cont", defaultValue = "-1") String cont,
                                  HttpSession session) {
        //跳转页面
        Map<String, Object> map = new HashMap<>();


        Comment comment = new Comment();
        if (yqid <= 0 || "".equals(cont)){
            map.put("code",-1);
            map.put("msg","评论失败。");
            return map;
        }

        comment.setPid(yqid);//yqid

        Member member = (Member) session.getAttribute("memberSession");


        if(member == null || member.getMid() == null) {
            map.put("code",-1);
            map.put("msg","评论失败。请先登录");
            return map;
        }

        comment.setMid(member.getMid());

        comment.setContents(cont);

        comment.setIsdel(0);

        boolean b = commentService.add(comment);

        if(b){
            map.put("code",200);
            map.put("msg","评论成功");

        }else {
            map.put("code",-1);
            map.put("msg","评论失败");
        }

        return map;
    }


    //个人中心-个人信息
    @RequestMapping("/memberinfo")
    public ModelAndView memberinfo(@RequestParam(value = "mid", defaultValue = "-1") Integer mid) {
        if(mid==-1) return new ModelAndView("404");
        //跳转页面
        ModelAndView mv = new ModelAndView("pages/memberinfo");

        Member m = memberSerivce.findMemberByMid(mid);
        mv.addObject("member",m);
        return mv;
    }

    //个人中心-订单
    @RequestMapping("/orderinfo")
    public ModelAndView gotoOrderinfo(HttpSession session) {
        Member member = (Member) session.getAttribute("memberSession");


        if(member == null || member.getMid() == null) {
            return new ModelAndView("404");
        }

        //跳转页面
        ModelAndView mv = new ModelAndView("pages/orderinfo");
        List<MyOrder> orders = myOderService.findByMemberId(member.getMid());
        mv.addObject("orders",orders);
        return mv;
    }


}
