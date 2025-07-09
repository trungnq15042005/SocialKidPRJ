<%-- 
    Document   : dashboard
    Created on : Jul 9, 2025, 11:49:53 PM
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- Kiểm tra nếu chưa đăng nhập hoặc không phải admin thì redirect --%>
<c:if test="${empty sessionScope.currentUser || sessionScope.currentUser.role != 'admin'}">
    <c:redirect url="${pageContext.request.contextPath}/login.jsp" />
</c:if>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - KidConnect</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.6.0/fonts/remixicon.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Quicksand:wght@300..700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style.css">
</head>
<body class="main-layout">

    <%-- Header dùng chung --%>
    <jsp:include page="/common/header.jsp" />

    <div class="content-wrapper">
        <c:if test="${not empty successMessage}">
            <div class="alert-message alert-success">${successMessage}</div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="alert-message alert-error">${errorMessage}</div>
        </c:if>

        <h2>🛡 Quản trị hệ thống - Xin chào, <c:out value="${sessionScope.currentUser.fullName}" />!</h2>

        <div class="card">
            <h3>Thống kê nhanh</h3>
            <ul style="list-style: none; padding: 0;">
                <li>👥 Số người dùng: <strong>120</strong></li>
                <li>📝 Số bài viết: <strong>45</strong></li>
                <li>💬 Số bình luận: <strong>210</strong></li>
                <li>🚩 Báo cáo vi phạm: <strong>3</strong></li>
            </ul>
        </div>

        <div class="card">
            <h3>Quản lý</h3>
            <ul style="list-style: none; padding: 0;">
                <li><a href="${pageContext.request.contextPath}/admin/manage-users.jsp">👤 Quản lý người dùng</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/manage-posts.jsp">📝 Quản lý bài viết</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/reports.jsp">🚩 Quản lý báo cáo</a></li>
                <li><a href="${pageContext.request.contextPath}/logout">🚪 Đăng xuất</a></li>
            </ul>
        </div>
    </div>

    <%-- Footer dùng chung --%>
    <jsp:include page="/common/footer.jsp" />
</body>
</html>
