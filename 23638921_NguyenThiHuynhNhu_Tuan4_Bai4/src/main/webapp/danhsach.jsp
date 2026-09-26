<%--
  Created by IntelliJ IDEA.
  User: huynh
  Date: 9/26/2026
  Time: 10:51 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>IUH Bookstore - Danh sách sách</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333;
        }

        .main-layout {
            display: flex;
        }

        .content {
            flex: 1;
            padding: 20px;
        }

        .book-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
        }

        .book-card {
            background: #fff;
            border: 1px solid #ddd;
            padding: 15px;
            border-radius: 4px;
            text-align: center;
        }

        .book-card img {
            width: 120px;
            height: 160px;
            object-fit: cover;
            margin-bottom: 10px;
            border: 1px solid #eee;
        }

        .book-title {
            font-size: 14px;
            font-weight: bold;
            height: 40px;
            overflow: hidden;
            margin-bottom: 8px;
        }

        .book-price {
            color: #b12704;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .book-actions a {
            display: block;
            font-size: 13px;
            color: #0066c0;
            text-decoration: none;
            margin: 4px 0;
        }

        .book-actions a:hover {
            text-decoration: underline;
            color: #c45500;
        }

        .btn-add {
            background: #5d4037;
            color: white;
            padding: 8px 16px;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            font-weight: bold;
            font-size: 13px;
            width: 100%;
            margin-top: 5px;
        }

        .btn-add:hover {
            background: #3e2723;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>

<div class="main-layout">
    <jsp:include page="sidebar.jsp"/>

    <div class="content">
        <h2>BOOK LIST</h2>

        <div class="book-grid">
            <c:forEach var="book" items="${books}">
                <div class="book-card">
                    <img src="images/${book.imgBook}" alt="${book.title}">
                    <div class="book-title">${book.title}</div>
                    <div class="book-price">Price: ${book.price} VND</div>
                    <div class="book-actions">
                        <a href="${pageContext.request.contextPath}/books?id=${book.id}">Book detail</a>

                        <form action="${pageContext.request.contextPath}/cart" method="post">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="id" value="${book.id}">
                            <button type="submit" class="btn-add">Add to cart</button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>