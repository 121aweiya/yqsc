package mr.yang.yqsc.mapper;

import mr.yang.yqsc.entity.MyOrder;
import mr.yang.yqsc.entity.MyOrderQuery;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MyOrderDao {
    int countByExample(MyOrderQuery example);

    int deleteByExample(MyOrderQuery example);

    int deleteByPrimaryKey(Integer id);

    int insert(MyOrder record);

    int insertSelective(MyOrder record);

    List<MyOrder> selectByExample(MyOrderQuery example);

    MyOrder selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") MyOrder record, @Param("example") MyOrderQuery example);

    int updateByExample(@Param("record") MyOrder record, @Param("example") MyOrderQuery example);

    int updateByPrimaryKeySelective(MyOrder record);

    int updateByPrimaryKey(MyOrder record);
}