package mr.yang.yqsc.entity;

import java.io.Serializable;

public class Comment implements Serializable {
    private Integer id;

    private String contents;

    /**
     * 商品Id
     */
    private Integer pid;

    /**
     * 用户id
     */
    private Integer mid;

    /**
     * 是否删除 0否  1是
     */
    private Integer isdel;



    private Yueqi yueqi; //一个评论对应一乐器


    private Member member; // 一个评应对应一个会员



    public Yueqi getYueqi() {
        return yueqi;
    }

    public void setYueqi(Yueqi yueqi) {
        this.yueqi = yueqi;
    }

    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents == null ? null : contents.trim();
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getMid() {
        return mid;
    }

    public void setMid(Integer mid) {
        this.mid = mid;
    }

    public Integer getIsdel() {
        return isdel;
    }

    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", contents=").append(contents);
        sb.append(", pid=").append(pid);
        sb.append(", mid=").append(mid);
        sb.append(", isdel=").append(isdel);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}