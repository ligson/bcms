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

public class DepartmentTree extends HttpServlet {
    private static Logger logger = Logger.getLogger(DepartmentTree.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        resp.setCharacterEncoding("UTF-8");
        if (id == null) {
            String url = Proxy.BASE_URL + "department/";
            logger.debug("请求url:" + url);
            logger.debug("请求方法:GET");
            HttpGet httpGet = new HttpGet(url);
            HttpResponse response = Proxy.httpClient.execute(httpGet, Proxy.context);
            int state = response.getStatusLine().getStatusCode();
            logger.debug("返回状态:" + state);
            String json = EntityUtils.toString(response.getEntity(), "UTF-8");
            logger.debug("返回结果:" + json);
            if (state == 200) {
                try {
                    JSONArray jsonArray = new JSONArray(json);
                    resp.getWriter().println(jsonArray.toString());
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        } else {
            HttpGet httpGet = new HttpGet(Proxy.BASE_URL + "department/" + id);
            HttpResponse response = Proxy.httpClient.execute(httpGet, Proxy.context);
            if (response.getStatusLine().getStatusCode() == 200) {
                String json = EntityUtils.toString(response.getEntity());
                try {
                    JSONObject jsonObject = new JSONObject(json);
                    JSONArray jsonArray = jsonObject.getJSONArray("children");
                    resp.getWriter().println(jsonArray.toString());
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
