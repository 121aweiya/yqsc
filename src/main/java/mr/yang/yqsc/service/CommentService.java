package mr.yang.yqsc.service;

import mr.yang.yqsc.common.PageBean;
import mr.yang.yqsc.entity.Comment;
import mr.yang.yqsc.entity.News;

import java.util.List;

public interface CommentService {

    PageBean<Comment> findAll(Integer pageNo, Integer pageSize, String content);


    boolean delById(Comment comment);

    void delByMid(Integer mid);

    void delByPid(Integer id);


    List<Comment> findByYid(Integer yid);


    boolean add(Comment comment);
}
