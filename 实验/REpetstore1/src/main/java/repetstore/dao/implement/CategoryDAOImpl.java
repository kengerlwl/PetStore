package repetstore.dao.implement;

import repetstore.dao.CategoryDAO;
import repetstore.dao.DBUtil;
import repetstore.domain.Category;

import java.awt.image.DataBuffer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.ConcurrentModificationException;
import java.util.List;

public class CategoryDAOImpl implements CategoryDAO {

    //返回所有的列表的元素
    private static final String GET_CATEGORY_LIST = "SELECT CATID AS categoryId,NAME,DESCN AS description FROM CATEGORY";
    //通过categorgId进行返回列表元素
    private static final String GET_CATEGORY = "SELECT CATID AS category,NAME,DESCN AS description FROM CATEGORY WHERE CATID = ?";

    @Override
    public List<Category> getCategoryList() {
        List<Category> categoryList = new ArrayList<Category>();
        try{
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_CATEGORY_LIST);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                //首先实例化
                Category category = new Category();
                //将定义的结果集分别传入到数据库的列中（与SQL语句对应）
                category.setCategoryId(resultSet.getString(1));
                category.setName(resultSet.getString(2));
                category.setDescription(resultSet.getString(3));
                //创建一个list集合，然后使用list.add()方法给list集合添加了三个结果集的值，
                // 通过循环while语句，将list集合存储到数据库
                categoryList.add(category);
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
        return categoryList;
    }

    @Override
    public Category getCategory(String categoryId) {
        Category category = null;
        try {
            Connection connection = DBUtil.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(GET_CATEGORY);
            //绑定变量
            preparedStatement.setString(1,categoryId);
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                category = new Category();
                category.setCategoryId(resultSet.getString(1));
                category.setName(resultSet.getString(2));
                category.setDescription(resultSet.getString(3));
            }
            DBUtil.closeResultSet(resultSet);
            DBUtil.closePreparedStatement(preparedStatement);
            DBUtil.closeConnection(connection);
        }catch (Exception e){
            e.printStackTrace();
        }
        return category;
    }
}
