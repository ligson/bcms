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
import java.util.ArrayList;
import java.util.List;

/**
 * Created by ligson on 2015/9/10.
 */
public class CategoryTree extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String type = req.getParameter("type");
        if (id == null) {
            HttpGet httpGet = new HttpGet(Proxy.BASE_URL + "metalibrarycategory/");
            HttpResponse response = Proxy.httpClient.execute(httpGet, Proxy.context);
            if (response.getStatusLine().getStatusCode() == 200) {
                String json = EntityUtils.toString(response.getEntity(),"UTF-8");
                try {
                    JSONArray jsonArray = new JSONArray(json);
                    resp.getWriter().println(jsonArray.toString());
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        } else {
            HttpGet httpGet = new HttpGet(Proxy.BASE_URL + "metalibrarycategory/" + id);
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
