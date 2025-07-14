<%-- 
    Document   : header
    Created on : Jul 9, 2025, 11:25:12 PM
    Author     : Admin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header>
    <nav>
        <div class="logo-row">
            <div class="logo-circle"><i class="ri-bear-smile-fill"></i></div>
            <h1 class="logo-text">KidConnect</h1>
        </div>
        <ul>
            <c:if test="${sessionScope.currentUser != null}">
                <li><a href="${pageContext.request.contextPath}/home"><i class="ri-home-4-line"></i> Trang chủ</a></li>
                <li><a href="${pageContext.request.contextPath}/editProfile"><i class="ri-user-line"></i> Hồ sơ</a></li>
                <li><a href="${pageContext.request.contextPath}/messages"><i class="ri-message-3-line"></i> Tin nhắn</a></li>
                <li><a href="${pageContext.request.contextPath}/notifications"><i class="ri-notification-3-line"></i> Thông báo</a></li>
                <c:if test="${sessionScope.userRole eq 'admin'}">
                    <li><a href="${pageContext.request.contextPath}/admin/moderation"><i class="ri-shield-user-line"></i> Kiểm duyệt</a></li>
                </c:if>
                <li><a href="${pageContext.request.contextPath}/logout"><i class="ri-logout-box-r-line"></i> Đăng xuất</a></li>
            </c:if>
            <c:if test="${sessionScope.currentUser == null}">
                <li><a href="${pageContext.request.contextPath}/login"><i class="ri-login-box-line"></i> Đăng nhập</a></li>
                <li><a href="${pageContext.request.contextPath}/register"><i class="ri-user-add-line"></i> Đăng ký</a></li>
            </c:if>
        </ul>
    </nav>
</header>
