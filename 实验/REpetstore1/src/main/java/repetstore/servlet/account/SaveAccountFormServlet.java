package repetstore.servlet.account;

import repetstore.domain.Account;
import repetstore.service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SaveAccountFormServlet")
public class SaveAccountFormServlet extends HttpServlet {
    private static final String VIEW_NEWACCOUNT = "/WEB-INF/jsp/catalog/Main.jsp";
    private static Account account;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.从上一个EditAccountForm.jsp前端页面获取参数
        account = new Account();
        account.setUsername(request.getParameter("username"));
        account.setPassword(request.getParameter("password"));
        account.setFirstName(request.getParameter("account.firstName"));
        account.setLastName(request.getParameter("account.lastName"));
        account.setEmail(request.getParameter("account.email"));
        account.setPhone(request.getParameter("account.phone"));
        account.setAddress1(request.getParameter("account.address1"));
        account.setAddress2(request.getParameter("account.address2"));
        account.setCity(request.getParameter("account.city"));
        account.setState(request.getParameter("account.state"));
        account.setZip(request.getParameter("account.zip"));
        account.setCountry(request.getParameter("account.country"));

        account.setLanguagePreference(request.getParameter("account.languagePreference"));
        account.setFavouriteCategoryId(request.getParameter("account.favouriteCategoryId"));

        account.setListOption(Boolean.valueOf(request.getParameter("account.listOption")));
        account.setBannerOption(Boolean.valueOf(request.getParameter("account.bannerOption")));

        //2.调用Service方法
        AccountService accountService = new AccountService();
        accountService.updateAccount(account);

        //3.跳转到前端main.jsp页面
        request.getRequestDispatcher(VIEW_NEWACCOUNT).forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
