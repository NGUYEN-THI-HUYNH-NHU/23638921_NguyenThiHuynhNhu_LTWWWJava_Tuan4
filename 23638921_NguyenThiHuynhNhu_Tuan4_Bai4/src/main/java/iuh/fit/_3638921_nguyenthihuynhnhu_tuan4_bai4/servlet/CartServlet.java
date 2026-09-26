/**
 * File: null.java
 * Created by: Nguyen Thi Huynh Nhu
 * Date: 9/26/2026
 */

package iuh.fit._3638921_nguyenthihuynhnhu_tuan4_bai4.servlet;

import iuh.fit._3638921_nguyenthihuynhnhu_tuan4_bai4.dao.BookDao;
import iuh.fit._3638921_nguyenthihuynhnhu_tuan4_bai4.model.Book;
import iuh.fit._3638921_nguyenthihuynhnhu_tuan4_bai4.model.CartBean;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.sql.DataSource;
import java.io.IOException;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private BookDao bookDao;
    @Resource(name = "jdbc/bookstoredb")
    private DataSource dataSource;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        bookDao = new BookDao(dataSource);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/giohang.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        CartBean cart = (CartBean) session.getAttribute("cart");
        if (cart == null) {
            cart = new CartBean();
            session.setAttribute("cart", cart);
        }

        String action = req.getParameter("action");
        try {
            if ("add".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                Book b = bookDao.getById(id);
                cart.addBook(b);
            } else if ("remove".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                cart.removeBook(id);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }

        resp.sendRedirect(req.getContextPath() + "/cart");
    }
}
