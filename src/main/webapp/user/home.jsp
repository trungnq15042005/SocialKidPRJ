<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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

<jsp:include page="/common/header.jsp" />

<div class="content-wrapper">

    <c:if test="${not empty successMessage}">
        <div class="alert-message alert-success">${successMessage}</div>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <div class="alert-message alert-error">${errorMessage}</div>
    </c:if>

    <h2>Chào mừng, 
        <c:out value="${sessionScope.currentUser.fullName != null ? sessionScope.currentUser.fullName : sessionScope.currentUser.username}" />!
    </h2>

    <c:choose>
        <c:when test="${sessionScope.currentUser.role == 'admin'}">
            <p>🛡 Đây là khu vực quản trị. Bạn có thể quản lý hệ thống.</p>
        </c:when>
        <c:when test="${sessionScope.currentUser.role == 'parent'}">
            <p>👨‍👩‍👧‍👦 Đây là khu vực phụ huynh để theo dõi con em.</p>
        </c:when>
        <c:when test="${sessionScope.currentUser.role == 'child'}">
            <p>🎈 Khu vực dành cho bạn nhỏ! Hãy chia sẻ điều thú vị nhé!</p>
        </c:when>
        <c:otherwise>
            <p>❗ Vai trò không xác định.</p>
        </c:otherwise>
    </c:choose>

    <!-- Form đăng bài -->
    <div class="card">
        <h3>Tạo bài viết mới</h3>
        <form action="${pageContext.request.contextPath}/post" method="post" enctype="multipart/form-data">
            <div class="input-group" style="padding-left: 0;">
                <textarea name="content" class="form-input-full" placeholder="Bạn muốn chia sẻ điều gì hôm nay?" rows="4" required></textarea>
            </div>
            <div class="input-group" style="padding-left: 0; margin-top:10px;">
                <input type="file" name="image" accept="image/*" />
            </div>
            <button type="submit" style="margin-top: 10px;">
                <i class="ri-send-plane-fill btn-icon"></i> Đăng bài
            </button>
        </form>
    </div>

    <!-- Danh sách bài viết -->
    <div class="card">
        <h3>Các bài viết gần đây</h3>

        <c:if test="${empty posts}">
            <p>Chưa có bài viết nào. Hãy là người đầu tiên đăng nhé!</p>
        </c:if>

        <c:forEach var="post" items="${posts}">
            <div class="card" style="background-color: #f9fafb; margin-bottom: 15px;">
                <div style="display: flex; align-items: center; gap: 10px; margin-bottom: 8px;">
                    <img src="${pageContext.request.contextPath}/${post.userID.avatar != null ? post.userID.avatar : 'assets/default-avatar.png'}" 
                         alt="avatar" style="width:40px; height:40px; border-radius:50%; object-fit:cover;" />

                    <div>
                        <strong><c:out value="${post.userID.fullName != null ? post.userID.fullName : post.userID.username}" /></strong><br/>
                        <small><fmt:formatDate value="${post.createdAt}" pattern="dd/MM/yyyy HH:mm" /></small>
                    </div>
                </div>

                <p>${post.content}</p>

                <c:if test="${not empty post.imageUrl}">
                    <img src="${pageContext.request.contextPath}/${post.imageUrl}" style="max-width:50%; border-radius:12px;" />
                </c:if>

                <div style="display: flex; gap: 10px; margin-top: 10px;">
                    <form action="${pageContext.request.contextPath}/reaction" method="post" style="display:inline;">
                        <input type="hidden" name="postId" value="${post.postID}" />
                        <button type="submit" style="background-color: #3b82f6; color: white; padding: 6px 16px; border-radius: 8px; border: none; cursor: pointer; font-weight: bold;">
                            <i class="ri-thumb-up-line"></i> ${post.likeCount != null ? post.likeCount : 0} Like
                        </button>
                    </form>

                    <c:if test="${sessionScope.currentUser.userID == post.userID.userID || sessionScope.currentUser.role == 'admin'}">
                        <form action="${pageContext.request.contextPath}/deletePost" method="post" style="display:inline;">
                            <input type="hidden" name="postId" value="${post.postID}" />
                            <button type="submit" style="background-color: #ef4444; color: white; padding: 6px 16px; border-radius: 8px; border: none; cursor: pointer;" onclick="return confirm('Bạn có chắc muốn xoá bài này không?');">
                                <i class="ri-delete-bin-line"></i> Xoá
                            </button>
                        </form>

                        <form action="${pageContext.request.contextPath}/editPost" method="get" style="display:inline;">
                            <input type="hidden" name="postId" value="${post.postID}" />
                            <button type="submit" style="background-color: #f59e0b; color: white; padding: 6px 12px; border-radius: 8px; border: none; cursor: pointer;">
                                <i class="ri-edit-2-line"></i> Sửa
                            </button>
                        </form>
                    </c:if>
                </div>

                <!-- Danh sách bình luận -->
                <div style="margin-top: 10px; padding-left: 10px;">
                    <c:forEach var="comment" items="${post.commentsList}">
                        <div style="display: flex; align-items: flex-start; gap: 10px; margin-bottom: 8px;">
                            <img src="${pageContext.request.contextPath}/${comment.userID.avatar != null ? comment.userID.avatar : 'assets/default-avatar.png'}"
                                 alt="avatar" style="width:32px; height:32px; border-radius:50%; object-fit:cover;" />
                            <div>
                                <div style="display: flex; align-items: center; justify-content: space-between;">
                                    <p style="margin: 0;">
                                        <strong><c:out value="${comment.userID.fullName}" /></strong>: 
                                        <c:out value="${comment.commentText}" />
                                    </p>

                                    <c:if test="${sessionScope.currentUser.userID == comment.userID.userID || sessionScope.currentUser.role == 'admin'}">
                                        <div style="display: flex; gap: 6px; align-items: center; margin-left: 10px;">
                                            <form action="${pageContext.request.contextPath}/deleteComment" method="post" style="display:inline;">
                                                <input type="hidden" name="commentId" value="${comment.commentID}" />
                                                <button type="submit" style="background: none; border: none; color: #ef4444; cursor: pointer;" title="Xoá" onclick="return confirm('Xoá bình luận này?')">
                                                    <i class="ri-delete-bin-line"></i>
                                                </button>
                                            </form>

                                            <form action="${pageContext.request.contextPath}/editComment" method="get" style="display:inline;">
                                                <input type="hidden" name="commentId" value="${comment.commentID}" />
                                                <button type="submit" style="background: none; border: none; color: #f59e0b; cursor: pointer;" title="Sửa">
                                                    <i class="ri-edit-2-line"></i>
                                                </button>
                                            </form>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!-- Form bình luận -->
                <form action="${pageContext.request.contextPath}/comment" method="post" style="margin-top: 8px;">
                    <input type="hidden" name="postId" value="${post.postID}" />
                    <input type="text" name="commentText" placeholder="Viết bình luận..." style="padding:6px 10px; border-radius:8px; width: 60%;" required />
                    <button type="submit" style="padding:6px 12px; border-radius:8px; background-color: #10b981; color:white; border:none; cursor:pointer;">
                        Gửi
                    </button>
                </form>
            </div>
        </c:forEach>
    </div>
</div>

<jsp:include page="/common/footer.jsp" />

</body>
</html>
