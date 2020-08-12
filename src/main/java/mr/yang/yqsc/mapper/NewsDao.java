package mr.yang.yqsc.mapper;

import mr.yang.yqsc.entity.News;
import mr.yang.yqsc.entity.NewsQuery;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface NewsDao {
    int countByExample(NewsQuery example);

    int deleteByExample(NewsQuery example);

    int deleteByPrimaryKey(Integer id);

    int insert(News record);

    int insertSelective(News record);

    List<News> selectByExampleWithBLOBs(NewsQuery example);

    List<News> selectByExample(NewsQuery example);

    News selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") News record, @Param("example") NewsQuery example);

    int updateByExampleWithBLOBs(@Param("record") News record, @Param("example") NewsQuery example);

    int updateByExample(@Param("record") News record, @Param("example") NewsQuery example);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKeyWithBLOBs(News record);

    int updateByPrimaryKey(News record);
}