package repetstore.dao;

import repetstore.domain.Order;

import java.util.List;

public interface OrderDAO {
    //通过用户名来返回order列表信息
    List<Order> getOrdersByUsername(String username);
    //通过某个orderId来查找对应的order信息
    Order getOrder(int orderId);
    //将输入的信息添加到order数据库表中
    void insertOrder(Order order);
    //将输入的信息添加到order数据库表中
    void insertOrderStatus(Order order);
}
