package mr.yang.yqsc.controller;


import mr.yang.yqsc.common.JsonResult;
import mr.yang.yqsc.common.LoggerUtils;
import mr.yang.yqsc.common.PageBean;
import mr.yang.yqsc.entity.Yueqi;
import mr.yang.yqsc.service.CategoryService;
import mr.yang.yqsc.service.YueqiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.UUID;

@Controller
@RequestMapping("/yueqi")
public class YueqiController {


    @Autowired
    private YueqiService yueqiService;

    @Autowired
    private CategoryService categoryService;


    @RequestMapping("/list1")
    public ModelAndView list(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
                             @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
                             @RequestParam(value = "catId", defaultValue = "-1") Integer catId,
                             @RequestParam(value = "yname", defaultValue = "") String yname,
                             @RequestParam(value = "isShow", defaultValue = "-1") Integer isShow,
                             @RequestParam(value = "isHot", defaultValue = "-1") Integer isHot) {
        //跳转页面

        if(pageNo <=0) pageNo=1;
        PageBean<Yueqi> pageBean = yueqiService.findAllToAdmin(pageNo, pageSize, yname, catId, isShow, isHot);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/admin/yueqilist");
        mv.addObject("pageBean", pageBean);
        mv.addObject("catId", catId);
        mv.addObject("yname", yname);
        mv.addObject("isShow", isShow);
        mv.addObject("isHot", isHot);
        mv.addObject("cats", categoryService.findAll());
        return mv;
    }


    @RequestMapping("/toAddDesPage")
    public ModelAndView toAddDesPage(Integer id) {

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("id", id);
        modelAndView.addObject("yq", yueqiService.findById(id));

        modelAndView.setViewName("admin/addDescription");

        return modelAndView;

    }


    //修改描述
    @RequestMapping("/updateDes")
    @ResponseBody
    public JsonResult updateDes(@RequestParam(value = "id", defaultValue = "-1") Integer id,
                                @RequestParam(value = "des", defaultValue = "") String des) {

        if (id == -1 || "".equals(des)) return new JsonResult(false);
        boolean f = yueqiService.updateDesById(id, des);

        return new JsonResult(f);
    }


    //删除
    @RequestMapping("/delById")
    @ResponseBody
    public JsonResult delById(@RequestParam(value = "id", defaultValue = "-1") Integer id) {

        if (id == -1) return new JsonResult(false);
        boolean f = yueqiService.delById(id);

        return new JsonResult(f);
    }

    //上下架
    @RequestMapping("/sjxj")
    @ResponseBody
    public JsonResult sjxj(@RequestParam(value = "type", defaultValue = "-1") Integer type,
                           @RequestParam(value = "id", defaultValue = "-1") Integer id) {

        if (id == -1 || type == -1) return new JsonResult(false);
        boolean f = yueqiService.UpdateSjxj(type, id);

        return new JsonResult(f);
    }

    //热买
    @RequestMapping("/updateHot")
    @ResponseBody
    public JsonResult updateHot(@RequestParam(value = "type", defaultValue = "-1") Integer type,
                                @RequestParam(value = "id", defaultValue = "-1") Integer id) {

        if (id == -1 || type == -1) return new JsonResult(false);
        boolean f = yueqiService.UpdateHot(type, id);

        return new JsonResult(f);
    }


    //添加
    @RequestMapping("/add")
    @ResponseBody
    public JsonResult add(Yueqi yueqi) {

        if (yueqi.getCategoryid() == null || "".equals(yueqi.getYqname())) {
            return new JsonResult(false, "乐器名字或类别不能为空");
        }

        String uuid = UUID.randomUUID().toString().replace("-", "");
        yueqi.setYqnum(uuid);
        yueqi.setIshot(0);
        yueqi.setIsshow(0);
        yueqi.setIsdel(0);
        yueqi.setCreatetime(new Date(System.currentTimeMillis()));

        LoggerUtils.warmming(YueqiController.class, yueqi.toString());

        boolean f = yueqiService.add(yueqi);
        if (!f) {
            return new JsonResult(false, "添加失败");
        }
        return new JsonResult(true, "添加成功");
    }

    //ADD页面
    @RequestMapping("/toAddYueqiPage")
    public ModelAndView toAddYueqiPage() {


        ModelAndView modelAndView = new ModelAndView("admin/yueqiadd");

        modelAndView.addObject("cats", categoryService.findAll());


        return modelAndView;
    }


    //UPDATE页面
    @RequestMapping("/toUpdateYueqiPage")
    public ModelAndView toUpdateYueqiPage(@RequestParam(value = "id", defaultValue = "-1") Integer id) {


        Yueqi yueqi = yueqiService.findById(id);

        ModelAndView modelAndView = new ModelAndView("admin/yueqiupdate");

        modelAndView.addObject("yq",yueqi);
        modelAndView.addObject("cats", categoryService.findAll());

        return modelAndView;
    }


    //修改
    @RequestMapping("/update")
    @ResponseBody
    public JsonResult update(Yueqi yueqi) {

        boolean f = yueqiService.update(yueqi);
        if (!f) {
            return new JsonResult(false, "修改失败");
        }
        return new JsonResult(true, "修改成功");
    }

}
