<%-- 
    Document   : user
    Created on : Jul 14, 2025, 3:53:39 PM
    Author     : Admin
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/common/header.jsp" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin.css" />


<div class="content-wrapper">
    <h2>👥 Quản lý Người dùng</h2>

    <c:if test="${empty users}">
        <p>Không có người dùng nào.</p>
    </c:if>

    <c:if test="${not empty users}">
        <table class="admin-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Avatar</th>
                    <th>Tên đầy đủ</th>
                    <th>Email</th>
                    <th>Vai trò</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.userID}</td>
                        <td>
                            <img src="${pageContext.request.contextPath}/${user.avatar}" class="avatar-sm" />
                        </td>
                        <td>${user.fullName}</td>
                        <td>${user.email}</td>
                        <td>${user.role}</td>
                        <td>
                            <c:choose>
                                <c:when test="${user.active}">
                                    ✅ Hoạt động
                                </c:when>
                                <c:otherwise>
                                    🚫 Bị khóa
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <form method="post" action="${pageContext.request.contextPath}/admin/users" style="display:inline;">
                                <input type="hidden" name="userId" value="${user.userID}" />
                                <input type="hidden" name="action" value="toggleActive" />
                                <button type="submit" class="toggle-btn">
                                    <c:choose>
                                        <c:when test="${user.active}">Khoá</c:when>
                                        <c:otherwise>Mở khoá</c:otherwise>
                                    </c:choose>
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>

<jsp:include page="/common/footer.jsp" />

