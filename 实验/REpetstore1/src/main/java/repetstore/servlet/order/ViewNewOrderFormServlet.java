package repetstore.servlet.order;


import repetstore.domain.Account;
import repetstore.domain.CartDb;
import repetstore.domain.Order;

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

@WebServlet(name = "ViewNewOrderFormServlet")
public class ViewNewOrderFormServlet extends HttpServlet {
    private static final String VIEW_NEWORDER_RFORM = "/WEB-INF/jsp/order/NewOrderForm.jsp";
    private static List<String> CARD_TYPE_LIST = null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        Order order=new Order();
        Account account= (Account) session.getAttribute("account");
        CartDb cart = (CartDb) session.getAttribute("cart");

        order.initOrder(account);
        //order对象中的数据存储到session("order")中
        session.setAttribute("order",order);

        List<String> cardList = new ArrayList<String>();
        cardList.add("Visa");
        cardList.add("MasterCard");
        cardList.add("American Express");
        CARD_TYPE_LIST = Collections.unmodifiableList(cardList);

        session.setAttribute("cardtype",CARD_TYPE_LIST);

        request.getRequestDispatcher(VIEW_NEWORDER_RFORM).forward(request,response);
    }
}
