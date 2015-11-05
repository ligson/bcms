package brms.action;

import org.apache.http.HttpResponse;
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
import java.util.*;

/**
 * Created by ligson on 2015/10/8.
 */
public class ResouceMetaQuery extends HttpServlet {
    private static Logger logger = Logger.getLogger(ResouceMetaQuery.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        String resourceId = request.getParameter("id");
        String url = Proxy.BASE_URL + "resource/" + resourceId + "/meta";
        logger.debug("请求地址:" + url);
        logger.debug("请求方法:GET");
        HttpGet get = new HttpGet(url);
        HttpResponse response1 = Proxy.httpClient.execute(get, Proxy.context);
        int statusCode = response1.getStatusLine().getStatusCode();
        Map<String, Object> result = new HashMap<>();
        logger.debug("响应状态码:" + statusCode);
        if (statusCode == 200) {
            String jsonString = EntityUtils.toString(response1.getEntity());
            logger.debug("响应数据:" + jsonString);
            List<JSONObject> rows = new ArrayList<>();
            try {

                JSONObject metalib = new JSONObject(jsonString);
                JSONObject object =(JSONObject)metalib.get("data");

                result.put("total", object.length());
                Iterator iterator = object.keys();
                while (iterator.hasNext()) {
                    String key = (String) iterator.next();
                    HttpGet httpGet = new HttpGet(Proxy.BASE_URL + "metatype/" + key);
                    HttpResponse response2 = Proxy.httpClient.execute(httpGet, Proxy.context);
                    if (200 == response2.getStatusLine().getStatusCode()) {
                        String jsonString2 = EntityUtils.toString(response2.getEntity());
                        JSONObject jsonObject = new JSONObject(jsonString2);
                        rows.add(jsonObject);
                    }
                }

                //JSONObject jsonObject = new JSONObject(jsonString);
//                JSONArray jsonArray1 = new JSONArray();
//                Iterator iterator = jsonObject.keys();
//                while (iterator.hasNext()) {
//                    String key = (String) iterator.next();
//                    Object o = jsonObject.get(key);
//                    System.out.println(o.getClass().getName());
//                }
                result.put("rows", rows);
                result.put("total", rows.size());
            } catch (Exception e) {
                result.put("rows", new JSONArray());
                result.put("total", 0);
            }
        } else {
            result.put("rows", new JSONArray());
            result.put("total", 0);
        }

        JSONObject jsonObject = new JSONObject(result);
        response.getWriter().print(jsonObject.toString());

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
