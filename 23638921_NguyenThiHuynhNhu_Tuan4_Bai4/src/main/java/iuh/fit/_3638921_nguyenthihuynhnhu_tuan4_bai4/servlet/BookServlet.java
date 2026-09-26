/**
 * File: null.java
 * Created by: Nguyen Thi Huynh Nhu
 * Date: 9/26/2026
 */

package iuh.fit._3638921_nguyenthihuynhnhu_tuan4_bai4.servlet;

import iuh.fit._3638921_nguyenthihuynhnhu_tuan4_bai4.dao.BookDao;
import iuh.fit._3638921_nguyenthihuynhnhu_tuan4_bai4.model.Book;
import jakarta.annotation.Resource;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.List;

@WebServlet({"/books"})
public class BookServlet extends HttpServlet {
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
        String idstr = req.getParameter("id");
        String keyword = req.getParameter("keyword");
        if (idstr != null) {
            int id = Integer.parseInt(idstr);
            Book book = bookDao.getById(id);
            if (book != null) {
                req.setAttribute("book", book);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/chitietsach.jsp");
                rd.forward(req, resp);
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Book not found");
                return;
            }
        } else {
            List<Book> books;
            if (keyword != null) {
                books = bookDao.getByTitle(keyword.trim());
                req.setAttribute("keyword", keyword);
            } else {
                books = bookDao.getAll();
            }

            req.setAttribute("books", books);
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/danhsach.jsp");
            rd.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
