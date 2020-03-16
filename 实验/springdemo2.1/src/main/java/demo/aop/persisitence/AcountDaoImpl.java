package demo.aop.persisitence;

import org.springframework.stereotype.Repository;

@Repository
public class AcountDaoImpl  implements AcountDao {
    @Override
    public void insert() {
        System.out.println("insert");
    }
}