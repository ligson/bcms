package brms.action;

import brms.utils.HashUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.log4j.lf5.util.StreamUtils;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.*;

/**
 * Created by ligson on 2015/8/12.
 */
public class UploadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Access-Control-Allow-Origin", "*");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
        try {
            List<FileItem> fileItems = upload.parseRequest(request);
            File root = new File("D:/temp/");
            long start = 0;
            long end = 0;
            long fileSize = 0;
            String hash = null;
            String fileName = null;
            byte[] data = null;
            InputStream inputStream = null;

            for (FileItem fileItem : fileItems) {
                if (fileItem.getFieldName().equals("start")) {
                    start = Long.parseLong(fileItem.getString());
                } else if (fileItem.getFieldName().equals("end")) {
                    end = Long.parseLong(fileItem.getString());
                } else if (fileItem.getFieldName().equals("fileSize")) {
                    fileSize = Long.parseLong(fileItem.getString());
                } else if (fileItem.getFieldName().equals("fileName")) {
                    fileName = fileItem.getString();
                } else if (fileItem.getFieldName().equals("hash")) {
                    hash = fileItem.getString();
                } else if (fileItem.getFieldName().equals("data")) {
                    inputStream = fileItem.getInputStream();
                    data = StreamUtils.getBytes(inputStream);
                }
            }

            File tempFile = new File(root, hash + "=" + start + "=" + end + "=" + fileSize);
            if (tempFile.exists()) {
                tempFile.delete();
            }
            tempFile.createNewFile();

            FileOutputStream fos = new FileOutputStream(tempFile);
            fos.write(data);
            fos.close();

            final String hash1 = hash;
            if (end == fileSize) {
                System.out.println("ok.....");
                File[] files = root.listFiles(new FilenameFilter() {
                    @Override
                    public boolean accept(File dir, String name) {
                        return name.startsWith(hash1) && name.split("=").length == 4;
                    }
                });

                Arrays.sort(files, new Comparator<File>() {
                    @Override
                    public int compare(File o1, File o2) {
                        String name1 = o1.getName();
                        String name2 = o2.getName();
                        String[] nameArray1 = name1.split("=");
                        String[] nameArray2 = name2.split("=");
                        String hash1 = nameArray1[0];
                        long start1 = Long.parseLong(nameArray1[1]);
                        long end1 = Long.parseLong(nameArray1[2]);
                        long fileSize1 = Long.parseLong(nameArray1[3]);

                        String hash2 = nameArray2[0];
                        long start2 = Long.parseLong(nameArray2[1]);
                        long end2 = Long.parseLong(nameArray2[2]);
                        long fileSize2 = Long.parseLong(nameArray2[3]);

                        if (hash1.equals(hash2)) {
                            if (start1 == start2) {
                                if (end1 == end2) {
                                    return (int) (fileSize1 - fileSize2);
                                } else {
                                    return (int) (end1 - end2);
                                }
                            } else {
                                return (int) (start1 - start2);
                            }
                        } else {
                            return hash1.compareTo(hash2);
                        }
                    }
                });
                File destFile = new File(root, fileName);
                try {
                    if (destFile.exists()) {
                        destFile.delete();
                    }
                    destFile.createNewFile();

                    FileOutputStream fileOutputStream = FileUtils.openOutputStream(destFile, true);
                    for (File file : files) {
                        FileInputStream fileInputStream = FileUtils.openInputStream(file);
                        StreamUtils.copy(fileInputStream, fileOutputStream, 1024 * 1024);
                        fileInputStream.close();
                        file.delete();
                    }
                    fileOutputStream.close();
                    System.out.println("=======================");
                    String hash2 = HashUtils.fileHash(destFile.getAbsolutePath());
                    System.out.println(hash2);
                    if (hash2.equals(hash)) {
                        System.out.println("======ok.................");
                    } else {
                        System.out.println("======fail.................");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
            Map<String, Object> res = new HashMap<>();
            res.put("file", tempFile.getAbsolutePath());
            JSONObject jsonObject = new JSONObject(res);
            response.getWriter().print(jsonObject.toString());
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
