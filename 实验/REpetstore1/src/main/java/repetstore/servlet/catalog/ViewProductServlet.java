package repetstore.servlet.catalog;

import repetstore.domain.Item;
import repetstore.domain.Product;
import repetstore.service.CatalogService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ViewProductServlet")
public class ViewProductServlet extends HttpServlet {
    private static final String VIEW_PRODUCT = "/WEB-INF/jsp/catalog/Product.jsp";
    private String productId;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        productId = request.getParameter("productId");
        CatalogService service = new CatalogService();
        //通过自己的ID来查找自己的信息
        Product product = service.getProduct(productId);
        //通过一个产品的种类来返回对应种类的个体列表
        List<Item> itemList = service.getItemListByProduct(productId);

        //将两个变量值传入到session中
        HttpSession session = request.getSession();
        session.setAttribute("product",product);
        session.setAttribute("itemList",itemList);

        request.getRequestDispatcher(VIEW_PRODUCT).forward(request,response);
    }
}
