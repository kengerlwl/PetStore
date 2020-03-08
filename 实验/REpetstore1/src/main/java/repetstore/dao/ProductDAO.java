package repetstore.dao;

import repetstore.domain.Product;

import java.util.List;

public interface ProductDAO {
    //获取Category 算是一个大类别
    List<Product> getProductListByCategory(String categoryId);
    //获取Product列表
    Product getProduct(String productId);
    //模糊搜索
    List<Product> searchProductList(String keywords);
}
