package repetstore.servlet.catalog;

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

@WebServlet(name = "ViewSearchProductServlet")
public class ViewSearchProductServlet extends HttpServlet {
    private static final String VIEW_SEARCHPRODUCT = "/WEB-INF/jsp/catalog/SearchProducts.jsp";
    private String SearchProduct;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SearchProduct = request.getParameter("keyword");


        CatalogService service = new CatalogService();
        List<Product> productList = service.searchProductList("%"+SearchProduct+"%");

        HttpSession session = request.getSession();
        session.setAttribute("productList",productList);

        request.getRequestDispatcher(VIEW_SEARCHPRODUCT).forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
