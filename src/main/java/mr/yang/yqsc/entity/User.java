package mr.yang.yqsc.entity;

/**
 * 测式类
 */
public class User {
    private Integer tid;
    private String tname;
    private Integer tpid;

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public Integer getTpid() {
        return tpid;
    }

    public void setTpid(Integer tpid) {
        this.tpid = tpid;
    }

    @Override
    public String toString() {
        return "User{" +
                "tid=" + tid +
                ", tname='" + tname + '\'' +
                ", pid=" + tpid +
                '}';
    }
}
