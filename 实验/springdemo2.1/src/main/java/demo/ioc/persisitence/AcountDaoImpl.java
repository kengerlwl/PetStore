package demo.ioc.persisitence;

import org.springframework.stereotype.Repository;

@Repository("accountDao")
public class AcountDaoImpl  implements AcountDao{
    @Override
    public void insert() {
        System.out.println("insert");
    }
}