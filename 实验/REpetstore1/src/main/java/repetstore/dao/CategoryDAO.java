package repetstore.dao;

import repetstore.domain.Category;

import java.util.List;

public interface CategoryDAO {
    //获取所有的大类
    List<Category> getCategoryList();
    //返回的是一个id对象(用于后面的使用)
    Category getCategory(String categoryId);
}
