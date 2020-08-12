package mr.yang.yqsc.entity;

import java.io.Serializable;
import java.util.Date;

public class MyOrder implements Serializable {
    private Integer id;

    private String recvname;

    private String phone;

    private Integer buynum;

    private Integer payfs;//支付的方式，0余额，1支付宝，2微信

    private String addr;

    private String remark ;

    private Double totalmoney;

    private String kdname;

    private String kdnum;

    private Integer mid;

    private Integer yid;

    private Integer status = 0;//0未支付，1已支付，2待发货，3待签收，4完成

    private Integer isdel = 0;//0未删除，1删除

    private Date createtime = new Date(System.currentTimeMillis());


    //1to1
    private Member member = new Member();

    private Yueqi yueqi = new Yueqi();

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    public Yueqi getYueqi() {
        return yueqi;
    }

    public void setYueqi(Yueqi yueqi) {
        this.yueqi = yueqi;
    }



    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRecvname() {
        return recvname;
    }

    public void setRecvname(String recvname) {
        this.recvname = recvname == null ? null : recvname.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getBuynum() {
        return buynum;
    }

    public void setBuynum(Integer buynum) {
        this.buynum = buynum;
    }

    public Integer getPayfs() {
        return payfs;
    }

    public void setPayfs(Integer payfs) {
        this.payfs = payfs;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr == null ? null : addr.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Double getTotalmoney() {
        return totalmoney;
    }

    public void setTotalmoney(Double totalmoney) {
        this.totalmoney = totalmoney;
    }

    public String getKdname() {
        return kdname;
    }

    public void setKdname(String kdname) {
        this.kdname = kdname == null ? null : kdname.trim();
    }

    public String getKdnum() {
        return kdnum;
    }

    public void setKdnum(String kdnum) {
        this.kdnum = kdnum == null ? null : kdnum.trim();
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public Integer getYid() {
        return yid;
    }

    public void setYid(Integer yid) {
        this.yid = yid;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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


    @Override
    public String toString() {
        return "MyOrder{" +
                "id=" + id +
                ", recvname='" + recvname + '\'' +
                ", phone='" + phone + '\'' +
                ", buynum=" + buynum +
                ", payfs=" + payfs +
                ", addr='" + addr + '\'' +
                ", remark='" + remark + '\'' +
                ", totalmoney=" + totalmoney +
                ", kdname='" + kdname + '\'' +
                ", kdnum='" + kdnum + '\'' +
                ", mid=" + mid +
                ", yid=" + yid +
                ", status=" + status +
                ", isdel=" + isdel +
                ", createtime=" + createtime +
                '}';
    }
}