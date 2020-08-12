package mr.yang.yqsc.service;


import com.github.pagehelper.Page;
import mr.yang.yqsc.common.PageBean;
import mr.yang.yqsc.entity.Member;
import mr.yang.yqsc.entity.MemberQuery;
import mr.yang.yqsc.mapper.MemberDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class MemberSerivceImpl implements MemberSerivce {

    @Autowired
    private MemberDao memberDao;

    @Autowired
    private CommentService commentService;

    @Override
    public List<Member> findAll() {
        return memberDao.selectByExample(new MemberQuery());
    }

    @Override
    public PageBean<Member> findAll(Integer pageNo, Integer pageSize, String mname) {

        MemberQuery m = new MemberQuery();
        if (!mname.equals("")) m.createCriteria().andMembernameLike("%" + mname + "%");
        m.setPageNo(pageNo);
        m.setPageSize(pageSize);
        PageBean<Member> memberPageBean = new PageBean<>();
        memberPageBean.setCurrentPage(pageNo);
        memberPageBean.setList(memberDao.selectByExample(m));
        memberPageBean.setTotalCount(memberDao.countByExample(m));
        memberPageBean.setPageSize(pageSize);

        memberPageBean.initPageTotal();


        return memberPageBean;
    }

    @Override
    public boolean save(Member member) {

        if (findByMbername(member.getMembername()) != null) return false;

        return memberDao.insert(member) > 0 ? true : false;
    }

    @Override
    public Member findMemberByMid(Integer mid) {
        if (mid == null) return new Member();
        return memberDao.selectByPrimaryKey(mid);
    }

    @Override
    public boolean update(Member member) {
        int i = memberDao.updateByPrimaryKeySelective(member);

        return i > 0 ? true : false;
    }

    @Override
    public boolean delByid(Integer mid) {
        int i = memberDao.deleteByPrimaryKey(mid);
        //删除用户下评论
        commentService.delByMid(mid);
        return i > 0 ? true : false;
    }


    @Override
    public Member findByMbername(String mname) {
        MemberQuery memberQuery = new MemberQuery();
        MemberQuery.Criteria criteria = memberQuery.createCriteria();
        criteria.andMembernameEqualTo(mname);
        List<Member> members = memberDao.selectByExample(memberQuery);
        if (members.size() > 0) return members.get(0);
        else return null;
    }

    @Override
    public Member login(Member member) {
        MemberQuery memberQuery = new MemberQuery();
        MemberQuery.Criteria criteria = memberQuery.createCriteria();
        criteria.andMembernameEqualTo(member.getMembername());
        criteria.andPasswordEqualTo(member.getPassword());
        List<Member> members = memberDao.selectByExample(memberQuery);
        if (members.size() > 0) return members.get(0);
        else return null;
    }
}
