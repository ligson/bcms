package brms.utils;

import org.apache.commons.codec.binary.Hex;
import org.apache.commons.io.FileUtils;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.RandomAccessFile;
import java.security.MessageDigest;

/**
 * Created by Administrator on 2015/9/19 0019.
 */
public class HashUtils {
    public static String fileHash(String filePath) throws Exception {
        File file = new File(filePath);
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        if (file.length() < 1024) {
            FileInputStream fileInputStream = FileUtils.openInputStream(file);
            byte[] buffer = new byte[16];
            int mark = 0;
            while ((mark = fileInputStream.read(buffer)) != -1) {
                bos.write(buffer, 0, mark);
            }
            fileInputStream.close();
        } else {
            RandomAccessFile accessFile = new RandomAccessFile(file, "r");
            byte[] buffer = new byte[16];
            accessFile.read(buffer);
            bos.write(buffer);

            accessFile.seek(file.length() / 2);
            accessFile.read(buffer);
            bos.write(buffer);

            accessFile.seek(file.length() - 16);
            accessFile.read(buffer);
            bos.write(buffer);

        }
        byte[] buffer = bos.toByteArray();
        bos.close();
        MessageDigest md = MessageDigest.getInstance("MD5");
        md.update(buffer);
        byte[] hash = md.digest();
        return Hex.encodeHexString(hash).toUpperCase();
    }

    public static void main(String args[]) throws Exception {

        System.out.println(fileHash("C:\\Users\\Administrator\\Desktop\\Git-2.5.1-64-bit.exe"));
    }
}
