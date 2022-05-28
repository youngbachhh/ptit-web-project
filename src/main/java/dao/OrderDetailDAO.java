package dao;

import java.sql.PreparedStatement;

public class OrderDetailDAO extends DBconnection {
    public void add(int orderID, int productID, int quantity) {
        String query = "INSERT INTO orderdetail(orderID, productID, quantity) VALUES (?, ?, ?);";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1,orderID);
            ps.setInt(2, productID);
            ps.setInt(3, quantity);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
