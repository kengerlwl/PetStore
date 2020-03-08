package repetstore.service;

import repetstore.dao.AccountDAO;
import repetstore.dao.implement.AccountDAOImpl;
import repetstore.domain.Account;

public class AccountService {
    //定义数据库类型的变量，因为下面的方法会调用数据库层的方法，用于完成后端逻辑
    private AccountDAO accountDAO;
    //构造函数初始化
    public AccountService()
    {
        accountDAO = new AccountDAOImpl();
    }

    //通过username返回account的全部信息
    public Account getAccount(String username){
        return accountDAO.getAccountByUsername(username);
    }

    //通过账号和密码返回account的全部信息
    public Account getAccount(String username,String password){
        Account account = new Account();
        account.setUsername(username);
        account.setPassword(password);
        return accountDAO.getAccountByUsernameAndPassword(account);
    }

    //注册时对个人基本信息的填写
    public void insertAccount(Account account)
    {
        accountDAO.insertSignon(account);
        accountDAO.insertAccount(account);
        accountDAO.insertProfile(account);
    }

    //登录后对个人用户信息的保存修改
    public void updateAccount(Account account)
    {
        if (account.getPassword() != null && account.getPassword().length() > 0) {
            accountDAO.updateSignon(account);
        }
        accountDAO.updateAccount(account);
        accountDAO.updateProfile(account);
    }
}
