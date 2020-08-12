package mr.yang.yqsc.service;


import mr.yang.yqsc.common.JedisUtil;
import mr.yang.yqsc.common.PageBean;
import mr.yang.yqsc.entity.Category;
import mr.yang.yqsc.entity.CategoryQuery;
import mr.yang.yqsc.mapper.CategoryDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.Tuple;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryDao categoryDao;

    @Autowired
    private YueqiService yueqiService;

    private boolean isnull = false;

    @Override
    public PageBean<Category> findAll(Integer pageNo, Integer pageSize, String categoryName) {
        CategoryQuery m = new CategoryQuery();
        CategoryQuery.Criteria criteria = m.createCriteria();
        criteria.andIsdelEqualTo(0);
        if (!categoryName.equals("")) {
            criteria.andCategorynameLike("%" + categoryName + "%");
        }

        m.setPageNo(pageNo);
        m.setPageSize(pageSize);
        PageBean<Category> categoryPageBean = new PageBean<>();
        categoryPageBean.setCurrentPage(pageNo);
        categoryPageBean.setList(categoryDao.selectByExample(m));
        categoryPageBean.setTotalCount(categoryDao.countByExample(m));
        categoryPageBean.setPageSize(pageSize);
        categoryPageBean.initPageTotal();

        return categoryPageBean;
    }


    @Override
    public Category findByid(Integer id) {
        if (id == null) return new Category();
        Category category = categoryDao.selectByPrimaryKey(id);
        if (category == null || category.getIsdel() == 1) return new Category();
        return category;
    }

    @Override
    public boolean save(Category category) {

        if (category == null || "".equals(category.getCategoryname())) return false;
        CategoryQuery query = new CategoryQuery();
        CategoryQuery.Criteria criteria = query.createCriteria();
        criteria.andCategorynameEqualTo(category.getCategoryname());//名字是否存在
        criteria.andIsdelEqualTo(0); //不是删除的
        int i = categoryDao.countByExample(query);//查询数据是否存在
        if (i > 0) return false;
        category.setIsdel(0);
        int u = categoryDao.insert(category);

        return u > 0 ? true : false;
    }

    //更新删除状态
    @Override
    public boolean delById(Integer id) {
        if(id == null) return false;
        Category category = new Category();
        category.setId(id);
        category.setIsdel(1);

        int u = categoryDao.updateByPrimaryKeySelective(category);



        //TODO 删除该类别下所有商品
        yueqiService.delByCatId(id);



        return u > 0 ? true : false;
    }

    //更新类别信息
    @Override
    public boolean updateById(Category category) {
        int u = categoryDao.updateByPrimaryKeySelective(category);
        return u > 0 ? true : false;
    }

    @Override
    public List<Category> findAll() {

        Jedis jedis = null;
        if(isnull == false){
            jedis = JedisUtil.getJedis();
            if(jedis ==null) isnull = true;
        }

        List<Category> cs = null;
        if (isnull) {
            CategoryQuery query = new CategoryQuery();
            CategoryQuery.Criteria criteria = query.createCriteria();
            criteria.andIsdelEqualTo(0);
            cs = categoryDao.selectByExample(query);
            return cs;
        } else {
            Set<Tuple> categorys = jedis.zrangeWithScores("category1", 0, -1);
            if (categorys == null || categorys.size() == 0) {

                System.out.println("从数据库查询....");
                CategoryQuery query = new CategoryQuery();
                CategoryQuery.Criteria criteria = query.createCriteria();
                criteria.andIsdelEqualTo(0);
                cs = categoryDao.selectByExample(query);

                //3.2 将集合数据存储到redis中的 category的key
                for (int i = 0; i < cs.size(); i++) {

                    jedis.zadd("category1", cs.get(i).getId(), cs.get(i).getCategoryname());
                }
            } else {
                System.out.println("从redis中查询.....");

                //4.如果不为空,将set的数据存入list
                cs = new ArrayList<Category>();
                for (Tuple tuple : categorys) {
                    Category category = new Category();
                    category.setCategoryname(tuple.getElement());
                    category.setId((int) tuple.getScore());
                    cs.add(category);
                }
            }

            return cs;
        }
    }
}
