<%-- 
    Document   : home
    Created on : Jul 9, 2025, 11:25:45 PM
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- Nếu chưa đăng nhập, chuyển hướng về login.jsp --%>
<c:if test="${empty sessionScope.currentUser}">
    <c:redirect url="${pageContext.request.contextPath}/login.jsp" />
</c:if>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Trang chủ - KidConnect</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.6.0/fonts/remixicon.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Quicksand:wght@300..700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style.css" />
</head>
<body class="main-layout">

    <%-- Header chung --%>
    <jsp:include page="/common/header.jsp" />

    <div class="content-wrapper">

        <c:if test="${not empty successMessage}">
            <div class="alert-message alert-success">${successMessage}</div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="alert-message alert-error">${errorMessage}</div>
        </c:if>

        <h2>Chào mừng, <c:out value="${sessionScope.currentUser.fullName}" />!</h2>

        <c:choose>
            <c:when test="${sessionScope.currentUser.role == 'admin'}">
                <p>🛡 Đây là khu vực quản trị. Bạn có thể quản lý người dùng, bài viết và báo cáo.</p>
            </c:when>
            <c:when test="${sessionScope.currentUser.role == 'parent'}">
                <p>👨‍👩‍👧‍👦 Đây là khu vực của phụ huynh. Bạn có thể theo dõi hoạt động của con và hỗ trợ con em mình.</p>
            </c:when>
            <c:when test="${sessionScope.currentUser.role == 'child'}">
                <p>🎈 Đây là khu vực của các bạn nhỏ! Hãy đăng bài và chia sẻ điều thú vị nhé!</p>
            </c:when>
            <c:otherwise>
                <p>❗ Vai trò không xác định. Vui lòng liên hệ quản trị viên.</p>
            </c:otherwise>
        </c:choose>

        <div class="card">
            <h3>Tạo bài viết mới</h3>
            <form action="${pageContext.request.contextPath}/post" method="post">
                <div class="input-group" style="padding-left: 0;">
                    <textarea name="content" class="form-input-full" placeholder="Bạn muốn chia sẻ điều gì hôm nay?" rows="5" required></textarea>
                </div>
                <button type="submit">
                    <i class="ri-send-plane-fill btn-icon"></i>
                    <span>Đăng bài</span>
                </button>
            </form>
        </div>

        <div class="card">
            <h3>Các bài viết gần đây</h3>
            <p>Chưa có bài viết nào được hiển thị. Hãy là người đầu tiên đăng bài nhé!</p>
        </div>

    </div>

    <%-- Footer chung --%>
    <jsp:include page="/common/footer.jsp" />

</body>
</html>
