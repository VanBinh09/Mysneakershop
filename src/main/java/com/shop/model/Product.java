package com.shop.model;

import java.math.BigDecimal;

public class Product {

    private int id;
    private String name;
    private BigDecimal price;
    private String image;
    private String description;

    public Product() {}

    public Product(int id, String name, BigDecimal price, String image, String desc) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.image = image;
        this.description = desc;
    }

    // getters/setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
