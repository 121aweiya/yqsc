package mr.yang.yqsc.mapper;

import mr.yang.yqsc.entity.Member;
import mr.yang.yqsc.entity.MemberQuery;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MemberDao {
    int countByExample(MemberQuery example);

    int deleteByExample(MemberQuery example);

    int deleteByPrimaryKey(Integer mid);

    int insert(Member record);

    int insertSelective(Member record);

    List<Member> selectByExample(MemberQuery example);

    Member selectByPrimaryKey(Integer mid);

    int updateByExampleSelective(@Param("record") Member record, @Param("example") MemberQuery example);

    int updateByExample(@Param("record") Member record, @Param("example") MemberQuery example);

    int updateByPrimaryKeySelective(Member record);

    int updateByPrimaryKey(Member record);
}