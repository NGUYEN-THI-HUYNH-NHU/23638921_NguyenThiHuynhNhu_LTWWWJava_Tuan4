/**
 * File: null.java
 * Created by: Nguyen Thi Huynh Nhu
 * Date: 9/26/2026
 */

package iuh.fit._3638921_nguyenthihuynhnhu_tuan4_bai4.dao;

import iuh.fit._3638921_nguyenthihuynhnhu_tuan4_bai4.model.Book;
import iuh.fit._3638921_nguyenthihuynhnhu_tuan4_bai4.util.DBUtil;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDao {
    private DBUtil dbUtil;

    public BookDao(DataSource dataSource) {
        this.dbUtil = new DBUtil(dataSource);
    }

    public List<Book> getAll() {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM BOOKS";
        try (
                Connection conn = dbUtil.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);
        ) {
            while (rs.next()) {
                int id = rs.getInt("ID");
                String title = rs.getString("TITTLE");
                String author = rs.getString("AUTHOR");
                String imgBook = rs.getString("IMGBOOK");
                double price = rs.getDouble("PRICE");
                Book b = new Book(id, title, author, imgBook, price);
                books.add(b);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return books;
    }

    public Book getById(int id) {
        String sql = "SELECT * FROM BOOKS WHERE ID = ?";
        try (
                Connection conn = dbUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
        ) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String title = rs.getString("TITTLE");
                    String author = rs.getString("AUTHOR");
                    String imgBook = rs.getString("IMGBOOK");
                    double price = rs.getDouble("PRICE");
                    return new Book(id, title, author, imgBook, price);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return null;
    }

    public List<Book> getByTitle(String keyword) {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM BOOKS WHERE TITTLE LIKE ?";
        try (
                Connection conn = dbUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql);
        ) {
            ps.setString(1, "%" + keyword + "%");
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("ID");
                    String title = rs.getString("TITTLE");
                    String author = rs.getString("AUTHOR");
                    String imgBook = rs.getString("IMGBOOK");
                    double price = rs.getDouble("PRICE");
                    books.add(new Book(id, title, author, imgBook, price));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return books;
    }
}
