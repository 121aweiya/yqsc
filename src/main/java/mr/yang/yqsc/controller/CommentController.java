package mr.yang.yqsc.controller;


import mr.yang.yqsc.common.JsonResult;
import mr.yang.yqsc.common.PageBean;
import mr.yang.yqsc.entity.Comment;
import mr.yang.yqsc.entity.News;
import mr.yang.yqsc.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/comments")
public class CommentController {

    @Autowired
    private CommentService commentService;

    @RequestMapping("/list")
    public ModelAndView list(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
                             @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
                             @RequestParam(value = "content", defaultValue = "") String content
    ) {


        PageBean<Comment> pageBean = commentService.findAll(pageNo, pageSize,content);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/commentslist");
        mv.addObject("pageBean", pageBean);
        mv.addObject("content", content);
        return mv;
    }



    //删除
    @RequestMapping("/delById")
    @ResponseBody
    public JsonResult delById(Comment comment) {

        boolean f = commentService.delById(comment);
        if (!f) {
            return new JsonResult(false, "删除失败");
        }
        return new JsonResult(true, "删除成功");
    }





}
