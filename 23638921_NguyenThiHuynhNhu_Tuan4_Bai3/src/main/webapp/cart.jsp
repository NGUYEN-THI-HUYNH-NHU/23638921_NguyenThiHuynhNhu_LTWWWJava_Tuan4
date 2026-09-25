<%--
  Created by IntelliJ IDEA.
  User: huynh
  Date: 9/25/2026
  Time: 6:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Cart</title>
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

        .container {
            max-width: 800px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border: 1px solid #e1e1e1;
            border-radius: 6px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border-bottom: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background: #f4f4f4;
        }

        input[type="number"] {
            width: 50px;
            padding: 4px;
            text-align: center;
        }

        button, input[type="submit"] {
            background: #0066cc;
            color: white;
            border: none;
            padding: 6px 10px;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover, input[type="submit"]:hover {
            background: #004999;
        }

        input[type="submit"].btn-danger {
            background: #cc3333;
            color: white;
        }

        input[type="submit"].btn-danger:hover {
            background: #992222;
        }

        .actions {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        a {
            color: #0066cc;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="header">Cart</h2>
    <c:if test="${empty cart.items}">
        <p>Cart is empty!</p>
    </c:if>

    <c:if test="${not empty cart.items}">
        <table class="table table-border">
            <tr>
                <th>Model</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="item" items="${cart.items}">
                <tr>
                    <td>${item.product.model}</td>
                    <td>
                        <form action="${pageContext.request.contextPath}/cart" method="post" style="display: inline">
                            <input type="hidden" name="action" value="update"/>
                            <input type="hidden" name="id" value="${item.product.id}"/>
                            <input type="number" name="quantity" value="${item.quantity}" min="1"/>
                            <input type="submit" value="Update"/>
                        </form>
                    </td>
                    <td>${item.product.price}</td>
                    <td>${item.product.price * item.quantity}</td>
                    <td>
                        <form action="${pageContext.request.contextPath}/cart" method="post" style="display: inline">
                            <input type="hidden" name="action" value="remove"/>
                            <input type="hidden" name="id" value="${item.product.id}"/>
                            <input type="submit" value="Remove" class="btn-danger"/>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <p><strong>Total: </strong>${cart.total}</p>
    </c:if>

    <div class=" actions">
        <a href="product">Continue shopping</a>
        <c:if test="${not empty cart.items}">
            <form action="${pageContext.request.contextPath}/cart" method="post" style="display:inline;">
                <input type="hidden" name="action" value="clear"/>
                <input type="submit" value="Clear cart" class="btn-danger"/>
            </form>
        </c:if>
    </div>
</div>
</body>
</html>
