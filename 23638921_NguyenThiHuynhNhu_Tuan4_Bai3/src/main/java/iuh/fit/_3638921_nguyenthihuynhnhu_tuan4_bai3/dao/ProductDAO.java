/**
 * File: null.java
 * Created by: Nguyen Thi Huynh Nhu
 * Date: 9/25/2026
 */

package iuh.fit._3638921_nguyenthihuynhnhu_tuan4_bai3.dao;

import iuh.fit._3638921_nguyenthihuynhnhu_tuan4_bai3.beans.Product;
import iuh.fit._3638921_nguyenthihuynhnhu_tuan4_bai3.util.DBUtil;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private DBUtil dbUtil;

    public ProductDAO(DataSource dataSource) {
        dbUtil = new DBUtil(dataSource);
    }

    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM PRODUCTS";
        try (Connection conn = dbUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql);
        ) {
            while (rs.next()) {
                int id = rs.getInt("ID");
                String model = rs.getString("MODEL");
                String description = rs.getString("DESCRIPTION");
                int quantity = rs.getInt("QUANTITY");
                double price = rs.getDouble("PRICE");
                String imgURL = rs.getString("IMGURL");
                products.add(new Product(id, model, description, quantity, price, imgURL));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return products;
    }

    public Product getProductById(int id) {
        String sql = "SELECT * FROM PRODUCTS WHERE ID = ?";
        try (
                Connection conn = dbUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
        ) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String model = rs.getString("MODEL");
                    String description = rs.getString("DESCRIPTION");
                    int quantity = rs.getInt("QUANTITY");
                    double price = rs.getDouble("PRICE");
                    String imgURL = rs.getString("IMGURL");
                    Product p = new Product(id, model, description, quantity, price, imgURL);
                    return p;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return null;
    }
}
