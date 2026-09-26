<%--
  Created by IntelliJ IDEA.
  User: huynh
  Date: 9/26/2026
  Time: 11:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>IUH Bookstore - Chi tiết sản phẩm</title>
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

        .detail-box {
            display: flex;
            gap: 30px;
            background: #fff;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .detail-box img {
            width: 220px;
            height: 300px;
            object-fit: cover;
            border: 1px solid #ccc;
        }

        .detail-info h2 {
            margin-top: 0;
            color: #5d4037;
        }

        .price {
            font-size: 18px;
            color: #b12704;
            font-weight: bold;
            margin: 15px 0;
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

        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: #0066c0;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>

<div class="main-layout">
    <jsp:include page="sidebar.jsp"/>

    <div class="content">
        <c:if test="${not empty book}">
            <p style="font-size: 14px; color: #666; margin-bottom: 15px;">Book detail &gt; ${book.title} -
                Author: ${book.author}</p>
            <div class="detail-box">
                <img src="images/${book.imgBook}" alt="${book.title}">
                <div class="detail-info">
                    <h2>${book.title}</h2>
                    <p><strong>Author: </strong>${book.author}</p>
                    <div class="price">Price (VND): ${book.price}</div>

                    <form action="${pageContext.request.contextPath}/cart" method="post" style="margin-top: 20px;">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="id" value="${book.id}">
                        <button type="submit" class="btn-add">Add to cart</button>
                    </form>

                    <div>
                        <a href="${pageContext.request.contextPath}/books" class="back-link">Back to Book List</a>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${empty book}">
            <p style="color: red;">Book detail not found!</p>
        </c:if>
    </div>
</div>
</body>
</html>
