package com.base.services;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/**
 * Created with IntelliJ IDEA.
 * User: y.zavada
 * Date: 6/22/14
 * Time: 9:55 PM
 */
@Component
public class HttpRequestSplitService {

    public Set<FileItem> getFiles(HttpServletRequest req) {
        Set<FileItem> resultFiles = new HashSet<>();
        boolean isMultipart = ServletFileUpload.isMultipartContent(req);

        if (isMultipart) {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            try {
                List items = upload.parseRequest(req);
                Iterator iterator = items.iterator();
                while (iterator.hasNext()) {
                    FileItem item = (FileItem) iterator.next();
                    resultFiles.add(item);
                }
            } catch (FileUploadException e) {
                e.printStackTrace();
            }
        }
        return resultFiles;
    }

    public FileItem getFile(HttpServletRequest req) {
        boolean isMultipart = ServletFileUpload.isMultipartContent(req);

        if (isMultipart) {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            try {
                List items = upload.parseRequest(req);
                return (FileItem) items.get(0);

            } catch (FileUploadException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
