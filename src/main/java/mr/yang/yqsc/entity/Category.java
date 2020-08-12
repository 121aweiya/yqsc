package mr.yang.yqsc.entity;

import java.io.Serializable;

public class Category implements Serializable {
    /**
     * 类别ID
     */
    private Integer id;

    /**
     * 类别名字
     */
    private String categoryname;

    /**
     * 类别描述
     */
    private String description;

    /**
     * 0否 1是
     */
    private Integer isdel;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCategoryname() {
        return categoryname;
    }

    public void setCategoryname(String categoryname) {
        this.categoryname = categoryname == null ? null : categoryname.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Integer getIsdel() {
        return isdel;
    }

    public void setIsdel(Integer isdel) {
        this.isdel = isdel;
    }

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", categoryname='" + categoryname + '\'' +
                ", description='" + description + '\'' +
                ", isdel=" + isdel +
                '}';
    }
}