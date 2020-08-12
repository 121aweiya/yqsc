package mr.yang.yqsc.controller;


import mr.yang.yqsc.common.JsonResult;
import mr.yang.yqsc.common.PageBean;
import mr.yang.yqsc.entity.Member;
import mr.yang.yqsc.entity.MyOrder;
import mr.yang.yqsc.entity.Yueqi;
import mr.yang.yqsc.service.MemberSerivce;
import mr.yang.yqsc.service.MyOderService;
import mr.yang.yqsc.service.YueqiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * 订单相关
 */
@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private MyOderService myOderService;

    @Autowired
    private YueqiService yueqiService;

    @Autowired
    private MemberSerivce memberSerivce;


    @RequestMapping("/gotopay")
    public ModelAndView gotopay(@RequestParam(value = "yid", defaultValue = "-1") Integer yid) {
        ModelAndView mv = new ModelAndView();
        Yueqi yueqi = yueqiService.findByIdForDetail(yid);
        mv.addObject("payYueqi", yueqi);
        mv.setViewName("pages/pay1");
        return mv;

    }

    @ResponseBody
    @RequestMapping("/createOrder")
    public Map<String, Object> createOrder(MyOrder myOrder, HttpSession session) {
        Map<String, Object> map = new HashMap<>();

        Member member = (Member) session.getAttribute("memberSession");


        if (member == null || member.getMid() == null) {
            map.put("code", -1);
            map.put("msg", "创建打单失败。请先登录");
            return map;
        }


        if (myOrder.getYid() == null) {
            map.put("code", -2);
            map.put("msg", "购买乐器id为空");
            return map;
        }

        Yueqi byId = yueqiService.findById(myOrder.getYid());
        myOrder.setTotalmoney(byId.getNewprice() * myOrder.getBuynum());
        myOrder.setMid(member.getMid());
        System.out.println(myOrder);

        myOderService.createOrder(myOrder);

        map.put("code", 200);
        map.put("msg", "订单已经创建，请前往订单支付");
        return map;
    }


    //后台订单list
    @RequestMapping("/list1")
    public ModelAndView list(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
                             @RequestParam(value = "pageSize", defaultValue = "10") Integer pageSize,
                             @RequestParam(value = "start", defaultValue = "") String start,
                             @RequestParam(value = "end", defaultValue = "") String end,
                             @RequestParam(value = "zffs", defaultValue = "-1") Integer zffs,
                             @RequestParam(value = "oid", defaultValue = "-1") Integer oid,
                             @RequestParam(value = "ostatus", defaultValue = "-1") Integer ostatus) {
        //跳转页面

        if (pageNo <= 0) pageNo = 1;
        //PageBean<Yueqi> pageBean = yueqiService.findAllToAdmin(pageNo, pageSize, yname, catId, isShow, isHot);
        PageBean<MyOrder> pageBean = myOderService.findAll(pageNo, pageSize, start, end, zffs, ostatus,oid);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("/admin/orderlist");
        mv.addObject("pageBean", pageBean);
        mv.addObject("start", start);
        mv.addObject("end", end);
        mv.addObject("zffs", zffs);
        mv.addObject("oid", oid);
        mv.addObject("ostatus", ostatus);
        return mv;
    }

    //删除
    @RequestMapping("/delById")
    @ResponseBody
    public JsonResult delById(@RequestParam(value = "id", defaultValue = "-1") Integer id) {

        if (id == -1) return new JsonResult(false);

        boolean f = myOderService.delById(id);

        return new JsonResult(f);
    }

    //发货
    @RequestMapping("/fahuo")
    @ResponseBody
    public JsonResult fahuo(@RequestParam(value = "oid", defaultValue = "-1") Integer oid,
                            @RequestParam(value = "kdname", defaultValue = "") String kdname,
                            @RequestParam(value = "kdnum", defaultValue = "") String kdnum
                            ) {

        if (oid == -1 || "".equals(kdname) || "".equals(kdnum)) return new JsonResult(false);


        boolean f = myOderService.fahuo(oid,kdname,kdnum);

        return new JsonResult(f);
    }

    @RequestMapping("/toFahuo")
    public ModelAndView toAddPage(Integer oid) {
        ModelAndView mv = new ModelAndView();
        mv.addObject("oid",oid);
        mv.setViewName("admin/orderFahuo");
        return mv;
    }


    @ResponseBody
    @RequestMapping("/pay")
    public Map<String, Object> pay(Integer oid,@RequestParam(value = "paypass",defaultValue = "null") String paypass, HttpSession session) {
        Map<String, Object> map = new HashMap<>();

        Member member = (Member) session.getAttribute("memberSession");



        if (member == null || member.getMid() == null) {
            map.put("status", -1);
            map.put("msg", "请先登录");
            return map;
        }

        //TODO 校验密码
        if(!"null".equals(paypass)){
            if(!member.getPaypassword().equals(paypass)){
                map.put("status", -1);
                map.put("msg", "支付密码有错");
                return map;
            }
        }

        member = memberSerivce.findMemberByMid(member.getMid());

        System.out.println("DEUBG订单登录member："+member);


        boolean b =  myOderService.pay(oid,member);


       if(b){
           map.put("status", 200);
           map.put("msg", "支付成功");
       }else {
           map.put("status", -1);
           map.put("msg", "支付失败");
       }

        return map;
    }



    @ResponseBody
    @RequestMapping("/qianshou")
    public Map<String, Object> qianshou(Integer oid, HttpSession session) {
        Map<String, Object> map = new HashMap<>();

        Member member = (Member) session.getAttribute("memberSession");


        if (member == null || member.getMid() == null) {
            map.put("status", -1);
            map.put("msg", "请先登录");
            return map;
        }

        boolean b =  myOderService.qianshou(oid);


        if(b){
            map.put("status", 200);
            map.put("msg", "签收成功");
        }else {
            map.put("status", -1);
            map.put("msg", "签收失败");
        }

        return map;
    }

}
