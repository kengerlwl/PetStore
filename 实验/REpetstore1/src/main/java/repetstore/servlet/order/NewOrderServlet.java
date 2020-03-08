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

@WebServlet(name = "NewOrderServlet")
public class NewOrderServlet extends HttpServlet {
    private static final String VIEW_ORDER = "/WEB-INF/jsp/order/ViewOrder.jsp";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.定义Order对象
        Order order = new Order();
        //2.把session("Order")中的值取出来，赋值给Order对象
        HttpSession session = request.getSession();
        order=(Order) session.getAttribute("order");
        //3.调用OrderService层insertOrder(Order order)方法，存储订单order对象信息到数据库中
        OrderService orderService=new OrderService();
        order=orderService.insertOrder(order);

        //重新更新order订单的session，此时返回的session中包含订单的商品明细信息，保存在订单order中的lineItems属性中
        session.setAttribute("order",order);
        //清空购物车
        session.setAttribute("cart",null);
        //4.进行页面跳转，显示已经生成的订单信息，通过session显示
        request.getRequestDispatcher(VIEW_ORDER).forward(request, response);
    }
}
