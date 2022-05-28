package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CheckoutDAO extends DBconnection{
    public int add(String userID, String username, String phonenumber, String address, String total) {
        String sql = "INSERT INTO webptit.order (userID, name, phone, address,totalPrice, date) VALUES (?, ?, ?, ?, ?, current_date)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, userID);
            ps.setString(2, username);
            ps.setString(3, phonenumber);
            ps.setString(4, address);
            ps.setString(5, total);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if(rs.next()) {
                return rs.getInt(1);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        }
        return 0;
    }
}
