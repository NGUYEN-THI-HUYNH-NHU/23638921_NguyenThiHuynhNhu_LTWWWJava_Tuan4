<%--
  Created by IntelliJ IDEA.
  User: huynh
  Date: 9/26/2026
  Time: 10:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div style="width: 250px; background: #f4f4f4; padding: 20px; border-right: 1px solid #ddd; min-height: 500px;">
    <h3 style="border-bottom: 2px solid #5d4037; padding-bottom: 5px; color: #333;">ABOUT US</h3>
    <p style="font-size: 14px; color: #666;">About us information will be here... <a href="#" style="color: #5d4037;">Read
        More &raquo;</a></p>

    <h3 style="border-bottom: 2px solid #5d4037; padding-bottom: 5px; color: #333; margin-top: 30px;">SEARCH SITE</h3>
    <form action="${pageContext.request.contextPath}/books" method="get">
        <input type="text" name="keyword" value="${param.keyword}" placeholder="Enter book title..."
               style="width: 90%; padding: 6px; border: 1px solid #ccc; border-radius: 4px;">
    </form>

    <div style="margin-top: 30px;">
        <a href="${pageContext.request.contextPath}/cart"
           style="color: #5d4037; font-weight: bold; text-decoration: none;">
            Cart (${empty sessionScope.cart ? 0 : sessionScope.cart.itemCount})
        </a>
    </div>
</div>
