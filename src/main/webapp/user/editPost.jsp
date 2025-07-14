<%-- 
    Document   : editPost
    Created on : Jul 10, 2025, 11:11:52 AM
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Sửa bài viết - KidConnect</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style.css">
</head>
<body class="main-layout">

<jsp:include page="/common/header.jsp"/>

<div class="content-wrapper">
    <h2>Sửa bài viết</h2>

    <form action="${pageContext.request.contextPath}/editPost" method="post" enctype="multipart/form-data">
        <input type="hidden" name="postId" value="${post.postID}"/>

        <div class="input-group" style="padding-left: 0;">
            <textarea name="content" class="form-input-full" rows="4" required>${post.content}</textarea>
        </div>

        <c:if test="${not empty post.imageUrl}">
            <img src="${pageContext.request.contextPath}/${post.imageUrl}" style="max-width:50%; border-radius:12px; margin-top:10px;">
        </c:if>

        <div class="input-group" style="padding-left: 0; margin-top:10px;">
            <input type="file" name="image" accept="image/*" />
        </div>

        <button type="submit" style="margin-top: 10px;">
            <i class="ri-edit-line btn-icon"></i>
            <span>Cập nhật</span>
        </button>
    </form>
</div>

<jsp:include page="/common/footer.jsp"/>

</body>
</html>

