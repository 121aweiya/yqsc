package mr.yang.yqsc.entity;

import java.io.Serializable;
import java.util.Date;

public class News implements Serializable {
    private Integer id;

    private String newstitle;

    /**
     * 发布人
     */
    private String deployname;

    private Date deploytime;

    /**
     * 0否 1是
     */
    private Integer isdel;

    private String newscontent;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNewstitle() {
        return newstitle;
    }

    public void setNewstitle(String newstitle) {
        this.newstitle = newstitle == null ? null : newstitle.trim();
    }

    public String getDeployname() {
        return deployname;
    }

    public void setDeployname(String deployname) {
        this.deployname = deployname == null ? null : deployname.trim();
    }

    public Date getDeploytime() {
        return deploytime;
    }

    public void setDeploytime(Date deploytime) {
        this.deploytime = deploytime;
    }

    public Integer getIsdel() {
        return isdel;
    }

    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }

    public String getNewscontent() {
        return newscontent;
    }

    public void setNewscontent(String newscontent) {
        this.newscontent = newscontent == null ? null : newscontent.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", newstitle=").append(newstitle);
        sb.append(", deployname=").append(deployname);
        sb.append(", deploytime=").append(deploytime);
        sb.append(", isdel=").append(isdel);
        sb.append(", newscontent=").append(newscontent);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}