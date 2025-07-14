<%-- 
    Document   : profile
    Created on : Jul 12, 2025, 10:54:31 AM
    Author     : Admin
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:if test="${empty sessionScope.currentUser}">
    <c:redirect url="${pageContext.request.contextPath}/login.jsp" />
</c:if>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Hồ sơ cá nhân - KidConnect</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style.css">
</head>
<body class="main-layout">

<jsp:include page="/common/header.jsp" />

<div class="content-wrapper">

    <h2>Hồ sơ cá nhân</h2>

    <div class="card" style="display: flex; gap: 20px; align-items: center;">
        <!-- Avatar -->
        <div>
            <img src="${pageContext.request.contextPath}/${sessionScope.currentUser.avatar != null ? sessionScope.currentUser.avatar : 'uploads/default-avatar.png'}"
                 alt="Avatar" style="width: 120px; height: 120px; border-radius: 50%; object-fit: cover;">
        </div>

        <!-- Form update info -->
        <form action="${pageContext.request.contextPath}/editProfile" method="post" enctype="multipart/form-data" style="flex: 1;">
            <div style="margin-bottom: 10px;">
                <label>Họ và tên</label><br>
                <input type="text" name="fullName" value="${sessionScope.currentUser.fullName}" class="form-input-full">
            </div>
            <input type="hidden" name="userId" value="${user.userID}" />
            <div style="margin-bottom: 10px;">
                <label>Email</label><br>
                <input type="email" name="email" value="${sessionScope.currentUser.email}" class="form-input-full">
            </div>

            <div style="margin-bottom: 10px;">
                <label>Ngày sinh</label><br>
                <input type="date" name="dob" value="<fmt:formatDate value='${sessionScope.currentUser.dob}' pattern='yyyy-MM-dd'/>" class="form-input-full">
            </div>

            <div style="margin-bottom: 10px;">
                <label>Ảnh đại diện mới</label><br>
                <input type="file" name="avatar">
            </div>

            <button type="submit" style="background-color: #10b981; color: white; padding: 10px 16px; border-radius: 8px; border: none; cursor: pointer;">
                <i class="ri-save-line"></i> Lưu thay đổi
            </button>
        </form>
    </div>

    <!-- Danh sách bài viết -->
    <div class="card" style="margin-top: 30px;">
        <h3>Bài viết của bạn</h3>

        <c:if test="${empty myPosts}">
            <p>Bạn chưa đăng bài nào.</p>
        </c:if>

        <c:forEach var="post" items="${myPosts}">
            <div class="card" style="background-color: #f9fafb; margin-bottom: 15px;">
                <p>
                    <small><fmt:formatDate value="${post.createdAt}" pattern="dd/MM/yyyy HH:mm" /></small>
                </p>
                <p>${post.content}</p>

                <c:if test="${not empty post.imageUrl}">
                    <img src="${pageContext.request.contextPath}/${post.imageUrl}" style="max-width: 50%; border-radius: 12px;">
                </c:if>
            </div>
        </c:forEach>

    </div>

</div>

<jsp:include page="/common/footer.jsp" />

</body>
</html>
