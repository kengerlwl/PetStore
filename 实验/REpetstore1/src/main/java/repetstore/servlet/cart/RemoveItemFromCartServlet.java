package repetstore.servlet.cart;


import repetstore.domain.Account;
import repetstore.domain.Cart;
import repetstore.domain.CartDb;
import repetstore.service.CartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "RemoveItemFromCartServlet")
public class RemoveItemFromCartServlet extends HttpServlet {
    private static final String VIEW_CART = "/WEB-INF/jsp/cart/Cart.jsp";
    private static final String ERROR = "/WEB-INF/jsp/common/Error.jsp";
    private String workingItemId;
    private Cart cart;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        workingItemId = request.getParameter("workingItemId");
        CartService cartService = new CartService();
        HttpSession session = request.getSession();
        String userId = ((Account)session.getAttribute("account")).getUsername();
        //删除购物车中当前行
        cartService.deleteCart(userId,workingItemId);
        //查询最新的购物车信息
        List<CartDb> cartList = cartService.getCartList(userId);
        Integer cartListSize=cartList.size();

        //将结果存到session中，cartList存放购物车数据集，cartListSize存放购物车总行数
        session.setAttribute("cartList",cartList);
        session.setAttribute("cartListSize",cartListSize);

        request.getRequestDispatcher(VIEW_CART).forward(request,response);

    }
}
