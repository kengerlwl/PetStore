package repetstore.dao;

import repetstore.domain.CartDb;
import repetstore.domain.Item;

import java.math.BigDecimal;
import java.util.Iterator;
import java.util.List;

public interface CartDAO
{
    //将item添加到数据库cart中
    void addCart(CartDb cartDb);
    //清空购物车
    void removeCart(String userId);
    //将item从数据库cart中移出
    void removeCartByItemId(String userId,String itemId);
    //增加item的数量
    void incrementQuantityByItemId(String userId,String itemId);
    //计算某一item的总金额
    BigDecimal getSubTotal(String userId);
    //判断某item是否在购物车中
    boolean containsItemId(String userId,String itemId);
    //查询购物车的所有信息
    List<CartDb> getCartList(String userId);
    //更新数据库中cart数据
    void  updateCart(String userId,String itemId,int quantity);
}
