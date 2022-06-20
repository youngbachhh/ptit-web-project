package model;

import java.sql.ResultSet;

public class Product {
    private int id;
    private String name;
    private String description;
    private int price;
    private int quantity;
    private String image;
    private String category;

    private int orderdetailsQuantity;
    public Product() {

    }



    public Product(int id, String name, String description, int price, int quantity, String image, String category) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.quantity = quantity;
        this.image = image;
        this.category = category;
    }

    public Product(String name, int price, String image, int orderdetailsQuantity) {
        this.name = name;
        this.price = price;
        this.image = image;
        this.orderdetailsQuantity = orderdetailsQuantity;
    }

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getOrderdetailsQuantity() {  return orderdetailsQuantity; }

    public void setOrderdetailsQuantity(int orderQuantity) { this.orderdetailsQuantity = orderQuantity; }


    public void increaseQuantity() {
        this.quantity++;
    }
}
