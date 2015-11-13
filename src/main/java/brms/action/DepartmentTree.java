package brms.action;

import brms.common.JSONCommon;
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
    private static JSONCommon jsonCommon=new JSONCommon();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String type = req.getParameter("type");
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String departments=new JSONCommon().ReadFile(req.getSession().getServletContext().getRealPath("/")+"js\\department.json");
        if (departments==""||type!=null) {
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
                    new JSONCommon().writeFile(req.getSession().getServletContext().getRealPath("/")+"js\\department.json",jsonArray.toString());
                    if(type==null){
                        resp.getWriter().println(jsonArray.toString());
                    }
                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        }else {
            resp.getWriter().println(departments);
        }
    }
}
