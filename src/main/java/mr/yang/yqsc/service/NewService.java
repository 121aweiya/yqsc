package mr.yang.yqsc.service;


import mr.yang.yqsc.common.PageBean;
import mr.yang.yqsc.entity.News;

/**
 * 新闻公告
 */
public interface NewService {


    boolean add(News news);

    /**
     * 查找所有
     * @param pageNo
     * @param pageSize
     * @return
     */
    PageBean<News> findAll(Integer pageNo, Integer pageSize,String newstitile);

    News findById(Integer id);

    boolean update(News news);

    boolean delById(News news);
}
