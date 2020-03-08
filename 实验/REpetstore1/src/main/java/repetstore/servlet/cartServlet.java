package repetstore.servlet;

import repetstore.domain.Account;
import repetstore.domain.CartDb;
import repetstore.service.CartService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
public class cartServlet extends HttpServlet
{
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String a = request.getParameter("name");
        String b = request.getParameter("num");
        HttpSession session = request.getSession();
        CartService cartService = new CartService();
        String userId = ((Account)session.getAttribute("account")).getUsername();
        List<CartDb> cartList = cartService.getCartList(userId);
        CartService temp = new CartService();
        for (int i =0; i < cartList.size(); i++)
        {
            CartDb c = cartList.get(i);
            if (c.getItemId().equals(a))
            {
                c.setQuantity(Integer.parseInt(b));
                if(c.getQuantity()==0)
                {
                    temp.deleteCart(userId, a);
                    break;
                }
                temp.updateCart(userId, a, Integer.parseInt(b));
                System.out.println(c.getItemId() +"       " + c.getQuantity());
                break;
            }
        }
        Integer cartListSize=cartList.size();
        session.setAttribute("cartList",cartList);
        session.setAttribute("cartListSize",cartListSize);
        String res="adf,asdfasdf,asdf,sdf,,dsf,as,df,sad,f,asdf";
        //返回结果
        response.getWriter().write(res);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}