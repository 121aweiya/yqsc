package mr.yang.yqsc.service;


import mr.yang.yqsc.common.PageBean;
import mr.yang.yqsc.entity.News;
import mr.yang.yqsc.entity.NewsQuery;
import mr.yang.yqsc.mapper.NewsDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class NewServiceImpl implements NewService {

    @Autowired
    private NewsDao newsDao;

    @Override
    public boolean add(News news) {

        return newsDao.insert(news) > 0 ? true : false;
    }

    @Override
    public PageBean<News> findAll(Integer pageNo, Integer pageSize, String newstitile) {

        NewsQuery query = new NewsQuery();
        NewsQuery.Criteria criteria = query.createCriteria();

        criteria.andIsdelEqualTo(0);

        if (!"".equals(newstitile)) {
            criteria.andNewstitleLike("%" + newstitile + "%");
        }

        if (pageNo == 0) pageNo = 1;

        query.setPageNo(pageNo);
        query.setPageSize(pageSize);
        PageBean<News> pageBean = new PageBean<>();
        pageBean.setCurrentPage(pageNo);
        pageBean.setList(newsDao.selectByExampleWithBLOBs(query));
        pageBean.setTotalCount(newsDao.countByExample(query));
        pageBean.setPageSize(pageSize);
        pageBean.initPageTotal();
        return pageBean;
    }

    @Override
    public News findById(Integer id) {
        return newsDao.selectByPrimaryKey(id);
    }

    @Override
    public boolean update(News news) {

        int u = newsDao.updateByPrimaryKeySelective(news);
        return u > 0 ? true : false;
    }

    @Override
    public boolean delById(News news) {
        if (news == null || news.getId() == null) return false;
        news.setIsdel(1);
        return newsDao.updateByPrimaryKeySelective(news) > 0 ? true : false;
    }
}
