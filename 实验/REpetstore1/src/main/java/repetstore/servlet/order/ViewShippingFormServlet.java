package repetstore.servlet.order;


import repetstore.domain.Account;
import repetstore.domain.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "ViewShippingFormServlet")
public class ViewShippingFormServlet extends HttpServlet {
    private static final String VIEW_SHIPPINGFORM = "/WEB-INF/jsp/order/ShippingForm.jsp";
    private static final String VIEW_CONFIRMFORM = "/WEB-INF/jsp/order/ConfirmOrder.jsp";

    private String cheked;
    private Account account;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Order order;
        HttpSession session = request.getSession();
        order=(Order) session.getAttribute("order");

        order.setCardType(request.getParameter("order.cardType"));
        order.setCreditCard(request.getParameter("order.creditCard"));
        order.setExpiryDate(request.getParameter("order.expiryDate"));

        order.setBillToFirstName(request.getParameter("order.billToFirstName"));
        order.setBillToLastName(request.getParameter("order.billToLastName"));
        order.setBillAddress1(request.getParameter("order.billAddress1"));
        order.setBillAddress2(request.getParameter("order.billAddress2"));
        order.setBillCity(request.getParameter("order.billCity"));
        order.setBillState(request.getParameter("order.billState"));
        order.setBillZip(request.getParameter("order.billZip"));
        order.setBillCountry(request.getParameter("order.billCountry"));

        order.setShipToFirstName(request.getParameter("order.billToFirstName"));
        order.setShipToLastName(request.getParameter("order.billToLastName"));
        order.setShipAddress1(request.getParameter("order.billAddress1"));
        order.setShipAddress2(request.getParameter("order.billAddress2"));
        order.setShipCity(request.getParameter("order.billCity"));
        order.setShipState(request.getParameter("order.billState"));
        order.setShipZip(request.getParameter("order.billZip"));
        order.setShipCountry(request.getParameter("order.billCountry"));



        session.setAttribute("order",order);

        cheked = request.getParameter("shippingAddressRequired");
        if (cheked == null){
            request.getRequestDispatcher(VIEW_CONFIRMFORM).forward(request, response);
        }else {
            request.getRequestDispatcher(VIEW_SHIPPINGFORM).forward(request, response);
        }
    }
}