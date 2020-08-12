package mr.yang.yqsc.entity;

import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.Date;

@Repository
public class Yueqi implements Serializable {
    private Integer id;

    /**
     * 唯一标识码
     */
    private String yqnum;

    private String yqname;

    private Double newprice;

    /**
     * 库存
     */
    private Integer stock;

    private Double oldprice;

    /**
     * 是否热卖 0是 1否
     */
    private Integer ishot;

    /**
     * 是否上架 0否  1是
     */
    private Integer isshow;

    /**
     * 展示图片
     */
    private String imgurl;

    /**
     * 重量 kg
     */
    private Float weight;

    /**
     * 是否删除 0否  1是
     */
    private Integer isdel;

    /**
     * 添加时间
     */
    private Date createtime;

    private Integer categoryid;

    private String status;

    private String yqdescription;


    private Category category; //一个乐器对应一个分类;


    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getYqnum() {
        return yqnum;
    }

    public void setYqnum(String yqnum) {
        this.yqnum = yqnum == null ? null : yqnum.trim();
    }

    public String getYqname() {
        return yqname;
    }

    public void setYqname(String yqname) {
        this.yqname = yqname == null ? null : yqname.trim();
    }

    public Double getNewprice() {
        return newprice;
    }

    public void setNewprice(Double newprice) {
        this.newprice = newprice;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Double getOldprice() {
        return oldprice;
    }

    public void setOldprice(Double oldprice) {
        this.oldprice = oldprice;
    }

    public Integer getIshot() {
        return ishot;
    }

    public void setIshot(Integer ishot) {
        this.ishot = ishot;
    }

    public Integer getIsshow() {
        return isshow;
    }

    public void setIsshow(Integer isshow) {
        this.isshow = isshow;
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl == null ? null : imgurl.trim();
    }

    public Float getWeight() {
        return weight;
    }

    public void setWeight(Float weight) {
        this.weight = weight;
    }

    public Integer getIsdel() {
        return isdel;
    }

    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Integer getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(Integer categoryid) {
        this.categoryid = categoryid;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getYqdescription() {
        return yqdescription;
    }

    public void setYqdescription(String yqdescription) {
        this.yqdescription = yqdescription == null ? null : yqdescription.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", yqnum=").append(yqnum);
        sb.append(", yqname=").append(yqname);
        sb.append(", newprice=").append(newprice);
        sb.append(", stock=").append(stock);
        sb.append(", oldprice=").append(oldprice);
        sb.append(", ishot=").append(ishot);
        sb.append(", isshow=").append(isshow);
        sb.append(", imgurl=").append(imgurl);
        sb.append(", weight=").append(weight);
        sb.append(", isdel=").append(isdel);
        sb.append(", createtime=").append(createtime);
        sb.append(", categoryid=").append(categoryid);
        sb.append(", status=").append(status);
        sb.append(", yqdescription=").append(yqdescription);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}