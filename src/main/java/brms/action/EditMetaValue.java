package brms.action;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2015/11/6 0006.
 */
public class EditMetaValue extends HttpServlet {
    private static Logger logger = Logger.getLogger(MetaTypeList.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String value = request.getParameter("value");
        Map<String, Object> result = new HashMap<>();
        String url = Proxy.BASE_URL + "resource/" + id + "/meta/";
        logger.debug("访问url:" + url);
        logger.debug("访问方法:POST");
        HttpPost post = new HttpPost(url);
        StringEntity stringEntity = new StringEntity(value, "UTF-8");
        post.setEntity(stringEntity);
        logger.debug("请求参数:" + value);
        HttpResponse response1 = Proxy.httpClient.execute(post, Proxy.context);
        logger.debug("返回状态:" + response1.getStatusLine().getStatusCode());
        if (response1.getStatusLine().getStatusCode() == 200) {
            String jsonString = EntityUtils.toString(response1.getEntity());
            response.getWriter().println(jsonString);
        } else {
            result.put("success", false);
            result.put("status", response1.getStatusLine().getStatusCode());
            JSONObject jsonObject = new JSONObject(result);
            String res = jsonObject.toString();
            logger.debug("返回结果:" + res);
            response.getWriter().println(res);
        }
    }
}
