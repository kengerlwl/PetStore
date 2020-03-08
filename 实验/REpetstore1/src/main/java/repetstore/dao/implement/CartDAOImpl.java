package repetstore.dao.implement;

import repetstore.dao.CartDAO;
import repetstore.dao.DBUtil;
import repetstore.domain.CartDb;

import java.math.BigDecimal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartDAOImpl implements CartDAO {
    private static final String ADD_CART = "INSERT INTO CART (USERID,ITEMID,PRODUCTID,NAME,INSTOCK,QUANTITY,LISTPRICE,TOTAL) VALUES (?,?,?,?,?,?,?,?)";
    private static final String deleteCartString = " DELETE FROM CART WHERE USERID = ?  " ;
    private static final String DELETE_CART = "DELETE FROM CART WHERE USERID = ? AND ITEMID = ?";


    private static final String UPDATE_ITEM_BY_ID = "UPDATE CART SET QUANTITY = ? WHERE USERID = ? AND ITEMID = ?";


    private static final String UPDATE_TOTAL = "SELECT SUM(TOTAL) AS TOTAL FROM CART WHERE USERID = ?";
    private static final String CONTAIN_BY_ITEMID = "SELECT ITEMID FROM CART WHERE USERID = ? AND ITEMID = ?";
    private static final String CARTLIST = "SELECT USERID,ITEMID,PRODUCTID,NAME,INSTOCK,QUANTITY,LISTPRICE,TOTAL FROM CART WHERE USERID = ?";
    private static final String UPDATE_CART = "UPDATE CART SET QUANTITY = ?,TOTAL=LISTPRICE*QUANTITY  WHERE USERID = ? AND  ITEMID = ? ";

    @Override
    public void addCart(CartDb cartDb) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_CART);
            preparedStatement.setString(1,cartDb.getUserId());
            preparedStatement.setString(2,cartDb.getItemId());
            preparedStatement.setString(3,cartDb.getProductId());
            preparedStatement.setString(4,cartDb.getName());
            preparedStatement.setBoolean(5,cartDb.isInStock());
            preparedStatement.setInt(6,cartDb.getQuantity());
            preparedStatement.setBigDecimal(7,cartDb.getListPrice());
            preparedStatement.setBigDecimal(8,cartDb.getTotal());
            preparedStatement.executeUpdate();

            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    //清空购物车
    @Override
    public void removeCart(String userId) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(deleteCartString);
            preparedStatement.setString(1,userId);
            preparedStatement.executeUpdate();

            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void removeCartByItemId(String userId, String itemId) {
        try{
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CART);
            preparedStatement.setString(1,userId);
            preparedStatement.setString(2,itemId);
            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void incrementQuantityByItemId(String userId, String itemId) {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ITEM_BY_ID);
            preparedStatement.setString(1,userId);
            preparedStatement.setString(2,itemId);
            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public BigDecimal getSubTotal(String userId)
    {
        BigDecimal result = null;
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_TOTAL);
            preparedStatement.setString(1,userId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()){
                result = resultSet.getBigDecimal(1);
            }
            preparedStatement.execute();
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e)
        {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public boolean containsItemId(String userId, String itemId)
    {
        boolean flag = false;
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(CONTAIN_BY_ITEMID);
            preparedStatement.setString(1,userId);
            preparedStatement.setString(2,itemId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()){
                flag = true;
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
        return flag;
    }

    @Override
    public List<CartDb> getCartList(String userId)
    {
        List<CartDb> cartDbList = new ArrayList<CartDb>();
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(CARTLIST);
            preparedStatement.setString(1,userId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                CartDb cartDb = new CartDb();
                cartDb.setUserId(resultSet.getString(1));
                cartDb.setItemId(resultSet.getString(2));
                cartDb.setProductId(resultSet.getString(3));
                cartDb.setName(resultSet.getString(4));
                cartDb.setInStock(resultSet.getBoolean(5));
                cartDb.setQuantity(resultSet.getInt(6));
                cartDb.setListPrice(resultSet.getBigDecimal(7));
                cartDb.setTotal(resultSet.getBigDecimal(8));

                cartDbList.add(cartDb);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
        return cartDbList;
    }

    @Override
    public void updateCart(String userId, String itemId, int quantity)
    {
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CART);
            preparedStatement.setInt(1,quantity);
            preparedStatement.setString(2,userId);
            preparedStatement.setString(3,itemId);
            preparedStatement.executeUpdate();
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
