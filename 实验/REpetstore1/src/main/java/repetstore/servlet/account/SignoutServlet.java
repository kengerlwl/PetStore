package repetstore.servlet.account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "SignoutServlet")
public class SignoutServlet extends HttpServlet {
    private static final String SIGNOUT_SERVLET= "/WEB-INF/jsp/catalog/Main.jsp";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //清除掉登录信息的session
        HttpSession session = request.getSession();
        session.removeAttribute("account");

        request.getRequestDispatcher(SIGNOUT_SERVLET).forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
