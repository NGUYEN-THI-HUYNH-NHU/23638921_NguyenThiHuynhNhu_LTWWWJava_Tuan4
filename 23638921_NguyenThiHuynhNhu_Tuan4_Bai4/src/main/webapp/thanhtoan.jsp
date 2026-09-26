<%--
  Created by IntelliJ IDEA.
  User: huynh
  Date: 9/26/2026
  Time: 11:07 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>IUH Bookstore - Thanh toán</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .layout {
            display: flex;
        }

        .content {
            flex: 1;
            padding: 20px;
        }

        .checkout-form {
            width: 600px;
        }

        .checkout-table {
            width: 100%;
            border-collapse: collapse;
            border: 1px solid #999;
        }

        .checkout-table td {
            padding: 10px;
            border: 1px solid #ccc;
            vertical-align: middle;
        }

        .checkout-table .form-label {
            width: 180px;
            background-color: #f5f5f5;
            font-weight: bold;
            text-align: left;
        }

        .form-input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        .total-price {
            background: #eee;
        }

        .payment-options {
            display: flex;
            gap: 15px;
            align-items: center;
        }

        .payment-options label {
            font-weight: normal;
        }

        .form-actions {
            text-align: center;
            padding-top: 10px;
        }

        .btn-save {
            background: #5d4037;
            color: white;
            border: none;
            padding: 8px 15px;
            cursor: pointer;
        }

        .btn-cancel {
            margin-left: 10px;
            text-decoration: none;
            color: #555;
        }
    </style>
</head>

<body>
<jsp:include page="header.jsp"/>

<div class="layout">
    <jsp:include page="sidebar.jsp"/>

    <div class="content">
        <h3>Checkout - Already registered!</h3>

        <form action="${pageContext.request.contextPath}/checkout" method="post" class="checkout-form">

            <table class="checkout-table">
                <tr>
                    <td class="form-label">
                        <label for="fullname">Fullname:</label>
                    </td>
                    <td>
                        <input type="text" id="fullname" name="fullname" required class="form-input">
                    </td>
                </tr>
                <tr>
                    <td class="form-label">
                        <label for="address">Shipping address:</label>
                    </td>
                    <td>
                        <input type="text" id="address" name="address" required class="form-input">
                    </td>
                </tr>
                <tr>
                    <td class="form-label">
                        <label for="totalPrice">Total price (VND):</label>
                    </td>
                    <td>
                        <input type="text" id="totalPrice" name="totalPrice" value="${sessionScope.cart.total}" readonly
                               class="form-input total-price">
                    </td>
                </tr>
                <tr>
                    <td class="form-label">
                        <label>Payment method:</label>
                    </td>
                    <td>
                        <div class="payment-options">
                            <label>
                                <input type="radio" name="payment" value="Paypal" checked> Paypal
                            </label>
                            <label>
                                <input type="radio" name="payment" value="ATM Debit"> ATM Debit
                            </label>
                            <label>
                                <input type="radio" name="payment" value="Visa/Master card"> Visa/Master card
                            </label>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="form-actions">
                        <input type="submit" value="Save" class="btn-save">
                        <a href="${pageContext.request.contextPath}/cart" class="btn-cancel"> Cancel </a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

</body>
</html>
