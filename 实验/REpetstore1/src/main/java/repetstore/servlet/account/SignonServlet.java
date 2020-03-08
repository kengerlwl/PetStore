package repetstore.servlet.account;

import repetstore.domain.Account;
import repetstore.service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
//对应的servlet名字
@WebServlet(name = "SignonServlet")
public class SignonServlet extends HttpServlet {
    private static final String SIGNON_SERVLET = "WEB-INF/jsp/catalog/Main.jsp";
    private static final String VIEW_SIGNON = "WEB-INF/jsp/account/SignonForm.jsp";

    private String username;
    private String password;
    private String code;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //从前端界面获取参数
        //注:这句的意思是从request中拿出名字叫userName的值，赋给了你刚才定义的变量。
        //request是负责页面之间传递参数和数据的类，是java封装好的，
        //只要把它当成一个工具就可以了，就好比用遥控器控制电视，并不需要详细了解遥控器的工作原理
        username = request.getParameter("username");
        password = request.getParameter("password");
        code = request.getParameter("code");

        HttpSession session = request.getSession();
        if (!code.equalsIgnoreCase(((String) session.getAttribute("code")).toLowerCase())) {
            request.setAttribute("errormsg", "验证码不正确");
            request.getRequestDispatcher(VIEW_SIGNON).forward(request, response);
        }else {
            //这里首先实例化AccountService，然后调用方法getAccount，获取两个变量值
            //最后将account传入到Account account中的account
            AccountService accountService = new AccountService();
            Account account = accountService.getAccount(username,password);
            //将结果存入session中(存入都是set)
            session.setAttribute("account",account);
            //4.跳转到前端main.jsp页面
            request.getRequestDispatcher(SIGNON_SERVLET).forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
