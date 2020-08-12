package mr.yang.yqsc.controller;


import mr.yang.yqsc.common.JsonResult;
import mr.yang.yqsc.common.PageBean;
import mr.yang.yqsc.entity.Fangwei;
import mr.yang.yqsc.entity.Yueqi;
import mr.yang.yqsc.service.FangWeiService;
import mr.yang.yqsc.service.YueqiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/fwcx")
public class FwxcController {


    @Autowired
    private FangWeiService fangWeiService;

    @Autowired
    private YueqiService yueqiService;

    @RequestMapping("/list")
    public ModelAndView list(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
                             @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize) {
        //跳转页面
        PageBean<Fangwei> pageBean = fangWeiService.findAll(pageNo, pageSize);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/admin/fwmlist");
        mv.addObject("pageBean", pageBean);
        return mv;
    }

    @RequestMapping("/toAddPage")
    public ModelAndView toAddPage() {

        List<Yueqi> all = yueqiService.findAll();

        ModelAndView mv = new ModelAndView("admin/fwmadd");
        mv.addObject("yqlist", all);
        return mv;
    }


    @RequestMapping("/delById")
    @ResponseBody
    public JsonResult delByid(Integer id) {
        boolean b = fangWeiService.delById(id);
        return new JsonResult(b);
    }

    @RequestMapping("/scfw")
    @ResponseBody
    public JsonResult scfw(@RequestParam(value = "yqname", defaultValue = "NOSELECT") String yqname) {
        if ("NOSELECT".equals(yqname)) {
            return new JsonResult(false);
        }
        boolean b = fangWeiService.add(yqname);
        if (b == false) return new JsonResult(false);
        return new JsonResult(true);
    }

    //
    @RequestMapping("/check")
    @ResponseBody
    public JsonResult check(@RequestParam(value = "serialNum", defaultValue = "") String serialNum) {
        if ("".equals(serialNum) || (!serialNum.startsWith("FW"))) {
            return new JsonResult(false);
        }
        Fangwei fangwei = fangWeiService.check(serialNum);


        if (fangwei == null) return new JsonResult(false);
        return new JsonResult(true, fangwei.getQname());
    }





}
