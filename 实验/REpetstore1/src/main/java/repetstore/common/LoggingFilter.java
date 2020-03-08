package repetstore.common;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebFilter(filterName = "LoggingFilter",urlPatterns = { "/*"},initParams = {@WebInitParam(name = "logFileName",value = "log.txt"),@WebInitParam(name = "prefix",value = "URI: ")  })
public class LoggingFilter implements Filter {
    private PrintWriter logger;
    private String prefix;

    public void init(FilterConfig config) throws ServletException {
        prefix = config.getInitParameter("prefix");
        String logFileName = config.getInitParameter("logFileName");
        String appPath = config.getServletContext().getRealPath("/");

        System.out.println("logFileName" + logFileName);
        try {
            logger = new PrintWriter(new File(appPath,logFileName));
        }catch (FileNotFoundException e){
            e.printStackTrace();
            throw new ServletException(e.getMessage());
        }
    }

    public void destroy() {
        System.out.println("destroying filter");
        if (logger != null){
            logger.close();
        }
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        System.out.println("LoggingFilter.doFilter");

        HttpServletRequest httpServletRequest = (HttpServletRequest) req;
        logger.println(new Date() + " " + prefix + httpServletRequest.getRequestURI());
        logger.flush();
        chain.doFilter(req, resp);
    }
}
