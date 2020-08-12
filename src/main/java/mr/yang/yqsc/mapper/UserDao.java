package mr.yang.yqsc.mapper;



import mr.yang.yqsc.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface UserDao {

    List<User> ff();

}