package brms.action;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.output.StringBuilderWriter;
import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.CookieStore;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.*;
import org.apache.http.client.protocol.HttpClientContext;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.EntityUtils;
import org.codehaus.jackson.JsonEncoding;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.map.ObjectMapper;
import sun.org.mozilla.javascript.internal.json.JsonParser;

/**
 * Servlet implementation class Proxy
 */
public class Proxy extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String BASE_URL = "http://42.62.52.40:8000/";
    private static HttpClient httpClient = HttpClientBuilder.create().build();
    private static HttpContext context = new BasicHttpContext();
    private static CookieStore cookieStore = new BasicCookieStore();
    private JsonGenerator jsonGenerator = null;
    private ObjectMapper objectMapper = null;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Proxy() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    public void init() throws ServletException {
        objectMapper = new ObjectMapper();
        try {
            jsonGenerator = objectMapper.getJsonFactory().createJsonGenerator(System.out, JsonEncoding.UTF8);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        String url = request.getParameter("url");
        HttpGet httpGet = new HttpGet(BASE_URL + url);
        executeMethod(httpGet, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String method = request.getParameter("method");
        if (method.equalsIgnoreCase("get")) {
            doGet(request, response);
        } else if (method.equalsIgnoreCase("put")) {
            doPut(request, response);
        } else if (method.equalsIgnoreCase("delete")) {
            doDelete(request, response);
        }else {
            String url = request.getParameter("url");
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
        HttpDelete httpDelete = new HttpDelete(BASE_URL+url);
        executeMethod(httpDelete, response);
    }

    private StringEntity parseToEntity(HttpServletRequest request) throws IOException {
        List<NameValuePair> nameValuePairs = dealParams(request);
        Map<String,Object> result = new HashMap<>();
        for(NameValuePair nameValuePair:nameValuePairs){
            if(!nameValuePair.getName().contains("url")&&!nameValuePair.getName().contains("method")&&!nameValuePair.getValue().isEmpty()) {
                if (nameValuePair.getName().indexOf("_ids") > 0) {
                    String[] idList = nameValuePair.getValue().split(",");
                    List<Integer> list = new ArrayList();
                    for (int i = 0; i < idList.length; i++) {
                        list.add(Integer.parseInt(idList[i]));
                    }
                    result.put(nameValuePair.getName(), list);
                } else {
                    result.put(nameValuePair.getName(), nameValuePair.getValue());
                }
            }
        }
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        objectMapper.writeValue(byteArrayOutputStream,result);
        String results = byteArrayOutputStream.toString("UTF-8");
        StringEntity stringEntity = new StringEntity(results,"UTF-8");
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
            stringBuilder.append(nameValuePair.getName()).append("=").append(nameValuePair.getValue()).append("&");
        }
        if (nameValuePairs.size() > 0) {
            stringBuilder.deleteCharAt(stringBuilder.length() - 1);
        }
        String uri = stringBuilder.toString();
        System.out.println(uri);
        return uri;
    }

    private void executeMethod(HttpUriRequest httpUriRequest, HttpServletResponse response) throws IOException {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            CloseableHttpResponse httpResponse = (CloseableHttpResponse) httpClient.execute(httpUriRequest, context);
            if (httpResponse.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                result.put("success", true);
                result.put("data", EntityUtils.toString(httpResponse.getEntity()));
            } else {
                result.put("success", false);
                result.put("msg", "请求失败，请稍候再试!");
            }
           httpResponse.close();
        }catch (IOException e) {
            e.printStackTrace();
        }

        objectMapper.writeValue(response.getOutputStream(), result);
    }

    private List<NameValuePair> dealParams(HttpServletRequest request) {
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
