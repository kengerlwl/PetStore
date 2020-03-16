package demo.aop.proxy;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;

public class proxyDemo implements InvocationHandler {

    private Object object;

    public proxyDemo(Object objectl) {
        this.object = objectl;
    }

    @Override
    public Object invoke(Object o, Method method, Object[] objects) throws Throwable {
        if (method.getName() == "insert") {
            beforeAdivice();

        }


    Object proxyObject = method.invoke(object, objects);
        return proxyObject;

}


    public void beforeAdivice(){
        System.out.println("before advice");
    }

}
