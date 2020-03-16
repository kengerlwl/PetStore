package demo.aop.aspectj;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class DemoAspectj {
    //控制哪些要切
    @Before(value = "execution(* demo.aop.persisitence.*.*(..))")
    public void before(){
        System.out.println("before advoce");
    }

}
