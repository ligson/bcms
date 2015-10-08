package brms.action;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by ligson on 2015/10/8.
 */
public class ResouceMetaQuery extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        String resourceId = request.getParameter("id");
        String url = Proxy.BASE_URL + "resource/" + resourceId + "/meta";
        HttpGet get = new HttpGet(url);
        HttpResponse response1 = Proxy.httpClient.execute(get, Proxy.context);
        int statusCode = response1.getStatusLine().getStatusCode();
        Map<String, Object> result = new HashMap<>();
        if (statusCode == 200) {
            String jsonString = EntityUtils.toString(response1.getEntity());
            try {
                JSONArray jsonArray = new JSONArray(jsonString);
                JSONArray jsonArray1 = new JSONArray();
                for (int i = 0; i < jsonArray.length(); i++) {
                    JSONObject jsonObject = jsonArray.getJSONObject(i);
                    int kind = jsonObject.getInt("kind");
                    if (kind == 3) {
                        int structure_type_id = jsonObject.getInt("structure_type_id");
                        String url2 = Proxy.BASE_URL + "metatype/" + structure_type_id;
                        HttpGet httpGet = new HttpGet(url2);
                        HttpResponse response2 = Proxy.httpClient.execute(httpGet, Proxy.context);
                        if (response2.getStatusLine().getStatusCode() == 200) {
                            JSONObject jsonObject1 = new JSONObject(EntityUtils.toString(response2.getEntity()));
                            jsonObject.put("children", jsonObject1.getJSONArray("children"));
                        }
                    }
                    jsonArray1.put(jsonObject);
                }
                result.put("rows", jsonArray1);
                result.put("total", jsonArray.length());
            } catch (JSONException e) {
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
