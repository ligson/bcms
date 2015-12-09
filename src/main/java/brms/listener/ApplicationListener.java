package brms.listener; /**
 * Created by ligson on 2015/10/15.
 * 系统坚挺
 */

import brms.action.DepartmentTree;
import brms.action.Proxy;
import brms.common.JSONCommon;
import brms.job.CleanThreadLocalTask;
import brms.utils.CommUtils;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONException;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.Timer;

public class ApplicationListener implements ServletContextListener {
    private static Logger logger = Logger.getLogger(ApplicationListener.class);

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        logger.info("系统正常启动!");
        Proxy.BASE_URL= CommUtils.readUrl("BASE_URL");
        Proxy.STATISTICAL_URL=CommUtils.readUrl("STATISTICAL_URL");
        //10分钟清理一下httpclean的dateformate线程池
        Timer timer = new Timer();
        long delay = 1000;
        long period = delay * 60 * 10;
        timer.schedule(new CleanThreadLocalTask(), delay, period);

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        logger.info("系统正常退出!");
    }

}
