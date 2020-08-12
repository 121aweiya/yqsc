package mr.yang.yqsc.mapper;


import mr.yang.yqsc.entity.AdminUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface AdminUserDao {


    /**
     * 根据用户名密码找管理员
     * @return
     */
    public AdminUser findAdminUser(AdminUser adminUser);

    /**
     * 查找所有
     * @return
     */
    public List<AdminUser> findAll();

    /**
     * 删除ids
     * @param ids
     * @return
     */
    boolean delIds(Integer[] ids);

    /**
     * 更新状态
     */

    boolean updateStatus(AdminUser adminUser);


    AdminUser findByid(Integer aid);

    boolean updatePwd(@Param("aid") Integer aid, @Param("newpass") String newpass);

    boolean insert(AdminUser adminUser);

    boolean updateUser(AdminUser adminUser);

    List<AdminUser> findByUsernameLike(String username);
}
