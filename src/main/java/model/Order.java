package model;

import model.Payment;
import model.Product;
import model.User;

public class Order {
    private int id;
    private int quantity;

    private Product product;
    private User user;
    private Payment payment;

    public Order() {
    }

    public Order(int id, int quantity, Product product, User user, Payment payment) {
        this.id = id;
        this.quantity = quantity;
        this.product = product;
        this.user = user;
        this.payment = payment;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }
}
