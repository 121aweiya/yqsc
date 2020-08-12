package mr.yang.yqsc.mapper;

import mr.yang.yqsc.entity.Comment;
import mr.yang.yqsc.entity.CommentQuery;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentDao {
    int countByExample(CommentQuery example);

    int deleteByExample(CommentQuery example);

    int deleteByPrimaryKey(Integer id);

    int insert(Comment record);

    int insertSelective(Comment record);

    List<Comment> selectByExample(CommentQuery example);

    Comment selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Comment record, @Param("example") CommentQuery example);

    int updateByExample(@Param("record") Comment record, @Param("example") CommentQuery example);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);
}