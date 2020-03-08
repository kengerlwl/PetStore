package repetstore.dao;

import repetstore.domain.Item;

import java.util.List;
import java.util.Map;

public interface ItemDAO {
    //更新库存数量
    void updateInventoryQuantity(Map<String, Object> param);
    //获取库存数量(通过某一个具体的item的ID可以知道)
    int getInventoryQuantity(String itemId);
    //通过productId获取item列表
    List<Item> getItemListByProduct(String productId);
    //通过具体的一个itemId来获取到某一个对应的item
    Item getItem(String itemId);
}
