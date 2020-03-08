package repetstore.servlet;

import repetstore.domain.Product;
import repetstore.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class testServlet extends HttpServlet
{
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        //获取搜索框输入的内容
        CatalogService c = new CatalogService();
        String name=request.getParameter("name");

        List<Product> p = c.searchProductList("%"+name+"%");
        String and = "";
        for (Product t : p)
        {
            and += t.getName() + ",";
        }
        //向server层调用相应的业务
        //返回结果
        response.getWriter().write(and);

    }


    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);

    }
}