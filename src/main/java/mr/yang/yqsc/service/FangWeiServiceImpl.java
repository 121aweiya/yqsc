package mr.yang.yqsc.service;


import mr.yang.yqsc.common.PageBean;
import mr.yang.yqsc.entity.Fangwei;
import mr.yang.yqsc.entity.FangweiQuery;
import mr.yang.yqsc.mapper.FangweiDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class FangWeiServiceImpl implements FangWeiService {

    @Autowired
    private FangweiDao fangweiDao;


    @Override
    public PageBean<Fangwei> findAll(Integer pageNo, Integer pageSize) {

        FangweiQuery m = new FangweiQuery();
        m.setPageNo(pageNo);
        m.setPageSize(pageSize);
        PageBean<Fangwei> pageBean = new PageBean<>();
        pageBean.setCurrentPage(pageNo);
        pageBean.setList(fangweiDao.selectByExample(m));
        pageBean.setTotalCount(fangweiDao.countByExample(m));
        pageBean.setPageSize(pageSize);
        pageBean.initPageTotal();
        return pageBean;
    }

    @Override
    public boolean delById(Integer id) {
        int i = fangweiDao.deleteByPrimaryKey(id);

        return i > 0 ? true : false;
    }

    @Override
    public boolean add(String yqname) {
        Fangwei fangwei = new Fangwei();
        fangwei.setQname(yqname);
        String fwm = "FW" + UUID.randomUUID().toString().replace("-", "");

        fangwei.setSerialnum(fwm);
        int i = fangweiDao.insert(fangwei);
        return i > 0 ? true : false;
    }

    @Override
    public Fangwei findBySerialNum(String serialNum) {
        FangweiQuery m = new FangweiQuery();
        FangweiQuery.Criteria criteria = m.createCriteria();
        criteria.andSerialnumEqualTo(serialNum);
        List<Fangwei> fangweis = fangweiDao.selectByExample(m);
        if (fangweis.size()>0) return fangweis.get(0);
        return new Fangwei();
    }

    @Override
    public Fangwei check(String serialNum) {

        FangweiQuery m = new FangweiQuery();
        FangweiQuery.Criteria criteria = m.createCriteria();
        criteria.andSerialnumEqualTo(serialNum);
        List<Fangwei> fangweis = fangweiDao.selectByExample(m);
        if (fangweis.size()>0) {
            delBySerialNum(serialNum);
            return fangweis.get(0);
        }
        return null;
    }


    @Override
    public boolean delBySerialNum(String serialNum) {
        FangweiQuery m = new FangweiQuery();
        FangweiQuery.Criteria criteria = m.createCriteria();
        criteria.andSerialnumEqualTo(serialNum);
        int i = fangweiDao.deleteByExample(m);
        return i > 0 ? true : false;
    }
}
