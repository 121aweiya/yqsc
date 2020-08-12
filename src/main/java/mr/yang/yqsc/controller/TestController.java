package mr.yang.yqsc.controller;
import mr.yang.yqsc.entity.Student;
import mr.yang.yqsc.entity.StudentQuery;
import mr.yang.yqsc.entity.User;
import mr.yang.yqsc.mapper.StudentDao;
import mr.yang.yqsc.mapper.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class TestController {

    @Autowired
    private UserDao testDBDao;

    @Autowired
    private StudentDao studentDao;


  /*  @RequestMapping(value = "/findAll",method = RequestMethod.GET)
    public ModelAndView getAll(){
        System.out.println("sss");
        List<User> ff = testDBDao.ff();

        for (User user : ff) {
            System.out.println(user);
        }
        return new ModelAndView("aa");
    }*/

    @RequestMapping(value = "/st",method = RequestMethod.GET)
    public ModelAndView aa(){
        System.out.println("sttttt");
        List<Student> students = studentDao.selectByExample(new StudentQuery());

        for (Student student : students) {
            System.out.println(student);
        }
        return new ModelAndView("aa");
    }


    @RequestMapping(value = "/st1",method = RequestMethod.GET)
    public ModelAndView test1(){

        return new ModelAndView("/admin/login");
    }




}
