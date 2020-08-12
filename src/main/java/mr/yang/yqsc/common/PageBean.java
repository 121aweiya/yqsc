package mr.yang.yqsc.common;

import java.util.ArrayList;
import java.util.List;

/**
 * 分页对象
 */
public class PageBean<T> {

    private int totalCount;//总记录数
    private int totalPage;//总页数
    private int currentPage;//当前页码
    private int pageSize;//每页显示的条数

    private List<T> list;//每页显示的数据集合

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }


    public void initPageTotal() {
        this.totalPage = totalCount / pageSize;
        if (totalCount % pageSize != 0) totalPage++;

    }

    //取得页码1
    public int getPageStartNo() {

        if (totalPage <= 10) return 1;

        return currentPage - 5 <= 0 ? 1 : currentPage - 5;

    }

    //取得页码2
    public int getPageEndNo() {
        if (currentPage + 5 < 10 && totalPage > 10) return 10;

        return currentPage + 5 >= totalPage ? totalPage : currentPage + 5;
    }
}
