package repetstore.servlet.catalog;

        import repetstore.domain.Category;
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

@WebServlet(name = "ViewCategoryServlet")
public class ViewCategoryServlet extends HttpServlet {
    private static final String VIEW_CATEGORY = "WEB-INF/jsp/catalog/Category.jsp";

    private String categoryId;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        categoryId = request.getParameter("categoryId");
        //实例化service，这样可以调用相关的方法
        CatalogService service = new CatalogService(); //注：实例化的语句调试直接跳过
        Category category = service.getCategory(categoryId);
        List<Product> productList = service.getProductListByCategory(categoryId);

        HttpSession session = request.getSession();
        session.setAttribute("category",category);
        session.setAttribute("productList",productList);

        request.getRequestDispatcher(VIEW_CATEGORY).forward(request,response);
    }
}