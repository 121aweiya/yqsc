package mr.yang.yqsc.controller;


import mr.yang.yqsc.common.JsonResult;
import mr.yang.yqsc.common.PageBean;
import mr.yang.yqsc.entity.AdminUser;
import mr.yang.yqsc.entity.News;
import mr.yang.yqsc.service.NewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * 新闻公告
 */
@Controller
@RequestMapping("/news")
public class NewsController {


    @Autowired
    private NewService newService;


    @RequestMapping("/list")
    public ModelAndView list(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
                             @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
                             @RequestParam(value = "newstitile", defaultValue = "") String newstitile
    ) {


        PageBean<News> pageBean = newService.findAll(pageNo, pageSize, newstitile);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/newslist");
        mv.addObject("pageBean", pageBean);
        mv.addObject("newstitile", newstitile);
        return mv;
    }

    //ADD页面
    @RequestMapping("/toAddPage")
    public ModelAndView toAddPage() {


        ModelAndView modelAndView = new ModelAndView("admin/newsadd");

        return modelAndView;
    }

    //添加
    @RequestMapping("/add")
    @ResponseBody
    public JsonResult add(News news, HttpSession session) {

        if (news.getNewstitle() == null || "".equals(news.getNewstitle())) {
            return new JsonResult(false, "标题不能为空");
        }

        AdminUser admin = (AdminUser) session.getAttribute("adminUserSession");

        if (admin == null || admin.getName() == null) return new JsonResult(false, "请选登录");

        news.setIsdel(0);
        news.setDeployname(admin.getName());
        news.setDeploytime(new Date(System.currentTimeMillis()));


        boolean f = newService.add(news);
        if (!f) {
            return new JsonResult(false, "添加失败");
        }
        return new JsonResult(true, "添加成功");
    }


    @RequestMapping("/toeditPage")
    public ModelAndView toeditPage(Integer id) {

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("id", id);
        modelAndView.addObject("news", newService.findById(id));

        modelAndView.setViewName("admin/newsupdate");

        return modelAndView;

    }

    //显示内容
    @RequestMapping("/showContent")
    public ModelAndView showContent(Integer id) {

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("news", newService.findById(id));

        //TODO
        modelAndView.setViewName("admin/newsShow");

        return modelAndView;

    }

    //修改
    @RequestMapping("/update")
    @ResponseBody
    public JsonResult update(News news) {

        boolean f = newService.update(news);
        if (!f) {
            return new JsonResult(false, "修改失败");
        }
        return new JsonResult(true, "修改成功");
    }


    //修改
    @RequestMapping("/delById")
    @ResponseBody
    public JsonResult delById(News news) {

        boolean f = newService.delById(news);
        if (!f) {
            return new JsonResult(false, "删除失败");
        }
        return new JsonResult(true, "删除成功");
    }


    //前台查
    @RequestMapping("/list1")
    public ModelAndView list1(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
                              @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
                              @RequestParam(value = "newstitile", defaultValue = "") String newstitile
    ) {


        PageBean<News> pageBean = newService.findAll(pageNo, pageSize, newstitile);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("pages/news");
        mv.addObject("pageBean", pageBean);
        mv.addObject("newstitile", newstitile);
        return mv;
    }

    //显示内容 前台
    @RequestMapping("/showContent1")
    public ModelAndView showContent1(Integer id) {

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("news", newService.findById(id));

        //TODO
        modelAndView.setViewName("pages/newsdetail");

        return modelAndView;

    }


}
