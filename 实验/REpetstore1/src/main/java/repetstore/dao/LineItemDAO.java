package repetstore.dao;

import repetstore.domain.LineItem;

import java.util.List;

public interface LineItemDAO {
    //通过某一个orderId返回LineItem列表
    List<LineItem> getLineItemByOrderId(int orderId);
    //新插入某一个item值
    void insertLineItem(LineItem lineItem);
}
