package mr.yang.yqsc.service;

import mr.yang.yqsc.common.PageBean;
import mr.yang.yqsc.entity.Member;
import mr.yang.yqsc.entity.MyOrder;

import java.util.List;

public interface MyOderService {
    boolean createOrder(MyOrder myOrder);

    PageBean<MyOrder> findAll(Integer pageNo, Integer pageSize, String start, String end,
                              Integer zffs, Integer ostatus,Integer oid);

    boolean delById(Integer id);

    public MyOrder findById(Integer id);

    boolean fahuo(Integer oid, String kdname, String kdnum);

    List<MyOrder> findByMemberId(Integer mid);

    boolean pay(Integer oid, Member member);

    boolean qianshou(Integer oid);
}
