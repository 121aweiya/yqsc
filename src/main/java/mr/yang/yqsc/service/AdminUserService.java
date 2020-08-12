package mr.yang.yqsc.service;


import mr.yang.yqsc.entity.AdminUser;

import java.util.List;

public interface AdminUserService {


    void delByIds(Integer[] ids);

    public AdminUser login(AdminUser adminUser);

    List<AdminUser> findAll();

    boolean update(AdminUser adminUser);

    boolean stopById(Integer id);

    boolean updatePwd(Integer aid, String newPwd,String oldpass);

    boolean updateStatus(AdminUser adminUser);

    boolean insertAdmin(AdminUser adminUser);

    AdminUser findByid(Integer aid);
}
