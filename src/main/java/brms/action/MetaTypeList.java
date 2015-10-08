package brms.action;

import org.apache.http.HttpResponse;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.HttpGet;
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
 * Created by ligson on 2015/9/17.
 */
public class MetaTypeList extends HttpServlet {
    private static Logger logger = Logger.getLogger(MetaTypeList.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        Map<String, Object> result = new HashMap<>();
        String url = Proxy.BASE_URL + "metalibrary/" + id;
        logger.debug("访问url:" + url);
        logger.debug("访问方法:GET");
        HttpGet get = new HttpGet(url);
        //get.setConfig(Proxy.requestConfig);

        HttpResponse response1 = Proxy.httpClient.execute(get, Proxy.context);
        if (response1.getStatusLine().getStatusCode() == 200) {
            String jsonString = EntityUtils.toString(response1.getEntity());
            try {
                JSONObject metalib = new JSONObject(jsonString);
                JSONArray jsonArray = metalib.getJSONArray("meta_types");
                result.put("total", jsonArray.length());
                List<JSONObject> rows = new ArrayList<>();
                for (int i = 0; i < jsonArray.length(); i++) {
                    int matetypeId = jsonArray.getJSONObject(i).getInt("id");
                    HttpGet httpGet = new HttpGet(Proxy.BASE_URL + "metatype/" + matetypeId);
                    HttpResponse response2 = Proxy.httpClient.execute(httpGet, Proxy.context);
                    if (200 == response2.getStatusLine().getStatusCode()) {
                        String jsonString2 = EntityUtils.toString(response2.getEntity());
                        JSONObject jsonObject = new JSONObject(jsonString2);
                        rows.add(jsonObject);
                    }
                }
                result.put("rows", rows);
                JSONObject jsonObject = new JSONObject(result);
                String res = jsonObject.toString();
                logger.debug("返回结果:" + res);
                response.getWriter().println(res);
            } catch (JSONException e) {
                e.printStackTrace();
            }

        } else {
            result.put("success", false);
            result.put("status", response1.getStatusLine().getStatusCode());
            JSONObject jsonObject = new JSONObject(result);
            String res = jsonObject.toString();
            logger.debug("返回结果:" + res);
            response.getWriter().println(res);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
