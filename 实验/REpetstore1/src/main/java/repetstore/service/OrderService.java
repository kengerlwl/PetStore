package repetstore.service;

import repetstore.dao.*;
import repetstore.dao.implement.*;
import repetstore.domain.CartDb;
import repetstore.domain.LineItem;
import repetstore.domain.Order;
import repetstore.domain.Sequence;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class OrderService {

  private ItemDAO itemDAO;
  private OrderDAO orderDAO;
  private SequenceDAO sequenceDAO;
  private LineItemDAO lineItemDAO;
  private CartDAO cartDAO;

  //在构造函数中初始化实例对象
  public OrderService(){
    itemDAO = new ItemDAOImpl();
    orderDAO = new OrderDAOImpl();
    sequenceDAO = new SequenceDAOImpl();
    lineItemDAO = new LineItemDAOImpl();
    cartDAO = new CartDAOImpl();
  }

  //新增订单
  public Order insertOrder(Order order) {
    //获取序列表sequence中名称为"ordernum"的id序列值
    int orderId=getNextId("ordernum");
    //设置order订单的orderId信息
    order.setOrderId(orderId);
    //设置order订单的总金额
    order.setTotalPrice(cartDAO.getSubTotal(order.getUsername()));
    //获取购物车中商品信息
    List<CartDb> cartDbList=cartDAO.getCartList(order.getUsername());
    List<LineItem> lineItemList=new ArrayList<LineItem>();

    //更新购物车中的商品对应的库存数量
    for (int i = 0; i < cartDbList.size() ; i++) {
      //新增订单order中的lineitems信息，并储存到数据库lineitem表中
      LineItem lineItem = new LineItem();
      lineItem.setOrderId(orderId);
      lineItem.setLineNumber(i);
      lineItem.setItemId(cartDbList.get(i).getItemId());
      lineItem.setQuantity(cartDbList.get(i).getQuantity());
      lineItem.setUnitPrice(cartDbList.get(i).getListPrice());
      lineItem.setTotal(cartDbList.get(i).getTotal());
      lineItem.setName(cartDbList.get(i).getName());
      lineItemList.add(lineItem);
      lineItemDAO.insertLineItem(lineItem);

      //更新购物车中的商品对应的库存数量
      String itemId = cartDbList.get(i).getItemId();
      Integer increment = new Integer(cartDbList.get(i).getQuantity());
      Map<String, Object> param = new HashMap<String, Object>(2);
      param.put("itemId", itemId);
      param.put("increment", increment);
      itemDAO.updateInventoryQuantity(param);
    }
    //将商品信息加入到订单中
    order.setLineItems(lineItemList);

    //执行新增订单和新增订单状态
    orderDAO.insertOrder(order);
    orderDAO.insertOrderStatus(order);
    //清空购物车
    cartDAO.removeCart(order.getUsername());
    //将带有商品信息的订单结果返回
    return order;
  }

  //通过orderId查询此项订单信息
  public Order getOrder(int orderId) {
    //查询订单信息
    Order order = orderDAO.getOrder(orderId);
    //查询订单中的商品信息
    //order.setLineItems(LineItemDAO.getLineItemsByOrderId(orderId));
    order.setLineItems(lineItemDAO.getLineItemByOrderId(orderId));
    return order;
  }

  //查询某一用户的所有订单列表信息
  public List<Order> getOrdersByUsername(String username) {
    //return orderDAO.getOrdersByUsername(username);
    return orderDAO.getOrdersByUsername(username);
  }

  //获取序列表sequence中新的id序列值
  public int getNextId(String name) {
    Sequence sequence = new Sequence(name, -1);
    sequence = sequenceDAO.getSequence(sequence);
    if (sequence == null) {
      throw new RuntimeException("Error: A null sequence was returned from the database (could not get next " + name
          + " sequence).");
    }
    Sequence parameterObject = new Sequence(name, sequence.getNextId() + 1);
    sequenceDAO.updateSequence(parameterObject);
    return sequence.getNextId();
  }
}
