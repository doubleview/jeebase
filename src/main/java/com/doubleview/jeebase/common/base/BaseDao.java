package com.doubleview.jeebase.common.base;

import java.util.List;

/**
 * Dao基础接口
 */
public interface BaseDao<T> {

    /**
     * 获取单条数据
     * @param id 实体类主键
     * @return 实体对象
     */
     T get(String id);

    /**
     * 获取单条数据
     * @param entity 实体对象
     * @return 实体对象
     */
     T get(T entity);

    /**
     * 查询数据列表，如果需要分页，请设置分页对象，如：entity.setPage(new Page<T>());
     * @param entity 实体对象
     * @return 实体对象列表
     */
     List<T> findList(T entity);


    /**
     * 插入数据
     * @param entity 实体对象
     * @return
     */
     int insert(T entity);

    /**
     * 更新数据
     * @param entity
     * @return
     */
     int update(T entity);


    /**
     * 删除数据（一般为逻辑删除，更新del_flag字段为1）
     * @param entity
     * @return
     */
     int delete(T entity);

}
