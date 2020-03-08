package repetstore.servlet.order;


import repetstore.domain.Account;
import repetstore.domain.Order;
import repetstore.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ViewListOrderServlet")
public class ViewListOrderServlet extends HttpServlet {
    private static final String VIEW_LISTORDER = "/WEB-INF/jsp/order/ListOrders.jsp";
    private String username;
    private OrderService orderService;
    private List<Order> orderList = new ArrayList<Order>();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        username = request.getParameter("username");
        orderService = new OrderService();
        orderList = orderService.getOrdersByUsername(username);

        HttpSession session = request.getSession();
        session.setAttribute("orderList", orderList);

        //HttpSession session = request.getSession();
        Account account = (Account)session.getAttribute("account");

        request.getRequestDispatcher(VIEW_LISTORDER).forward(request, response);
    }
}
