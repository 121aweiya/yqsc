package mr.yang.yqsc.service;

import mr.yang.yqsc.common.PageBean;
import mr.yang.yqsc.entity.Comment;
import mr.yang.yqsc.entity.CommentQuery;
import mr.yang.yqsc.mapper.CommentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Transactional
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentDao commentDao;

    @Autowired
    private MemberSerivce memberSerivce;

    @Autowired
    private YueqiService yueqiService;


    @Override
    public PageBean<Comment> findAll(Integer pageNo, Integer pageSize, String content) {
        CommentQuery query = new CommentQuery();
        CommentQuery.Criteria criteria = query.createCriteria();

        criteria.andIsdelEqualTo(0);

        if (!"".equals(content)) {
            criteria.andContentsLike("%" + content + "%");
        }

        List<Comment> comments = commentDao.selectByExample(query);

        List<Comment> newList = new ArrayList<>();


        for (Comment c : comments) {
            c.setMember(memberSerivce.findMemberByMid(c.getMid()));
            c.setYueqi(yueqiService.findById(c.getPid()));
            newList.add(c);
        }

        query.setPageNo(pageNo);
        query.setPageSize(pageSize);
        PageBean<Comment> pageBean = new PageBean<>();
        pageBean.setCurrentPage(pageNo);
        pageBean.setList(newList);
        pageBean.setTotalCount(commentDao.countByExample(query));
        pageBean.setPageSize(pageSize);
        pageBean.initPageTotal();

        return pageBean;
    }

    @Override
    public boolean delById(Comment comment) {
        if (comment == null || comment.getId() == null) return false;
        comment.setIsdel(1);
        return commentDao.updateByPrimaryKeySelective(comment) > 0 ? true : false;
    }


    //删除用户下评论
    @Override
    public void delByMid(Integer mid) {
        CommentQuery query = new CommentQuery();
        CommentQuery.Criteria criteria = query.createCriteria();
        criteria.andMidEqualTo(mid);
        Comment comment = new Comment();
        comment.setIsdel(1);
        commentDao.updateByExampleSelective(comment, query);
    }

    //删乐器下评论

    @Override
    public void delByPid(Integer id) {
        CommentQuery query = new CommentQuery();
        CommentQuery.Criteria criteria = query.createCriteria();
        criteria.andPidEqualTo(id);
        Comment comment = new Comment();
        comment.setIsdel(1);
        commentDao.updateByExampleSelective(comment, query);
    }

    @Override
    public List<Comment> findByYid(Integer yid) {

        CommentQuery query = new CommentQuery();
        CommentQuery.Criteria criteria = query.createCriteria();

        criteria.andIsdelEqualTo(0);

        criteria.andPidEqualTo(yid);


        List<Comment> comments = commentDao.selectByExample(query);

        List<Comment> newList = new ArrayList<>();


        for (Comment c : comments) {
            c.setMember(memberSerivce.findMemberByMid(c.getMid()));
            newList.add(c);
        }

        return newList;

    }

    @Override
    public boolean add(Comment comment) {
        int i = commentDao.insert(comment);
        return i > 0 ? true : false;
    }
}
