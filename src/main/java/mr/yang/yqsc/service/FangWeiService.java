package mr.yang.yqsc.service;


import mr.yang.yqsc.common.PageBean;
import mr.yang.yqsc.entity.Fangwei;

public interface FangWeiService {
    PageBean<Fangwei> findAll(Integer pageNo, Integer pageSize);

    boolean delById(Integer id);


    boolean delBySerialNum(String serialNum);

    //生成防伪
    boolean add(String yqname);

    Fangwei findBySerialNum(String serialNum);

    Fangwei check(String serialNum);


}
