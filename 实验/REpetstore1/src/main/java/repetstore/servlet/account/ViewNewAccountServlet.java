package repetstore.servlet.account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@WebServlet(name = "ViewNewAccountServlet")
public class ViewNewAccountServlet extends HttpServlet {
    //注：ViewNewAccountServlet是用于配合前端的注册页面的
    private static final String VIEW_NEWACCOUNT = "WEB-INF/jsp/account/NewAccountForm.jsp";



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



        request.getRequestDispatcher(VIEW_NEWACCOUNT).forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
