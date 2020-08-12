package mr.yang.yqsc.service;

import mr.yang.yqsc.common.PageBean;
import mr.yang.yqsc.entity.Yueqi;

import java.util.List;


public interface YueqiService {

    //分页查
    PageBean<Yueqi> findAllToAdmin(Integer pageNo, Integer pageSize, String yname, Integer catId, Integer isShow, Integer isHot);


    boolean delByCatId(Integer id);


    boolean updateImgUrlById(Integer id, String absPath);

    boolean updateDesById(Integer id, String des);

    boolean delById(Integer id);

    boolean UpdateSjxj(Integer type, Integer id);

    boolean UpdateHot(Integer type, Integer id);

    boolean add(Yueqi yueqi);

    Yueqi findById(Integer id);

    boolean update(Yueqi yueqi);

    //查全部
    List<Yueqi> findAll();

    Yueqi findByIdForDetail(Integer id);

}
