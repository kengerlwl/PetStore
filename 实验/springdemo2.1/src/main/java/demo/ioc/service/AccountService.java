package demo.ioc.service;

import demo.ioc.persisitence.AcountDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


@Service("accountService")
public class AccountService {
    @Autowired
    //@Resource(name="accountDao")
    private AcountDao acountDao;

    public AcountDao getAcountDao() {
        return acountDao;
    }

    public void setAcountDao(AcountDao acountDao) {
        this.acountDao = acountDao;
    }

    public void login(){
        System.out.println("service login");
        acountDao.insert();

    }

}
