package brms.utils;

import java.io.IOException;
import java.util.Properties;

/**
 * Created by Administrator on 2015/12/9.
 */
public class CommUtils {

        private static Properties prop = new Properties();
        static {

            try {
                prop.load(CommUtils.class.getClassLoader().getResourceAsStream(
                        "/config.properties"));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        public static String readUrl(String key) {
            return (String) prop.get(key);

        }
}
