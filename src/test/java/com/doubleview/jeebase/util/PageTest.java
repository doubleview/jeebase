package com.doubleview.jeebase.util;

import com.doubleview.jeebase.support.web.Page;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by Administrator on 2016/12/2 0002.
 */
public class PageTest {

    Logger logger = LoggerFactory.getLogger(PageTest.class);

    @Test
    public void testPageString(){
        Page page = new Page(5 , 30 , 1000);
        page.initialize();
        logger.debug("首页 : {}" ,page.getFirst());
        logger.debug("尾页 : {}" ,page.getLast());
        logger.debug("当前页 : {}" ,page.getPageNo());
        logger.debug("总页数: {}", page.getTotalPage());
        logger.debug("总数 : {}" ,page.getTotalSize());
        logger.debug(page.getHtml());
    }
}
