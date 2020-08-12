package mr.yang.yqsc.entity;


import java.io.Serializable;

public class Fangwei implements Serializable {
    private Integer id;

    /**
     * 乐器名称
     */
    private String qname;

    /**
     * 防伪码
     */
    private String serialnum;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQname() {
        return qname;
    }

    public void setQname(String qname) {
        this.qname = qname == null ? null : qname.trim();
    }

    public String getSerialnum() {
        return serialnum;
    }

    public void setSerialnum(String serialnum) {
        this.serialnum = serialnum == null ? null : serialnum.trim();
    }

    @Override
    public String toString() {
        return "Fangwei{" +
                "id=" + id +
                ", qname='" + qname + '\'' +
                ", serialnum='" + serialnum + '\'' +
                '}';
    }
}