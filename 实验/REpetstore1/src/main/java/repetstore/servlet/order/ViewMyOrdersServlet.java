package repetstore.servlet.order;

import repetstore.domain.Order;
import repetstore.service.OrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "ViewMyOrdersServlet")
public class ViewMyOrdersServlet extends HttpServlet {
    private static final String VIEW_ORDER = "/WEB-INF/jsp/order/ViewOrder.jsp";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //此servlet执行在My Account菜单下执行My Orders按钮功能后，点击某一订单编号后查看订单信息

        //接受订单编号
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        //根据订单编号获取订单信息
        OrderService orderService =new OrderService();
        Order order= orderService.getOrder(orderId);

        //将订单信息存储到session中
        HttpSession session = request.getSession();
        session.setAttribute("order", order);

        request.getRequestDispatcher(VIEW_ORDER).forward(request, response);
    }
}
