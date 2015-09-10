package brms.action;

import org.apache.commons.lang.StringUtils;
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
 * Created by ligson on 2015/9/8.
 */
public class StructureQuery extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Map<String, Object> errorMsg = new HashMap<String, Object>();
        errorMsg.put("success", false);
        JSONObject errorJson = new JSONObject(errorMsg);
        String id = req.getParameter("id");
        if (StringUtils.isNotBlank(id)) {
            HttpGet httpGet = new HttpGet(Proxy.BASE_URL + "metatype/" + id);
            HttpResponse response = Proxy.httpClient.execute(httpGet, Proxy.context);
            if (response.getStatusLine().getStatusCode() == 200) {
                String jsonString = EntityUtils.toString(response.getEntity());
                try {
                    JSONObject jsonObject = new JSONObject(jsonString);
                    if (jsonObject.has("children")) {
                        JSONArray jsonArray = jsonObject.getJSONArray("children");
                        resp.setContentType("text/json");
                        System.out.println(jsonArray.toString());
                        resp.getWriter().println(jsonArray.toString());
                    } else {
                        resp.setContentType("text/json");
                        resp.getWriter().println("[]");
                    }

                } catch (JSONException e) {
                    resp.setContentType("text/json");
                    resp.getWriter().println(errorJson.toString());
                }
            } else {
                resp.setContentType("text/json");
                resp.getWriter().println(errorJson.toString());
            }
        } else {
            int page = 1;
            String pageString = req.getParameter("page");
            if (StringUtils.isNotBlank(pageString)) {
                page = Integer.parseInt(pageString);
            }
            HttpGet httpGet = new HttpGet(Proxy.BASE_URL + "metatype?kind=3&rows=10&page=" + page);
            HttpResponse response = Proxy.httpClient.execute(httpGet, Proxy.context);
            if (response.getStatusLine().getStatusCode() == 200) {
                String jsonString = EntityUtils.toString(response.getEntity(), "UTF-8");
                try {
                    JSONObject jsonObject = new JSONObject(jsonString);
                    //JSONArray jsonArray = jsonObject.getJSONArray("children");
                    resp.setContentType("text/json");
                    resp.getWriter().println(jsonObject.toString());
                } catch (JSONException e) {
                    resp.setContentType("text/json");
                    resp.getWriter().println(errorJson.toString());
                }
            } else {
                resp.setContentType("text/json");
                resp.getWriter().println(errorJson.toString());
            }
        }
    }
}
