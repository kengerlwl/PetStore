package repetstore.service;

import repetstore.dao.CartDAO;
import repetstore.dao.implement.CartDAOImpl;
import repetstore.domain.CartDb;
import repetstore.domain.Item;

import javax.servlet.http.HttpSession;
import java.util.List;

public class CartService {
    private CartDAO cartDAO;

    public CartService() {
        cartDAO = new CartDAOImpl();
    }

    //查询购物车
    public List<CartDb> getCartList(String userId)
    {
        return cartDAO.getCartList(userId);
    }

    //删除购物车
    public void deleteCart(String userId,String itemId)
    {
        cartDAO.removeCartByItemId(userId,itemId);

    }

    //向购物车中增加商品
    public void addCart(String userId,String itemId)
    {
        //如果购物车中有要加入的商品，则数量增加1
        if(cartDAO.containsItemId(userId,itemId))
        {
            cartDAO.incrementQuantityByItemId(userId,itemId);
        }else {
            //如果购物车中没有要加入的商品，则在购物车中新增商品信息
            // 加入前首先要判断是否有库存
            CatalogService catalogService = new CatalogService();
            boolean isInStock = catalogService.isItemInStock(itemId);
            //根据itemId获取商品信息，并加入到cartDb
            Item item = catalogService.getItem(itemId);
            CartDb cartDb=new CartDb();
            cartDb.setUserId(userId);
            cartDb.setItemId(itemId);
            cartDb.setProductId(item.getProductId());
            cartDb.setName(item.getName());
            cartDb.setInStock(isInStock);
            cartDb.setQuantity(1);
            cartDb.setListPrice(item.getListPrice());
            cartDb.setTotal(item.getListPrice());

            //加入购物车
            cartDAO.addCart(cartDb);
        }
    }

    //更新购物车
    public void  updateCart(String userId,String itemId,int quantity)
    {
        cartDAO.updateCart(userId,itemId,quantity);
    }


    public void addItem(String userId,String itemId, int Q)
    {
        //如果购物车中有要加入的商品，则数量增加1

            //如果购物车中没有要加入的商品，则在购物车中新增商品信息
            // 加入前首先要判断是否有库存
            CatalogService catalogService = new CatalogService();



            boolean isInStock = catalogService.isItemInStock(itemId);
            //根据itemId获取商品信息，并加入到cartDb
            Item item = catalogService.getItem(itemId);
            CartDb cartDb=new CartDb();
            cartDb.setUserId(userId);
            cartDb.setItemId(itemId);
            cartDb.setProductId(item.getProductId());
            cartDb.setName(item.getName());
            cartDb.setInStock(isInStock);
            cartDb.setQuantity(Q);
            cartDb.setListPrice(item.getListPrice());
            cartDb.setTotal(item.getListPrice());

            //加入购物车
        cartDAO.removeCartByItemId(userId, itemId);
            cartDAO.addCart(cartDb);

    }

}
