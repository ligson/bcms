package brms.action;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.util.JSONPObject;
import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.CookieStore;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.HttpContext;
import org.apache.http.util.EntityUtils;
import org.codehaus.jackson.JsonEncoding;
import org.codehaus.jackson.JsonFactory;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.map.ObjectMapper;
import sun.org.mozilla.javascript.internal.json.JsonParser;
import sun.plugin.javascript.navig.JSObjectFactory;

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
        doPost(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        String url = request.getParameter("url");
        Map<String, Object> result = new HashMap<String, Object>();
        HttpPost httpPost = new HttpPost(BASE_URL + url);
        List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>();
        Enumeration enumeration = request.getParameterNames();
        while (enumeration.hasMoreElements()) {
            String name = enumeration.nextElement().toString();
            String value = request.getParameter(name);
            NameValuePair nameValuePair = new BasicNameValuePair(name, value);
            nameValuePairs.add(nameValuePair);
        }
        HttpEntity httpEntity = new UrlEncodedFormEntity(nameValuePairs);
        httpPost.setEntity(httpEntity);
        CloseableHttpResponse httpResponse = (CloseableHttpResponse) httpClient.execute(httpPost, context);

        if (httpResponse.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
            result.put("success", true);
            result.put("data", EntityUtils.toString(httpResponse.getEntity()));
        } else {
            result.put("success", false);
            result.put("msg", "请求失败，请稍候再试!");
        }
        objectMapper.writeValue(response.getOutputStream(), result);
    }


}
