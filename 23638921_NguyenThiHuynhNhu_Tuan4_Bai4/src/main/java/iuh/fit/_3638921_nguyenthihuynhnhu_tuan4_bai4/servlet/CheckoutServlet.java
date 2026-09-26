/**
 * File: null.java
 * Created by: Nguyen Thi Huynh Nhu
 * Date: 9/26/2026
 */

package iuh.fit._3638921_nguyenthihuynhnhu_tuan4_bai4.servlet;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/thanhtoan.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String fullname = req.getParameter("fullname");
        String address = req.getParameter("address");
        String payment = req.getParameter("payment");

        HttpSession session = req.getSession();
        session.removeAttribute("cart");

        resp.setContentType("text/html;charset=UTF-8");
        resp.getWriter().println("<h3>Đặt hàng thành công! Cảm ơn bạn, " + fullname + ".</h3>");
        resp.getWriter().println("<p>Địa chỉ giao hàng: " + address + "</p>");
        resp.getWriter().println("<p>Phương thức thanh toán: " + payment + "</p>");
        resp.getWriter().println("<a href='" + req.getContextPath() + "/books'>Về trang chủ</a>");
    }
}
