package repetstore.servlet.order;


import repetstore.domain.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "ViewConfirmOrderServlet")
public class ViewConfirmOrderServlet extends HttpServlet {
    private static final String VIEW_CONFIRMFORM = "/WEB-INF/jsp/order/ConfirmOrder.jsp";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Order order = new Order();
        HttpSession session = request.getSession();

        //将session("order")赋值给order对象
        order=(Order) session.getAttribute("order");

        //从前端ShippingForm.jsp中获取相关改变的ship值，赋值给order
        order.setShipToFirstName(request.getParameter("order.shipToFirstName"));
        order.setShipToLastName(request.getParameter("order.shipToLastName"));
        order.setShipAddress1(request.getParameter("order.shipAddress1"));
        order.setShipAddress2(request.getParameter("order.shipAddress2"));
        order.setShipCity(request.getParameter("order.shipCity"));
        order.setShipState(request.getParameter("order.shipState"));
        order.setShipZip(request.getParameter("order.shipZip"));
        order.setShipCountry(request.getParameter("order.shipCountry"));

        //把order对象中的新数据更新到session("order")
        session.setAttribute("order",order);

        request.getRequestDispatcher(VIEW_CONFIRMFORM).forward(request, response);

    }
}
