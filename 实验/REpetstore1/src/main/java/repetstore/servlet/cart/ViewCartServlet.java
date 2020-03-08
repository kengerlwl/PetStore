package repetstore.servlet.cart;

import repetstore.domain.Account;
import repetstore.domain.CartDb;
import repetstore.service.CartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ViewCartServlet")
public class ViewCartServlet extends HttpServlet {
    private static final String VIEW_CART = "/WEB-INF/jsp/cart/Cart.jsp";
    private static final String SignonForm = "/WEB-INF/jsp/account/SignonForm.jsp";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        CartService cartService = new CartService();
        //判断是否登录，只有登录后才能查看购物车
        if(session.getAttribute("account")==null){
            //没有登录，返回主页面
            request.getRequestDispatcher(SignonForm).forward(request,response);
        }else {
            //已经登录，可以查看购物车
            String userId = ((Account)session.getAttribute("account")).getUsername();
            List<CartDb> cartList = cartService.getCartList(userId);
            Integer cartListSize=cartList.size();
            //将结果存到session中，cartList存放购物车数据集，cartListSize存放购物车总行数
            session.setAttribute("cartList",cartList);
            session.setAttribute("cartListSize",cartListSize);

            request.getRequestDispatcher(VIEW_CART).forward(request,response);
        }
    }
}
