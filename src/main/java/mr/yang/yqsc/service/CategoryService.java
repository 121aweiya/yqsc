package mr.yang.yqsc.service;

import mr.yang.yqsc.common.PageBean;
import mr.yang.yqsc.entity.Category;

import java.util.List;

public interface CategoryService {
    PageBean<Category> findAll(Integer pageNo, Integer pageSize, String categoryName);



    Category findByid(Integer id);

    boolean save(Category category);


    boolean delById(Integer id);

    boolean updateById(Category category);

    List<Category> findAll();


}
