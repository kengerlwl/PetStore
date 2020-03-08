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

@WebServlet(name = "EditAccountFormServlet")
public class EditAccountFormServlet extends HttpServlet {
    private static final String EDIT_ACCOUNT = "/WEB-INF/jsp/account/EditAccountForm.jsp";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //下面为新增加部分，修改用户信息后，需要重新更新account的session中的值

        HttpSession session = request.getSession();
        //获取account的session值
        Account account_old=(Account) session.getAttribute("account");
        //这里首先实例化AccountService，然后调用方法getAccount，重新从数据库中查询account
        //最后将account传入到Account account中的account
        AccountService accountService = new AccountService();
        Account account = accountService.getAccount(account_old.getUsername());
        //将结果存入session中(存入都是set)
        session.setAttribute("account",account);
        request.getRequestDispatcher(EDIT_ACCOUNT).forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
