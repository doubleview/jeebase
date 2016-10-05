package com.doubleview.jeebase.support.base;

import com.doubleview.jeebase.support.web.Page;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 *Service基础接口
 */
@Transactional(readOnly = true)
public abstract class BaseService<D extends BaseDao<T>,T extends  BaseModel<T>> {

    /**
     * 持久层对象
     */
    @Autowired
    protected D dao;

    /**
     * 获取单条数据
     * @param id 主键
     * @return 实体对象
     */
    public T get(String id) {
        return dao.get(id);
    }

    /**
     * 获取单条数据
     * @param entity 实体对象
     * @return 实体对象
     */
    public T get(T entity) {
        return dao.get(entity);
    }

    /**
     * 查询列表数据
     * @param entity 实体对象
     * @return 查询出的数据列表
     */
    public List<T> getList(T entity) {
        return dao.getList(entity);
    }

    /**
     * 查询分页数据
     * @param page 分页对象
     * @param entity 实体对象
     * @return 分页对象(包含查询出的数据列表)
     */
    public Page<T> getPage(Page<T> page, T entity) {
        entity.setPage(page);
        page.setList(dao.getList(entity));
        return page;
    }

    /**
     * 保存数据（插入或更新）
     * @param entity 要保存或更新的实体
     */
    @Transactional(readOnly = false)
    public void save(T entity) {
        if (StringUtils.isEmpty(entity.getId())){
            entity.preInsert();
            dao.insert(entity);
        }else{
            entity.preUpdate();
            dao.update(entity);
        }
    }

    /**
     * 删除数据
     * @param entity 要删除的实体
     */
    @Transactional(readOnly = false)
    public void delete(T entity) {
        dao.delete(entity);
    }

}
