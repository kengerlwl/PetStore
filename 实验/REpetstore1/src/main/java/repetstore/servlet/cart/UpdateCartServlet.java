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
import java.util.List;

@WebServlet(name = "UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {
    private static final String VIEW_CART = "/WEB-INF/jsp/cart/Cart.jsp";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CartService cartService=new CartService();
        HttpSession session = request.getSession();
        String userId = ((Account)session.getAttribute("account")).getUsername();

        //从session值为cartList中获取购物车信息，此时"cartList"中购物车的数量不是最新的，但商品行数没变化
        List<CartDb> cartDbList = (List<CartDb>)session.getAttribute("cartList");

        for (int i=0;i<cartDbList.size();i++)
        {
            int quantity= Integer.parseInt(request.getParameter(cartDbList.get(i).getItemId()));
            cartService.updateCart(userId,cartDbList.get(i).getItemId(),quantity);
        }
        List<CartDb> cartListNew = cartService.getCartList(userId);
        Integer cartListSize=cartListNew.size();

        //将结果存到session中，cartList存放购物车数据集，cartListSize存放购物车总行数

        session.setAttribute("cartList",cartListNew);
        session.setAttribute("cartListSize",cartListSize);

        request.getRequestDispatcher(VIEW_CART).forward(request,response);

    }
}
