package dao;

import model.Order;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO extends DBconnection{
    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM order";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("orderID"));
                order.setUserId(rs.getInt("userID"));
                order.setName(rs.getString("name"));
                order.setPhone(rs.getString("phone"));
                order.setAddress(rs.getString("address"));
                order.setTotalPrice(rs.getInt("totalPrice"));
                order.setStatus(rs.getString("status"));
                order.setDate(rs.getString("date"));
                orders.add(order);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }
    public List<Order> getOrderByUserID(String userID) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT * FROM webptit.order where userId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1,userID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("orderID"));
                order.setUserId(rs.getInt("userID"));
                order.setName(rs.getString("name"));
                order.setPhone(rs.getString("phone"));
                order.setAddress(rs.getString("address"));
                order.setTotalPrice(rs.getInt("totalPrice"));
                order.setStatus(rs.getString("status"));
                order.setDate(rs.getString("date"));
                orders.add(order);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        return orders;
    }
}
