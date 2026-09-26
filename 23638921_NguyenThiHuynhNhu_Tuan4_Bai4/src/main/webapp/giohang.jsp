<%--
  Created by IntelliJ IDEA.
  User: huynh
  Date: 9/26/2026
  Time: 11:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>IUH Bookstore - Giỏ hàng</title>
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

        h3.cart-title {
            text-align: center;
            color: #5d4037;
            border-bottom: 2px solid #5d4037;
            padding-bottom: 10px;
        }

        table.cart-table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            margin-top: 15px;
        }

        table.cart-table th, table.cart-table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
            font-size: 14px;
        }

        table.cart-table th {
            background-color: #5d4037;
            color: white;
        }

        .total-row {
            text-align: right;
            font-weight: bold;
            font-size: 16px;
            padding: 15px;
            background: #fff;
            border: 1px solid #ddd;
            border-top: none;
        }

        .cart-actions {
            margin-top: 20px;
            display: flex;
            gap: 15px;
        }

        .btn-checkout {
            background: #5d4037;
            color: white;
            padding: 8px 16px;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
        }

        .btn-checkout:hover {
            background: #3e2723;
        }

        .link-continue {
            color: #0066c0;
            text-decoration: none;
            line-height: 32px;
        }

        .link-continue:hover {
            text-decoration: underline;
        }

        .remove-link {
            color: #cc0000;
            text-decoration: none;
            border: none;
            background: none;
        }

        .remove-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>

<div class="main-layout">
    <jsp:include page="sidebar.jsp"/>

    <div class="content">
        <h3 class="cart-title">YOUR SHOPPING CART</h3>

        <c:if test="${empty sessionScope.cart || empty sessionScope.cart.items}">
            <p style="text-align: center; margin-top: 30px;">Cart empty!</p>
            <div style="text-align: center; margin-top: 15px;">
                <a href="${pageContext.request.contextPath}/books" class="link-continue">Continue shopping</a>
            </div>
        </c:if>

        <c:if test="${not empty sessionScope.cart && not empty sessionScope.cart.items}">
            <table class="cart-table">
                <tr>
                    <th>Book ID</th>
                    <th>Book name</th>
                    <th>Price</th>
                    <th>Qty</th>
                    <th>Total</th>
                    <th>Remove</th>
                </tr>
                <c:forEach var="item" items="${sessionScope.cart.items}">
                    <tr>
                        <td>pro0${item.book.id}</td>
                        <td>${item.book.title} - Author: ${item.book.author}</td>
                        <td>${item.book.price}</td>
                        <td>${item.quantity}</td>
                        <td>${item.subtotal}</td>
                        <td>
                            <form action="${pageContext.request.contextPath}/cart" method="post">
                                <input type="hidden" name="action" value="remove"/>
                                <input type="hidden" name="id" value="${item.book.id}"/>
                                <input type="submit" value="Remove" class="remove-link"/>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <div class="total-row">Total price (VND): ${sessionScope.cart.total}</div>
            <div class="cart-actions">
                <a href="${pageContext.request.contextPath}/checkout" class="btn-checkout">Checkout</a>
                <a href="${pageContext.request.contextPath}/books" class="link-continue">Continue shopping</a>
            </div>
        </c:if>
    </div>
</div>
</body>
</html>
