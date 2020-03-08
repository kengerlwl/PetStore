package repetstore.dao.implement;

import repetstore.dao.DBUtil;
import repetstore.dao.ItemDAO;
import repetstore.domain.Item;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ItemDAOImpl implements ItemDAO {
    private static final String updateInventoryQuantityString = "UPDATE INVENTORY SET QTY = QTY - ? WHERE ITEMID = ?";
    private static final String getInventoryQuantityString = "SELECT QTY AS value FROM INVENTORY WHERE ITEMID = ?";
    private static final String getItemListByProductString = "SELECT ITEMID,I.PRODUCTID as PRODUCTID,LISTPRICE,UNITCOST,SUPPLIER,STATUS,P.NAME AS NAME ,P.DESCN AS DESCN  FROM ITEM I,PRODUCT P WHERE P.PRODUCTID = I.PRODUCTID AND I.PRODUCTID = ?";
    private static final String getItemString = "SELECT I.ITEMID,I.PRODUCTID as PRODUCTID,LISTPRICE,UNITCOST,SUPPLIER,STATUS,P.NAME AS NAME ,P.DESCN AS DESCN,QTY AS quantity  FROM ITEM I,PRODUCT P,INVENTORY V WHERE P.PRODUCTID = I.PRODUCTID AND  I.ITEMID = V.ITEMID AND I.ITEMID = ?";



    @Override
    public void updateInventoryQuantity(Map<String, Object> param) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(updateInventoryQuantityString);
            String itemId = param.get("itemId").toString();
            Integer increment = (Integer) param.get("increment");
            pStatement.setInt(1,increment);
            pStatement.setString(2,itemId);
            pStatement.executeUpdate();
            DBUtil.closePreparedStatement(pStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public int getInventoryQuantity(String itemId) {
        int result = -1;
        try{
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(getInventoryQuantityString);
            pStatement.setString(1,itemId);
            ResultSet resultSet = pStatement.executeQuery();
            if (resultSet.next()){
                result = resultSet.getInt(1);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(pStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public List<Item> getItemListByProduct(String productId) {
        List<Item> itemList = new ArrayList<Item>();
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(getItemListByProductString);
            pStatement.setString(1,productId);
            ResultSet resultSet = pStatement.executeQuery();
            while (resultSet.next()){
                Item item = new Item();
                item.setItemId(resultSet.getString(1));
                item.setProductId(resultSet.getString(2));
                item.setListPrice(resultSet.getBigDecimal(3));
                item.setUnitCost(resultSet.getBigDecimal(4));
                item.setSupplier(resultSet.getInt(5));
                item.setStatus(resultSet.getString(6));
                item.setName(resultSet.getString(7));
                item.setDescn(resultSet.getString(8));

                itemList.add(item);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(pStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
        return itemList;
    }

    @Override
    public Item getItem(String itemId) {
        Item item = null;
        try{
            Connection connection = DBUtil.getConnection();
            PreparedStatement pStatement = connection.prepareStatement(getItemString);
            pStatement.setString(1,itemId);
            ResultSet resultSet = pStatement.executeQuery();

            if (resultSet.next()){
                item = new Item();
                item.setItemId(resultSet.getString(1));
                item.setProductId(resultSet.getString(2));
                item.setListPrice(resultSet.getBigDecimal(3));
                item.setUnitCost(resultSet.getBigDecimal(4));
                item.setSupplier(resultSet.getInt(5));
                item.setStatus(resultSet.getString(6));
                item.setName(resultSet.getString(7));
                item.setDescn(resultSet.getString(8));
                item.setQuantity(resultSet.getInt(9));
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(pStatement);
            DBUtil.closeConnection(connection);

        }catch (Exception e){
            e.printStackTrace();
        }
        return item;
    }
}
