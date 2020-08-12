package mr.yang.yqsc.controller;


import mr.yang.yqsc.common.JsonResult;
import mr.yang.yqsc.common.PageBean;
import mr.yang.yqsc.entity.Category;
import mr.yang.yqsc.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/list")
    public ModelAndView list(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
                             @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
                             @RequestParam(value = "categoryName", defaultValue = "") String categoryName) {
        //跳转页面

        PageBean<Category> pageBean = categoryService.findAll(pageNo, pageSize, categoryName);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/admin/categorylist");
        mv.addObject("pageBean", pageBean);
        mv.addObject("categoryName", categoryName);
        return mv;
    }

    @RequestMapping("/toUpadePage")
    public ModelAndView toUpatePage(Integer id) {

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/xxx");
        Category m = categoryService.findByid(id);
        modelAndView.addObject("cat", m);

        return modelAndView;
    }


    @RequestMapping("/toAddPage")
    public String toAddPage() {

        return "admin/categoryadd";
    }

    @RequestMapping("/insertCat")
    @ResponseBody
    public JsonResult insertCat(Category category) {

        boolean b = categoryService.save(category);

        return new JsonResult(b, "");
    }
    @RequestMapping("/delById")
    @ResponseBody
    public JsonResult delByid(Integer id){
        boolean b = categoryService.delById(id);
        return new JsonResult(b);
    }


    @RequestMapping("/toeditPage")
    public ModelAndView toeditPage(Integer id) {

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/categoryupadte");
        Category c = categoryService.findByid(id);
        modelAndView.addObject("cat", c);

        return modelAndView;
    }



    @RequestMapping("/updateCat")
    @ResponseBody
    public JsonResult updateCat(Category category) {

        boolean b = categoryService.updateById(category);

        return new JsonResult(b, "");
    }


}
