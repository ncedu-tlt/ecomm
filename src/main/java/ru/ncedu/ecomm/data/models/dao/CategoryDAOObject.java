package ru.ncedu.ecomm.data.models.dao;

public class CategoryDAOObject {

    private long categoryId;
    private Long parentId;
    private String name;
    private String description;

    public CategoryDAOObject() {
    }

    public CategoryDAOObject(long categoryId, Long parentId, String name, String description) {
        this.categoryId = categoryId;
        this.parentId = parentId;
        this.name = name;
        this.description = description;
    }

    public long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(long categoryId) {
        this.categoryId = categoryId;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
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
