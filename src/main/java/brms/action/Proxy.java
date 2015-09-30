package brms.action;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.methods.*;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class Proxy
 */
public class Proxy extends HttpServlet {
    private static Logger logger = Logger.getLogger(Proxy.class);
    private static final long serialVersionUID = 1L;
    public final static String BASE_URL = "http://42.62.52.40:8000/";
    public static CloseableHttpClient httpClient;
    public static HttpContext context = new BasicHttpContext();


    /**
     * @see HttpServlet#HttpServlet()
     */
    public Proxy() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    public void init() throws ServletException {
        HttpClientBuilder builder = HttpClientBuilder.create();
        PoolingHttpClientConnectionManager cm = new PoolingHttpClientConnectionManager();
        // 将最大连接数增加到200
        cm.setMaxTotal(200);
        // 将每个路由基础的连接增加到20
        cm.setDefaultMaxPerRoute(20);
        //将目标主机的最大连接数增加到50
        builder.setConnectionManager(cm);
        httpClient = builder.build();

    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        HttpGet httpGet = new HttpGet(parseToUrl(request));
        executeMethod(httpGet, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("UTF-8");
        String url = request.getParameter("url");
        String method = request.getParameter("method");
        logger.debug("请求url:" + BASE_URL + url);
        logger.debug("请求方法:" + method);
        if (method.equalsIgnoreCase("get")) {
            doGet(request, response);
        } else if (method.equalsIgnoreCase("put")) {
            doPut(request, response);
        } else if (method.equalsIgnoreCase("delete")) {
            doDelete(request, response);
        } else {
            //String url = request.getParameter("url");
            HttpPost httpPost = new HttpPost(BASE_URL + url);
            HttpEntity entity = parseToEntity(request);
            httpPost.setEntity(entity);
            executeMethod(httpPost, response);
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getParameter("url");
        HttpPut httpPut = new HttpPut(BASE_URL + url);
        HttpEntity entity = parseToEntity(request);
        httpPut.setEntity(entity);
        executeMethod(httpPut, response);
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //String uri = parseToUrl(request);
        String url = request.getParameter("url");
        HttpDelete httpDelete = new HttpDelete(BASE_URL + url);
        executeMethod(httpDelete, response);
    }

    private static StringEntity parseToEntity(HttpServletRequest request) throws IOException {
        List<NameValuePair> nameValuePairs = dealParams(request);
        Map<String, Object> result = new HashMap<>();
        for (NameValuePair nameValuePair : nameValuePairs) {
            if (!nameValuePair.getName().contains("url") && !nameValuePair.getName().contains("method") && !nameValuePair.getValue().isEmpty()) {
                if (nameValuePair.getValue().startsWith("[") && nameValuePair.getValue().endsWith("]")) {
                    try {
                        JSONArray jsonArray = new JSONArray(nameValuePair.getValue());
                        result.put(nameValuePair.getName(), jsonArray);
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                } else {
                    result.put(nameValuePair.getName(), nameValuePair.getValue());
                }
            }
        }

        JSONObject jsonObject = new JSONObject(result);
        String content = jsonObject.toString();
        try {
            logger.debug("请求参数:");
            logger.debug(jsonObject.toString(4));
        } catch (Exception e) {
            e.printStackTrace();
        }
        StringEntity stringEntity = new StringEntity(content, "UTF-8");
        stringEntity.setContentType("application/json");
        //HttpEntity httpEntity = new UrlEncodedFormEntity(nameValuePairs);
        return stringEntity;
    }

    private String parseToUrl(HttpServletRequest request) {
        String url = request.getParameter("url");
        StringBuilder stringBuilder = new StringBuilder(BASE_URL + url);
        List<NameValuePair> nameValuePairs = dealParams(request);
        if (nameValuePairs.size() > 0) {
            stringBuilder.append("?");
        }
        for (NameValuePair nameValuePair : nameValuePairs) {
            if (!(nameValuePair.getName().equalsIgnoreCase("url") || nameValuePair.getName().equalsIgnoreCase("method"))) {
                stringBuilder.append(nameValuePair.getName()).append("=").append(nameValuePair.getValue()).append("&");
            }
        }
        String uri = stringBuilder.toString();
        if (uri.endsWith("&")) {
            uri = stringBuilder.deleteCharAt(stringBuilder.length() - 1).toString();
        }
        if(uri.endsWith("?")){
            uri = uri.substring(0,uri.length()-1);
        }
        logger.debug("GET Method URL:" + uri);
        return uri;
    }

    private void executeMethod(HttpUriRequest httpUriRequest, HttpServletResponse response) throws IOException {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            HttpResponse httpResponse = httpClient.execute(httpUriRequest, context);
            logger.debug("返回http状态码:" + httpResponse.getStatusLine().getStatusCode());
            logger.debug("返回结果:");
            String content = EntityUtils.toString(httpResponse.getEntity());
            if (httpResponse.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                //result.put("success", true);
                //result.put("data", EntityUtils.toString(httpResponse.getEntity()));
                logger.debug(content);
                response.getWriter().println(content);
                return;
            } else {
                result.put("success", false);
                result.put("msg", EntityUtils.toString(httpResponse.getEntity()));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        JSONObject jsonObject = new JSONObject(result);
        String content = jsonObject.toString();
        try {
            logger.debug("返回结果:");
            logger.debug(jsonObject.toString(4));
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.setCharacterEncoding("UTF-8");
        response.getWriter().println(content);
        //objectMapper.writeValue(response.getOutputStream(), result);
    }

    private static List<NameValuePair> dealParams(HttpServletRequest request) {
        List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>();
        Enumeration enumeration = request.getParameterNames();
        while (enumeration.hasMoreElements()) {
            String name = enumeration.nextElement().toString();
            String value = request.getParameter(name);
            NameValuePair nameValuePair = new BasicNameValuePair(name, value);
            nameValuePairs.add(nameValuePair);
        }
        return nameValuePairs;
    }
}
