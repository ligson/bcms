package brms.common;

import java.io.*;

/**
 * Created by Ruby on 2015/11/11.
 */
public class JSONCommon {

    public boolean setElect(String path,String sets){
        try {
            writeFile(path,sets);
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }

    }

    public String ReadFile(String path){
        File file = new File(path);
        BufferedReader reader = null;
        String laststr = "";
        try {
            //System.out.println("以行为单位读取文件内容，一次读一整行：");
            reader = new BufferedReader(new FileReader(file));
            String tempString = null;
            int line = 1;
            //一次读入一行，直到读入null为文件结束
            while ((tempString = reader.readLine()) != null) {
                //显示行号
                System.out.println("line " + line + ": " + tempString);
                laststr = laststr + tempString;
                line ++;
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
        return laststr;
    }
    //把json格式的字符串写到文件
    public void writeFile(String filePath, String sets) throws IOException {
        FileWriter fw = new FileWriter(filePath);
        PrintWriter out = new PrintWriter(fw);
        out.write(sets);
        out.println();
        fw.close();
        out.close();
    }
}
