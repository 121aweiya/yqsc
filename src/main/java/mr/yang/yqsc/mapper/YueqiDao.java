package mr.yang.yqsc.mapper;

import mr.yang.yqsc.entity.Yueqi;
import mr.yang.yqsc.entity.YueqiQuery;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface YueqiDao {
    int countByExample(YueqiQuery example);

    int deleteByExample(YueqiQuery example);

    int deleteByPrimaryKey(Integer id);

    int insert(Yueqi record);

    int insertSelective(Yueqi record);

    List<Yueqi> selectByExampleWithBLOBs(YueqiQuery example);

    List<Yueqi> selectByExample(YueqiQuery example);

    Yueqi selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Yueqi record, @Param("example") YueqiQuery example);

    int updateByExampleWithBLOBs(@Param("record") Yueqi record, @Param("example") YueqiQuery example);

    int updateByExample(@Param("record") Yueqi record, @Param("example") YueqiQuery example);

    int updateByPrimaryKeySelective(Yueqi record);

    int updateByPrimaryKeyWithBLOBs(Yueqi record);

    int updateByPrimaryKey(Yueqi record);
}