package brms.job;

import org.apache.http.client.utils.DateUtils;
import org.apache.log4j.Logger;

import java.util.TimerTask;

/**
 * Created by ligson on 2015/10/15.
 * 防止线程池造成内存溢出
 */
public class CleanThreadLocalTask extends TimerTask {
    private static Logger logger = Logger.getLogger(CleanThreadLocalTask.class);

    @Override
    public void run() {
        logger.debug("清理线程池");
        DateUtils.clearThreadLocal();
    }
}
