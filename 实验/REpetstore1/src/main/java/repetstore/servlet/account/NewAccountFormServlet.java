package repetstore.servlet.account;

import repetstore.domain.Account;
import repetstore.service.AccountService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "NewAccountFormServlet")
public class NewAccountFormServlet extends HttpServlet {
    private static final String VIEW_NEWACCOUNT = "WEB-INF/jsp/catalog/Main.jsp";
    private static final String VIEW_NEWACCOUNTNOW = "WEB-INF/jsp/account/NewAccountForm.jsp";
    private Account account;
    private String code;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        code = request.getParameter("code");

        HttpSession session = request.getSession();
        if (!code.equalsIgnoreCase(((String) session.getAttribute("code")).toLowerCase())) {
            request.setAttribute("errormsg", "验证码不正确");
            request.getRequestDispatcher(VIEW_NEWACCOUNTNOW).forward(request, response);
        }else {
            AccountService accountService = new AccountService();
            accountService.insertAccount(account);
            request.getRequestDispatcher(VIEW_NEWACCOUNT).forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}