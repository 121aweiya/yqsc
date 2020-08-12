package mr.yang.yqsc.mapper;

import mr.yang.yqsc.entity.Fangwei;
import mr.yang.yqsc.entity.FangweiQuery;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface FangweiDao {
    int countByExample(FangweiQuery example);

    int deleteByExample(FangweiQuery example);

    int deleteByPrimaryKey(Integer id);

    int insert(Fangwei record);

    int insertSelective(Fangwei record);

    List<Fangwei> selectByExample(FangweiQuery example);

    Fangwei selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Fangwei record, @Param("example") FangweiQuery example);

    int updateByExample(@Param("record") Fangwei record, @Param("example") FangweiQuery example);

    int updateByPrimaryKeySelective(Fangwei record);

    int updateByPrimaryKey(Fangwei record);
}