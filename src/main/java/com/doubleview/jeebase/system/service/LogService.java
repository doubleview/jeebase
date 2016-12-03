package com.doubleview.jeebase.system.service;

import com.doubleview.jeebase.support.base.BaseService;
import com.doubleview.jeebase.support.web.Page;
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

}
