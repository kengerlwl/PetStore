package repetstore.servlet.cart;

import repetstore.domain.Account;
import repetstore.domain.CartDb;
import repetstore.service.CartService;
import repetstore.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AddItemToCartServlet")
public class AddItemToCartServlet extends HttpServlet {
    //处理完请求后的跳转页面
    private static final String VIEW_CART = "/WEB-INF/jsp/cart/Cart.jsp";
    private static final String SignonForm = "/WEB-INF/jsp/account/SignonForm.jsp";

    //定义处理该请求所需要的数据
    private String workingItemId;
    private CartDb cartList;
    //是否需要业务逻辑层
    private CatalogService catalogService;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        workingItemId = request.getParameter("workingItemId");
        HttpSession session = request.getSession();
        if(session.getAttribute("account")==null){
            //没有登录，返回主页面
            request.getRequestDispatcher(SignonForm).forward(request,response);
        }else {
            //已经登录，可以加入购物车
            String userId = ((Account) session.getAttribute("account")).getUsername();
            CartService cartService = new CartService();
            cartService.addCart(userId, workingItemId);

            //查询最新的购物车信息
            List<CartDb> cartList = cartService.getCartList(userId);
            Integer cartListSize = cartList.size();

            //将结果存到session中，cartList存放购物车数据集，cartListSize存放购物车总行数
            session.setAttribute("cartList", cartList);
            session.setAttribute("cartListSize", cartListSize);

            request.getRequestDispatcher(VIEW_CART).forward(request, response);
        }
    }
}
