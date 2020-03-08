package repetstore.domain;

import java.io.Serializable;

public class Category implements Serializable {
    private static final long serialVersionUID = -1306629417941883981L;

    //自带category这一个变量
    private String categoryId;
    private String name;
    private String description;

    public String getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
