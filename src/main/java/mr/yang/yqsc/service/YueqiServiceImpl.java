package mr.yang.yqsc.service;


import mr.yang.yqsc.common.PageBean;
import mr.yang.yqsc.entity.Category;
import mr.yang.yqsc.entity.Yueqi;
import mr.yang.yqsc.entity.YueqiQuery;
import mr.yang.yqsc.mapper.CategoryDao;
import mr.yang.yqsc.mapper.YueqiDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.net.URLEncoder;
import java.util.List;

@Service
@Transactional
public class YueqiServiceImpl implements YueqiService {

    @Autowired
    private YueqiDao yueqiDao;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private CommentService commentService;


    @Override
    public PageBean<Yueqi> findAllToAdmin(Integer pageNo, Integer pageSize, String yname, Integer catId, Integer isShow, Integer isHot) {

        YueqiQuery m = new YueqiQuery();
        YueqiQuery.Criteria criteria = m.createCriteria();
        criteria.andIsdelEqualTo(0);//不删除的

        if (!yname.equals("")) {
            criteria.andYqnameLike("%" + yname + "%");
        }

        if (isShow != -1) {
            criteria.andIsshowEqualTo(isShow);
        }

        if (isHot != -1) {
            criteria.andIshotEqualTo(isHot);
        }

        if (catId != -1) {
            criteria.andCategoryidEqualTo(catId);
        }

        m.setOrderByClause("id desc");//降序

        m.setPageNo(pageNo);
        m.setPageSize(pageSize);

        List<Yueqi> yueqis = yueqiDao.selectByExampleWithBLOBs(m);
        List<Category> categories = categoryService.findAll();

        for (Yueqi yueqi : yueqis) {
            for (Category category : categories) {
                if (yueqi.getCategoryid() == category.getId()) {
                    yueqi.setCategory(category);
                    break;
                }
            }
        }


        PageBean<Yueqi> yueqiPageBean = new PageBean<>();
        yueqiPageBean.setCurrentPage(pageNo);
        yueqiPageBean.setList(yueqis);
        yueqiPageBean.setTotalCount(yueqiDao.countByExample(m));
        yueqiPageBean.setPageSize(pageSize);
        yueqiPageBean.initPageTotal();


        return yueqiPageBean;


    }

    @Override
    public boolean delByCatId(Integer id) {
        if (id == null) return false;
        Yueqi yueqi = new Yueqi();
        yueqi.setIsdel(1);
        YueqiQuery yueqiQuery = new YueqiQuery();
        YueqiQuery.Criteria criteria = yueqiQuery.createCriteria().andCategoryidEqualTo(id);

        int u = yueqiDao.updateByExampleSelective(yueqi, yueqiQuery);

        return u > 0 ? true : false;
    }

    @Override
    public boolean updateImgUrlById(Integer id, String absPath) {
        if (id == null) return false;
        Yueqi yueqi = new Yueqi();
        yueqi.setImgurl(absPath);
        yueqi.setId(id);
        int u = yueqiDao.updateByPrimaryKeySelective(yueqi);

        return u > 0 ? true : false;
    }

    @Override
    public boolean updateDesById(Integer id, String des) {
        Yueqi yueqi = new Yueqi();
        System.out.println("des===deug....:" + des);
        yueqi.setYqdescription(des);
        yueqi.setId(id);
        int u = yueqiDao.updateByPrimaryKeySelective(yueqi);
        return u > 0 ? true : false;
    }

    @Override
    public boolean delById(Integer id) {
        Yueqi yueqi = new Yueqi();
        yueqi.setId(id);
        yueqi.setIsdel(1);//删除标记
        int u = yueqiDao.updateByPrimaryKeySelective(yueqi);
        //删除乐器器下所有评论
        commentService.delByPid(id);
        return u > 0 ? true : false;
    }

    @Override
    public boolean UpdateSjxj(Integer type, Integer id) {

        Yueqi yueqi = new Yueqi();
        yueqi.setId(id);
        yueqi.setIsshow(type);
        int u = yueqiDao.updateByPrimaryKeySelective(yueqi);
        return u > 0 ? true : false;
    }

    @Override
    public boolean UpdateHot(Integer type, Integer id) {
        Yueqi yueqi = new Yueqi();
        yueqi.setId(id);
        yueqi.setIshot(type);
        int u = yueqiDao.updateByPrimaryKeySelective(yueqi);
        return u > 0 ? true : false;
    }

    @Override
    public boolean add(Yueqi yueqi) {
        int u = yueqiDao.insert(yueqi);
        return u > 0 ? true : false;
    }

    @Override
    public Yueqi findById(Integer id) {

        Yueqi yueqi = yueqiDao.selectByPrimaryKey(id);

        return yueqi == null ? new Yueqi() : yueqi;
    }

    @Override
    public boolean update(Yueqi yueqi) {

        int u = yueqiDao.updateByPrimaryKeySelective(yueqi);
        return u > 0 ? true : false;

    }


    @Override
    public List<Yueqi> findAll() {
        YueqiQuery m = new YueqiQuery();
        return yueqiDao.selectByExampleWithBLOBs(m);
    }

    @Override
    public Yueqi findByIdForDetail(Integer id) {
        YueqiQuery m = new YueqiQuery();
        YueqiQuery.Criteria criteria = m.createCriteria();
        criteria.andIsdelEqualTo(0);//不删除的
        criteria.andIdEqualTo(id);

        List<Yueqi> yueqis = yueqiDao.selectByExampleWithBLOBs(m);
        List<Category> categories = categoryService.findAll();

        for (Yueqi yueqi : yueqis) {
            for (Category category : categories) {
                if (yueqi.getCategoryid() == category.getId()) {
                    yueqi.setCategory(category);
                    break;
                }
            }
        }

        if (yueqis.size() <= 0) return null;
        return yueqis.get(0);

    }
}
