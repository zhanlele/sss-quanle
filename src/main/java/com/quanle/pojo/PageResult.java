package com.quanle.pojo;

import java.util.List;

/**
 * 分页查询结果对象
 *
 * @author quanle
 */
public class PageResult<T> {
    /**
     * 总记录数
     */
    private Long total;
    /**
     * 总共多少页
     */
    private Integer totalPage;
    /**
     * 每页多少条记录
     */
    private Integer pageSize = 10;
    /**
     * 当前第几页
     */
    private Integer page = 1;
    /**
     * 每页数据记录
     */
    private List<T> rows;

    public Long getTotal() {
        return total;
    }

    public void setTotal(Long total) {
        this.total = total;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }
}
