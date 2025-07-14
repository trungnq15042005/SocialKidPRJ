<%-- 
    Document   : editComment
    Created on : Jul 12, 2025, 10:46:19 AM
    Author     : Admin
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sửa bình luận</title>
</head>
<body>
    <h2>Sửa Bình Luận</h2>
    <form action="${pageContext.request.contextPath}/editComment" method="post">
        <input type="hidden" name="commentId" value="${comment.commentID}" />
        <textarea name="commentText" rows="4" cols="50" required>${comment.commentText}</textarea>
        <br><br>
        <button type="submit">Lưu</button>
    </form>
</body>
</html>

