<%--
  Created by IntelliJ IDEA.
  User: huynh
  Date: 9/25/2026
  Time: 3:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head><title>Account List</title></head>
<body>
<h2>Registered Accounts List</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Email</th>
        <th>Date of Birth</th>
    </tr>
    <c:forEach var="acc" items="${accounts}">
        <tr>
            <td>${acc.id}</td>
            <td>${acc.firstname}</td>
            <td>${acc.lastname}</td>
            <td>${acc.email}</td>
            <td>${acc.dateOfBirth}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>