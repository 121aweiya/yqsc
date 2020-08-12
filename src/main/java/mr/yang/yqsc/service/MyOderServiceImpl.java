package mr.yang.yqsc.service;


import mr.yang.yqsc.common.PageBean;
import mr.yang.yqsc.entity.Member;
import mr.yang.yqsc.entity.MyOrder;
import mr.yang.yqsc.entity.MyOrderQuery;
import mr.yang.yqsc.entity.Yueqi;
import mr.yang.yqsc.mapper.MyOrderDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.xml.crypto.Data;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Transactional
@Service
public class MyOderServiceImpl implements MyOderService {

    @Autowired
    private MyOrderDao myOrderDao;

    @Autowired
    private MemberSerivce memberSerivce;

    @Autowired
    private YueqiService yueqiService;


    @Override
    public boolean createOrder(MyOrder myOrder) {
        int insert = myOrderDao.insert(myOrder);

        return insert > 0 ? true : false;
    }


    @Override
    public PageBean<MyOrder> findAll(Integer pageNo, Integer pageSize, String start,
                                     String end, Integer zffs, Integer ostatus, Integer oid) {
        MyOrderQuery query = new MyOrderQuery();
        MyOrderQuery.Criteria criteria = query.createCriteria();
        criteria.andIsdelEqualTo(0);//不删除的

        if (!start.equals("") && !end.equals("")) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            try {
                Date startD = sdf.parse(start);
                Date endD = sdf.parse(end);
               /* System.out.println(startD);
                System.out.println(endD);*/
                criteria.andCreatetimeBetween(startD, endD);

            } catch (ParseException e) {
                e.printStackTrace();
            }

        }

        if (zffs != -1) {
            criteria.andPayfsEqualTo(zffs);
        }

        if (ostatus != -1) {
            criteria.andStatusEqualTo(ostatus);
        }

        if (oid != -1) {
            criteria.andIdEqualTo(oid);
        }

        query.setOrderByClause("id desc");//降序

        query.setPageNo(pageNo);
        query.setPageSize(pageSize);

        List<MyOrder> myOrders = myOrderDao.selectByExample(query);

        List<MyOrder> myOrderList = new ArrayList<>();

        for (MyOrder order : myOrders) {
            if (order.getMid() != null) {
                Member member = memberSerivce.findMemberByMid(order.getMid());
                order.setMember(member);
            }

            if (order.getYid() != null) {
                Yueqi yueqi = yueqiService.findById(order.getYid());
                order.setYueqi(yueqi);
            }

            myOrderList.add(order);

        }

        PageBean<MyOrder> myOrderPageBean = new PageBean<>();
        myOrderPageBean.setCurrentPage(pageNo);
        myOrderPageBean.setList(myOrderList);
        myOrderPageBean.setTotalCount(myOrderDao.countByExample(query));
        myOrderPageBean.setPageSize(pageSize);
        myOrderPageBean.initPageTotal();

        return myOrderPageBean;

    }


    @Override
    public MyOrder findById(Integer id) {

        MyOrder myOrder = myOrderDao.selectByPrimaryKey(id);

        return myOrder == null ? new MyOrder() : myOrder;
    }


    @Override
    public boolean delById(Integer id) {

        MyOrder updateOrder = new MyOrder();
        updateOrder.setId(id);
        updateOrder.setIsdel(1);
        updateOrder.setCreatetime(null);

        MyOrder byId = findById(id);

        if (byId.getStatus() != 4) {
            //未完成
            return false;
        }

        int u = myOrderDao.updateByPrimaryKeySelective(updateOrder);
        return u > 0 ? true : false;


    }

    @Override
    public boolean fahuo(Integer oid, String kdname, String kdnum) {
        MyOrder updateOrder = new MyOrder();
        updateOrder.setId(oid);
        updateOrder.setCreatetime(null);
        updateOrder.setKdname(kdname);
        updateOrder.setKdnum(kdnum);
        updateOrder.setStatus(2);//TODO 转一状态，支付-->发货

        MyOrder byId = findById(oid);

        if (byId.getStatus() != 1) {
            //其他状态
            return false;
        }


        int u = myOrderDao.updateByPrimaryKeySelective(updateOrder);

        return u > 0 ? true : false;
    }

    @Override
    public List<MyOrder> findByMemberId(Integer mid) {
        MyOrderQuery query = new MyOrderQuery();
        MyOrderQuery.Criteria criteria = query.createCriteria();
        criteria.andIsdelEqualTo(0);//不删除的

        if (mid != null) {
            criteria.andMidEqualTo(mid);//查用户下所有订单
        }


        query.setOrderByClause("id desc");//降序


        List<MyOrder> myOrders = myOrderDao.selectByExample(query);

        List<MyOrder> myOrderList = new ArrayList<>();

        for (MyOrder order : myOrders) {
            if (order.getMid() != null) {
                Member member = memberSerivce.findMemberByMid(order.getMid());
                order.setMember(member);
            }

            if (order.getYid() != null) {
                Yueqi yueqi = yueqiService.findById(order.getYid());
                order.setYueqi(yueqi);
            }
            myOrderList.add(order);

        }
        return myOrderList;
    }


    @Override
    public boolean pay(Integer oid, Member member) {

        MyOrder updateOrder = new MyOrder();
        updateOrder.setId(oid);
        updateOrder.setCreatetime(null);
        updateOrder.setStatus(1);//TODO 转一状态，未支付-->支付
        boolean r = false;

        MyOrder byId = findById(oid);
        if (byId == null) return false;

        if (byId != null && byId.getStatus() != 0) {
            //其他状态
            return false;
        }

        if (!(byId.getPayfs() == 0 || byId.getPayfs() == 1 || byId.getPayfs() == 2)) return false;//错误的方式


        if (byId != null && byId.getPayfs() == 1) r = true;//模拟支付宝支付
        if (byId != null && byId.getPayfs() == 2) r = true;//模拟微信支付


        if (byId != null && byId.getPayfs() == 0) {
            //yue，e支付

            System.out.println("测试DEBUG[ORDER]");
            System.out.println("测试DEBUG[ORDER]" + member.getMoney());
            System.out.println("测试DEBUG[ORDER]" + byId.getTotalmoney());

            if (member.getMoney() < byId.getTotalmoney()) {
                return false;
            }


            Double rest = member.getMoney() - byId.getTotalmoney();//剩
            DecimalFormat df = new DecimalFormat("#.##");
            rest = Double.parseDouble(df.format(rest));
            System.out.println("测试DEBUG[ORDER-rest]" + rest);

            if (rest > 0.0) {
                member.setMoney(rest);
            } else {
                return false;
            }

            r = memberSerivce.update(member);//更新余额
        }


        int u = myOrderDao.updateByPrimaryKeySelective(updateOrder);////更新订单

        return (u > 0 ? true : false) && r;
    }

    @Override
    public boolean qianshou(Integer oid) {
        MyOrder updateOrder = new MyOrder();
        updateOrder.setId(oid);
        updateOrder.setCreatetime(null);
        updateOrder.setStatus(4);//TODO 转一状态，发货，签收-->完成

        MyOrder byId = findById(oid);

        if (byId.getStatus() != 2) {
            //其他状态
            return false;
        }


        int u = myOrderDao.updateByPrimaryKeySelective(updateOrder);

        return u > 0 ? true : false;
    }
}
