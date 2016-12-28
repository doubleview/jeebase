package com.doubleview.jeebase.support.utils;

import com.doubleview.jeebase.support.config.Constant;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;

/**
 * 文件的上传下载
 */
public class FileUtils {

    public static final String UPLOAD_DIR;

    public static final String StreamType = "application/octet-stream";

    static {
        UPLOAD_DIR = Constant.getConfig("user.img.dir");
    }

    /**
     * 将上传的文件进行重命名
     * @param name
     * @return
     */
    public static String rename(String name) {
        Long now = Long.parseLong(DateTimeUtils.format(new Date() , "yyyyMMddHHmmss"));
        Long random = (long) (Math.random() * now);
        String fileName = now + "" + random;
        if (name.indexOf(".") != -1) {
            fileName += name.substring(name.lastIndexOf("."));
        }
        return fileName;
    }

    /**
     * 多文件上传
     *
     * @param request
     * @throws Exception
     */
    public static String  upload(HttpServletRequest request) throws Exception {

        MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;
        Map<String, MultipartFile> fileMap = mRequest.getFileMap();
        String uploadDir = request.getSession().getServletContext().getRealPath("/") + UPLOAD_DIR;
        String newName = null;
        File file = new File(uploadDir);
        if (!file.exists()) {
            file.mkdir();
        }
        String fileName = null;
        int i = 0;
        for (Iterator<Map.Entry<String, MultipartFile>> it = fileMap.entrySet()
                .iterator(); it.hasNext(); i++) {
            Map.Entry<String, MultipartFile> entry = it.next();
            MultipartFile mFile = entry.getValue();
            fileName = mFile.getOriginalFilename();
            newName = rename(fileName);
            String storeName = uploadDir + newName;
            Files.copy(mFile.getInputStream(), Paths.get(storeName));
        }
        return newName;
    }

    /**
     * 下载
     *
     * @param request
     * @param response
     * @param storeName
     * @param contentType
     * @throws Exception
     */
    public static void download(HttpServletRequest request,
                                HttpServletResponse response, String storeName, String contentType) throws Exception {
        String ctxPath = request.getSession().getServletContext().getRealPath("/") + UPLOAD_DIR;
        String downLoadPath = ctxPath + storeName;
        long fileLength = new File(downLoadPath).length();
        request.setCharacterEncoding("UTF-8");
        response.setContentType(contentType==null ? StreamType : contentType);
        response.setHeader("Content-disposition", "attachment; filename="+storeName);
        response.setHeader("Content-Length", String.valueOf(fileLength));
        Files.copy(Paths.get(downLoadPath), response.getOutputStream());
    }
}
