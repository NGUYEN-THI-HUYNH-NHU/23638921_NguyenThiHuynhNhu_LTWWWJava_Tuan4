<%--
  Created by IntelliJ IDEA.
  User: huynh
  Date: 9/25/2026
  Time: 3:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register form</title>
</head>
<body>
    <h2>Register form</h2>
    <form action="${pageContext.request.contextPath}/registerForm" method="post">
        First Name: <input type="text" name="firstname"><br>
        Last Name: <input type="text" name="lastname"><br>
        Email: <input type="email" name="email"><br>
        Password: <input type="password" name="password"><br>
        Birthday (Day/Month/Year):
        <input type="number" name="day" size="2">
        <input type="number" name="month" size="2">
        <input type="number" name="year" size="4"><br>
        <input type="submit" value="Sign Up">
    </form>
</body>
</html>
