package mr.yang.yqsc.mapper;

import mr.yang.yqsc.entity.Student;
import mr.yang.yqsc.entity.StudentQuery;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface StudentDao {
    int countByExample(StudentQuery example);

    int deleteByExample(StudentQuery example);

    int deleteByPrimaryKey(Integer tid);

    int insert(Student record);

    int insertSelective(Student record);

    List<Student> selectByExample(StudentQuery example);

    Student selectByPrimaryKey(Integer tid);

    int updateByExampleSelective(@Param("record") Student record, @Param("example") StudentQuery example);

    int updateByExample(@Param("record") Student record, @Param("example") StudentQuery example);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);
}