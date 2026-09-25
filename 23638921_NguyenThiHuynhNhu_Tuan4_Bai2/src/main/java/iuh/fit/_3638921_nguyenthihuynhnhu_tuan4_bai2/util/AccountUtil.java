/**
 * File: null.java
 * Created by: Nguyen Thi Huynh Nhu
 * Date: 9/25/2026
 */

package iuh.fit._3638921_nguyenthihuynhnhu_tuan4_bai2.util;

import iuh.fit._3638921_nguyenthihuynhnhu_tuan4_bai2.model.Account;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AccountUtil {
    private DataSource dataSource;

    public AccountUtil(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public List<Account> getAccounts() throws Exception {
        List<Account> accounts = new ArrayList<>();

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();
            String sql = "SELECT * FROM ACCOUNTS ORDER BY ID";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                int id = rs.getInt("ID");
                String fname = rs.getString("FIRSTNAME");
                String lname = rs.getString("LASTNAME");
                String email = rs.getString("EMAIL");
                String pwd = rs.getString("PASSWORD");
                Date dob = rs.getDate("DATEOFBIRTH");
                Account acc = new Account(id, fname, lname, email, pwd, dob);
                accounts.add(acc);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return accounts;
    }

    public void addAccount(Account acc) throws Exception {
        String sql = "INSERT INTO accounts (FIRSTNAME, LASTNAME, EMAIL, PASSWORD, DATEOFBIRTH) " +
                "VALUES (?, ?, ?, ?, ?)";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = dataSource.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, acc.getFirstname());
            ps.setString(2, acc.getLastname());
            ps.setString(3, acc.getEmail());
            ps.setString(4, acc.getPassword());
            ps.setDate(5, acc.getDateOfBirth());
            ps.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
