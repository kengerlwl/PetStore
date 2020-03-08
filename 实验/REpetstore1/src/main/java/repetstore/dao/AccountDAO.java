package repetstore.dao;

import repetstore.domain.Account;

public interface AccountDAO
{
    //插入这三条信息，用于注册时的操作
    //用于写入并保存User Information
    void insertSignon(Account account);
    //用于写入并保存Account Information
    void insertAccount(Account account);
    //用于写入并保存Profile Information
    void insertProfile(Account account);


    //更新这三条信息，用于登录后对修改后的信息的保存
    //用于更新并保存User Information
    void updateSignon(Account account);
    //用于更新并保存Account Information
    void updateAccount(Account account);
    //用于更新并保存Profile Information
    void updateProfile(Account account);

    //通过username来匹配，返回account列表
    Account getAccountByUsername(String username);

    //通过username和password(登录时用)来匹配，返回account列表
    //注：因为要返回account列表，所以方法名的返回值是account
    Account getAccountByUsernameAndPassword(Account account);
}
