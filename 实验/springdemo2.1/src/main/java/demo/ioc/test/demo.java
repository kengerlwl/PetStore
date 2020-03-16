package demo.ioc.test;

import demo.ioc.domain.Account;
import demo.ioc.persisitence.AcountDao;
import demo.ioc.persisitence.AcountDaoImpl;
import demo.ioc.service.AccountService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class demo {
    @Autowired
    private AccountService accountService;
    @Test
    public void test(){
        //AcountDao acountDao = new AcountDaoImpl();


        //使用ioc容器获取对象
//        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//        AcountDao acountDao = (AcountDao) context.getBean("accountDao");
//
//        Account account = (Account) context.getBean("account") ;
//        System.out.println(account.getUsername());
//        acountDao.insert();
//
//
        accountService.login();
    }

}
