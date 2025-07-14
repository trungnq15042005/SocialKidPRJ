<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/common/header.jsp" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin.css" />

<div class="content-wrapper">
    <h2>📋 Quản lý Bình luận</h2>

    <c:if test="${empty comments}">
        <p>Không có bình luận nào để hiển thị.</p>
    </c:if>

    <c:if test="${not empty comments}">
        <table class="admin-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Người dùng</th>
                    <th>Bài viết</th>
                    <th>Nội dung</th>
                    <th>Ngày tạo</th>
                    <th>Hiển thị</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="cmt" items="${comments}">
                    <tr>
                        <td>${cmt.commentID}</td>

                        <td>
                            <img src="${pageContext.request.contextPath}/${cmt.userID.avatar}" alt="avatar"
                                 class="avatar-sm" />
                            <c:out value="${cmt.userID.fullName}" />
                        </td>

                        <td>
                            [#${cmt.postID.postID}]
                            <c:out value="${fn:substring(cmt.postID.content, 0, 30)}" />...
                        </td>

                        <td><c:out value="${cmt.commentText}" /></td>

                        <td><fmt:formatDate value="${cmt.createdAt}" pattern="dd/MM/yyyy HH:mm" /></td>

                        <td class="status-icon">
                            <c:choose>
                                <c:when test="${cmt.visible}">✅</c:when>
                                <c:otherwise>🚫</c:otherwise>
                            </c:choose>
                        </td>

                        <td>
                            <form action="${pageContext.request.contextPath}/admin/comments" method="post" style="display:inline;">
                                <input type="hidden" name="commentId" value="${cmt.commentID}" />
                                <input type="hidden" name="action" value="toggleVisibility" />
                                <button type="submit" class="toggle-btn">Ẩn/Hiện</button>
                            </form>

                            <form action="${pageContext.request.contextPath}/admin/comments" method="post"
                                  style="display:inline;" onsubmit="return confirm('Xoá bình luận này?');">
                                <input type="hidden" name="commentId" value="${cmt.commentID}" />
                                <input type="hidden" name="action" value="delete" />
                                <button type="submit" class="delete-btn">Xoá</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>

<jsp:include page="/common/footer.jsp" />
