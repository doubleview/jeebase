package com.doubleview.jeebase.system.dao;

import com.doubleview.jeebase.support.base.BaseDao;
import com.doubleview.jeebase.support.persistence.MyBatisDao;
import com.doubleview.jeebase.system.model.Log;

/**
 * 日志Dao接口
 */
@MyBatisDao
public interface LogDao extends BaseDao<Log>{

}
