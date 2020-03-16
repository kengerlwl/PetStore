package demo.aop.test;

import org.junit.Test;
import demo.aop.persisitence.AcountDaoImpl;
import demo.aop.persisitence.AcountDao;
import demo.aop.proxy.proxyDemo;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.lang.reflect.Proxy;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:aop.xml")
public class Demo {

    @Autowired
//    @Resource(name = "demoAfter")
    private AcountDao accountDao;

    @Test
    public void test(){
        accountDao.insert();
//        AcountDao accountDao = new AcountDaoImpl();
//        Class class1 = accountDao.getClass();
//        accountDao = (AcountDao)Proxy.newProxyInstance(class1.getClassLoader(), class1.getInterfaces(),new proxyDemo(accountDao));
//        accountDao.insert();
    }

}
