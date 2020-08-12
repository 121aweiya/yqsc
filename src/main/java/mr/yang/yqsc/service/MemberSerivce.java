package mr.yang.yqsc.service;


import mr.yang.yqsc.common.PageBean;
import mr.yang.yqsc.entity.Member;
import mr.yang.yqsc.mapper.MemberDao;

import java.util.List;

public interface MemberSerivce {


    //不带分业
    public List<Member> findAll();
    public PageBean<Member> findAll(Integer pageNo, Integer pageSize,String mname);

    boolean save(Member member);

    Member findMemberByMid(Integer mid);

    boolean update(Member member);

    boolean delByid(Integer mid);

    Member findByMbername(String mname);

    Member login(Member member);
}
