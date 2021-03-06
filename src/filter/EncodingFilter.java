// 编译时包含tomcat的 servlet-api.jar  
// javac -cp /usr/share/tomcat7/lib/servlet-api.jar ./filter/EncodingFilter.java

package filter;  
  
import java.io.IOException;  
import java.util.Enumeration;  
import java.util.HashMap;  
  
import javax.servlet.Filter;  
import javax.servlet.FilterChain;  
import javax.servlet.FilterConfig;  
import javax.servlet.ServletException;  
import javax.servlet.ServletRequest;  
import javax.servlet.ServletResponse;  
  
public class EncodingFilter implements Filter {    
    private String encoding;    
    private HashMap<String,String> params = new HashMap<String,String>();    
    // 项目结束时就已经进行销毁    
    public void destroy() {    
        System.out.println("end do the encoding filter!");    
        params=null;    
        encoding=null;    
    }

    public void doFilter(ServletRequest req, ServletResponse resp,FilterChain chain) throws IOException, ServletException {    
        System.out.println("before encoding " + encoding + " filter！");    
        req.setCharacterEncoding(encoding);    
        chain.doFilter(req, resp);          
        System.out.println("after encoding " + encoding + " filter！");    
    }    
     
    // 项目启动时就已经进行读取    
    public void init(FilterConfig config) throws ServletException {    
        System.out.println("begin do the encoding filter!");    
        encoding = config.getInitParameter("encoding");    
        int i = 0;
        for (Enumeration<?> e = config.getInitParameterNames(); e.hasMoreElements();) {    
            String name = (String) e.nextElement();    
            String value = config.getInitParameter(name);
            System.out.println(i + ":" + name + ":" + value);    
            i++;
            params.put(name, value);    
        }    
    }    
 } 