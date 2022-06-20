package dao;

import model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class ProductDAO extends DBconnection {


    public List<Product> getAllProducts() {
        String sql = "SELECT * FROM product";
        List<Product> products = new ArrayList<Product>();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps = connection.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("productId"));
                product.setName(rs.getString("productName"));
                product.setPrice(rs.getInt("productPrice"));
                product.setDescription(rs.getString("productDescription"));
                product.setImage(rs.getString("productImg"));
                product.setCategory(rs.getString("productCategory"));
                products.add(product);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }


    public Product getProductById(int id) {
        String sql = "SELECT * FROM product WHERE productId = ?";
        Product product = new Product();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                product.setId(rs.getInt("productId"));
                product.setName(rs.getString("productName"));
                product.setPrice(rs.getInt("productPrice"));
                product.setDescription(rs.getString("productDescription"));
                product.setImage(rs.getString("productImg"));
                product.setCategory(rs.getString("productCategory"));
                product.setQuantity(rs.getInt("productQuantity"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
    }

    public void createProduct(Product product) {
        String sql = "INSERT INTO product (productName, productImg, productPrice, productQuantity, productDescription, productCategory) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, product.getName());
            ps.setString(2, product.getImage());
            ps.setDouble(3, product.getPrice());
            ps.setInt(4, product.getQuantity());
            ps.setNString(5, product.getDescription());
            ps.setString(6, product.getCategory());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateProduct(Product product) {
        String sql = "UPDATE product SET productName = ?, productImg = ?,  productPrice = ?, productQuantity = ? ,productDescription = ?, productCategory = ? WHERE productId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, product.getName());
            ps.setString(2, product.getImage());
            ps.setDouble(3, product.getPrice());
            ps.setInt(4, product.getQuantity());
            ps.setNString(5, product.getDescription());
            ps.setString(6, product.getCategory());
            ps.setInt(7, product.getId());
            ps.executeUpdate();


        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteProduct(int id) {
        String sql = "DELETE FROM product WHERE productId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public List<String> getAllCategory() {
        List<Product> listProduct = getAllProducts();
        Set<String> listCategory = new HashSet<>();

        for(Product product : listProduct) {
            listCategory.add(product.getCategory());
        }

        return new ArrayList<>(listCategory);
    }

    public List<Product> searchProduct(String txtSearch){
        List<Product> list = new ArrayList<>();
        String sql = "select * from product where productName like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("productId"));
                product.setName(rs.getString("productName"));
                product.setPrice(rs.getInt("productPrice"));
                product.setDescription(rs.getString("productDescription"));
                product.setImage(rs.getString("productImg"));
                product.setCategory(rs.getString("productCategory"));
                list.add(product);
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductByCate(String categoryName) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product where productCategory like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + categoryName + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("productId"));
                product.setName(rs.getString("productName"));
                product.setPrice(rs.getInt("productPrice"));
                product.setDescription(rs.getString("productDescription"));
                product.setImage(rs.getString("productImg"));
                product.setCategory(rs.getString("productCategory"));
                list.add(product);
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductByOrderID(String ID) {
        List<Product> list = new ArrayList<>();
        String sql = "select product.productName, product.productPrice, product.productImg, orderdetail.quantity from webptit.product \n" +
                "join webptit.orderdetail on product.productId = orderdetail.productId where orderdetail.orderId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, ID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setName(rs.getString("productName"));
                product.setPrice(rs.getInt("productPrice"));
                product.setImage(rs.getString("productImg"));
                product.setOrderdetailsQuantity(rs.getInt("quantity"));
                list.add(product);
                System.out.println(list.get(0).getName());
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
