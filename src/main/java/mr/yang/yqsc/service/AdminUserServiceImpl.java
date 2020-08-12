package mr.yang.yqsc.service;


import mr.yang.yqsc.common.MD5Util;
import mr.yang.yqsc.entity.AdminUser;
import mr.yang.yqsc.mapper.AdminUserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminUserServiceImpl implements AdminUserService {

    @Autowired
    private AdminUserDao adminUserDao;

    @Override
    public void delByIds(Integer[] ids) {
        adminUserDao.delIds(ids);
    }

    @Override
    public AdminUser login(AdminUser adminUser) {
        adminUser.setPassword(MD5Util.getMD5Code(adminUser.getPassword()));
        return adminUserDao.findAdminUser(adminUser);
    }

    @Override
    public List<AdminUser> findAll() {
        return adminUserDao.findAll();
    }

    @Override
    public boolean update(AdminUser adminUser) {
        return adminUserDao.updateUser(adminUser);
    }

    @Override
    public boolean stopById(Integer id) {
        return false;
    }

    @Override
    public boolean updatePwd(Integer aid, String newPwd,String oldpass) {
        AdminUser byid = adminUserDao.findByid(aid);
        boolean b = false;
        if(byid.getPassword().equals(MD5Util.getMD5Code(oldpass))){
           b =  adminUserDao.updatePwd(aid,MD5Util.getMD5Code(newPwd));
        }
        return b;
    }

    @Override
    public boolean updateStatus(AdminUser adminUser) {



        return  adminUserDao.updateStatus(adminUser);
    }

    @Override
    public boolean insertAdmin(AdminUser adminUser) {
        adminUser.setPassword(MD5Util.getMD5Code(adminUser.getPassword()));
        return adminUserDao.insert(adminUser);
    }

    @Override
    public AdminUser findByid(Integer aid) {
        return adminUserDao.findByid(aid);
    }
}
