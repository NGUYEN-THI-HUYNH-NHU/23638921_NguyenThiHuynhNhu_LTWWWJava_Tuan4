<%--
  Created by IntelliJ IDEA.
  User: huynh
  Date: 9/25/2026
  Time: 6:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>View Cart</title>
    <style>
        body {
            font-family: sans-serif;
            margin: 40px;
            color: #333;
            background: #f9f9f9;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 20px;
        }

        .card {
            background: #fff;
            border: 1px solid #e1e1e1;
            padding: 15px;
            border-radius: 6px;
            text-align: center;
        }

        .card img {
            max-width: 120px;
            height: 120px;
            object-fit: cover;
            margin-bottom: 10px;
        }

        .price {
            color: #0066cc;
            font-weight: bold;
            margin: 10px 0;
        }

        input[type="text"] {
            width: 40px;
            text-align: center;
            padding: 4px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button, input[type="submit"] {
            background: #0066cc;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 5px;
        }

        button:hover, input[type="submit"]:hover {
            background: #004999;
        }

        a {
            color: #0066cc;
            text-decoration: none;
            font-size: 14px;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h2 class="header">Product List</h2>
<p>
    <a href="cart">View Cart</a>
</p>
<div class="grid">
    <c:forEach items="${products}" var="p">
        <div class="card">
            <b>${p.model}</b>
            <br/>
            <img src="images/${p.imgURL}" class="img"/><br/>
            Price: ${p.price}<br/>
            <form action="${pageContext.request.contextPath}/cart" method="post">
                <input type="text" size="2" value="1" name="quantity"/><br/>
                <input type="hidden" name="id" value="${p.id}"/><br/>
                <input type="hidden" name="price" value="${p.price}" class="price"/><br/>
                <input type="hidden" name="model" value="${p.model}"/><br/>
                <input type="hidden" name="action" value="add"/><br/>
                <input type="submit" name="addToCart" value="Add To Cart"/><br/>
            </form>
            <a href="${pageContext.request.contextPath}/product?id=${p.id}">Product Detail</a>
        </div>
    </c:forEach>
</div>
</body>
</html>
