package repetstore.service;

import repetstore.dao.CategoryDAO;
import repetstore.dao.ItemDAO;
import repetstore.dao.ProductDAO;
import repetstore.dao.implement.CategoryDAOImpl;
import repetstore.dao.implement.ItemDAOImpl;
import repetstore.dao.implement.ProductDAOImpl;
import repetstore.domain.Category;
import repetstore.domain.Item;
import repetstore.domain.Product;

import java.util.List;

public class CatalogService {
    private CategoryDAO categoryDAO;
    private ProductDAO productDAO;
    private ItemDAO itemDAO;

    //在构造方法中进行实例化
    public CatalogService(){
        categoryDAO = new CategoryDAOImpl();
        productDAO = new ProductDAOImpl();
        itemDAO = new ItemDAOImpl();
    }

    public List<Category> getCategoryList(){
        return categoryDAO.getCategoryList();
    }

    public Category getCategory(String categoryId){
        return categoryDAO.getCategory(categoryId);
    }

    public Product getProduct(String productId){
        return productDAO.getProduct(productId);
    }

    public List<Product> getProductListByCategory(String categoryId){
        return productDAO.getProductListByCategory(categoryId);
    }

    public List<Product> searchProductList(String keyword){
        return productDAO.searchProductList(keyword);
    }

    //对item具体商品行项目操作
    public List<Item> getItemListByProduct(String productId) {
        return itemDAO.getItemListByProduct(productId);
    }

    public Item getItem(String itemId) {
        return itemDAO.getItem(itemId);
    }

    //判断是否有库存
    public boolean isItemInStock(String itemId) {
        return itemDAO.getInventoryQuantity(itemId) > 0;
    }


}
