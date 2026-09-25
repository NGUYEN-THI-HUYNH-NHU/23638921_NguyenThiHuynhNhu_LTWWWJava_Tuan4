<%--
  Created by IntelliJ IDEA.
  User: huynh
  Date: 9/25/2026
  Time: 6:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Detail</title>
    <style>
        body {
            font-family: sans-serif;
            margin: 40px;
            color: #333;
            background: #f9f9f9;
        }

        .detail-container {
            background: #fff;
            border: 1px solid #e1e1e1;
            padding: 30px;
            border-radius: 6px;
            max-width: 600px;
            margin: auto;
            display: flex;
            gap: 30px;
            align-items: center;
        }

        .detail-container img {
            max-width: 200px;
            height: 200px;
            object-fit: cover;
            border: 1px solid #eee;
            border-radius: 4px;
        }

        .info h2 {
            margin-top: 0;
        }

        .price {
            color: #0066cc;
            font-size: 18px;
            font-weight: bold;
            margin: 15px 0;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            color: #0066cc;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h2>Product Detail</h2>
<c:if test="${not empty product}">
    <div class="detail-container">
        <img src="${pageContext.request.contextPath}/images/${product.imgURL}" alt="${product.model}">
        <div class="info">
            <h2>${product.model}</h2>
            <p><strong>Id:</strong> ${product.id}</p>
            <p><strong>Description:</strong> ${product.description}</p>
            <p><strong>In stock:</strong> ${product.quantity}</p>
            <div class="price">${product.price}</div>
        </div>
    </div>
</c:if>
<a href="${pageContext.request.contextPath}/product">Back to Product List</a>
</body>
</html>
