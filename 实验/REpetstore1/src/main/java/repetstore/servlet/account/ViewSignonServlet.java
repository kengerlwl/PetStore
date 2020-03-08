package repetstore.servlet.account;

import javax.jws.WebService;
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

@WebServlet(name = "ViewSignonServlet")
public class ViewSignonServlet extends HttpServlet {
    private static final String VIEW_SIGNON = "/WEB-INF/jsp/account/SignonForm.jsp";
    private static final List<String> LANGUAGE_LIST;
    private static final List<String> CATEGORY_LIST ;

    static {
        List<String> langList = new ArrayList<String>();
        langList.add("english");
        langList.add("japanese");
        //返回一个不可变的list
        LANGUAGE_LIST = Collections.unmodifiableList(langList);

        List<String> catList = new ArrayList<String>();
        catList.add("FISH");
        catList.add("DOGS");
        catList.add("REPTILES");
        catList.add("CATS");
        catList.add("BIRDS");
        CATEGORY_LIST = Collections.unmodifiableList(catList);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        session.setAttribute("LANGUAGE_LIST",LANGUAGE_LIST);
        session.setAttribute("CATEGORY_LIST",CATEGORY_LIST);
        request.getRequestDispatcher(VIEW_SIGNON).forward(request,response);
    }
}

