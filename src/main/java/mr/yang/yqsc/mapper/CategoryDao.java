package mr.yang.yqsc.mapper;

import mr.yang.yqsc.entity.Category;
import mr.yang.yqsc.entity.CategoryQuery;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface CategoryDao {
    int countByExample(CategoryQuery example);

    int deleteByExample(CategoryQuery example);

    int deleteByPrimaryKey(Integer id);

    int insert(Category record);

    int insertSelective(Category record);

    List<Category> selectByExample(CategoryQuery example);

    Category selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Category record, @Param("example") CategoryQuery example);

    int updateByExample(@Param("record") Category record, @Param("example") CategoryQuery example);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);
}