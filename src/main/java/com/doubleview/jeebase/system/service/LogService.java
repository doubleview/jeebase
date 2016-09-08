package com.doubleview.jeebase.system.service;

import com.doubleview.jeebase.support.base.BaseService;
import com.doubleview.jeebase.support.persistence.Page;
import com.doubleview.jeebase.support.utils.DateTimeUtils;
import com.doubleview.jeebase.system.dao.LogDao;
import com.doubleview.jeebase.system.model.Log;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 字典Service
 */
@Service
@Transactional(readOnly = true)
public class LogService extends BaseService<LogDao, Log>{

    /**
     * 获取日志列表
     * @param page 分页对象
     * @param log
     * @return
     */
    @Override
    public Page<Log> findPage(Page<Log> page, Log log) {
        // 设置默认时间范围，默认当前月
        if (log.getBeginDate() == null){
            log.setBeginDate(DateTimeUtils.setDays(DateTimeUtils.parseDate(DateTimeUtils.getDate()), 1));
        }
        if (log.getEndDate() == null){
            log.setEndDate(DateTimeUtils.addMonths(log.getBeginDate(), 1));
        }
        return super.findPage(page, log);
    }
}
