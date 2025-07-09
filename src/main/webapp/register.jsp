<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Đăng ký - KidConnect</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.6.0/fonts/remixicon.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Quicksand:wght@300..700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style.css" />
</head>
<body>
    <div class="login-wrapper">
        <div class="logo-row">
            <div class="logo-circle"><i class="ri-bear-smile-fill"></i></div>
            <h1 class="logo-text">KidConnect</h1>
        </div>
        <p class="subtitle">Tham gia cộng đồng vui vẻ!</p>

        <!-- Thông báo lỗi -->
        <c:if test="${not empty errorMessage}">
            <div class="error-msg">${errorMessage}</div>
        </c:if>
        <c:if test="${not empty successMessage}">
            <div class="success-msg">${successMessage}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/register" method="post" id="registerForm">
            <div>
                <label for="username">Tên đăng nhập</label>
                <div class="input-group">
                    <i class="ri-user-line"></i>
                    <input type="text" id="username" name="username" required 
                           placeholder="Tên đăng nhập"
                           value="${param.username != null ? param.username : ''}" />
                </div>
            </div>

            <div>
                <label for="email">Email</label>
                <div class="input-group">
                    <i class="ri-mail-line"></i>
                    <input type="email" id="email" name="email" required 
                           placeholder="Email của bạn"
                           value="${param.email != null ? param.email : ''}" />
                </div>
            </div>

            <div>
                <label for="password">Mật khẩu</label>
                <div class="input-group">
                    <i class="ri-lock-line"></i>
                    <input type="password" id="password" name="password" required 
                           placeholder="Mật khẩu của bạn" />
                </div>
            </div>

            <div>
                <label for="fullName">Họ và tên</label>
                <div class="input-group">
                    <i class="ri-id-card-line"></i>
                    <input type="text" id="fullName" name="fullName" required 
                           placeholder="Họ và tên đầy đủ"
                           value="${param.fullName != null ? param.fullName : ''}" />
                </div>
            </div>

            <div>
                <label for="dob">Ngày sinh</label>
                <div class="input-group">
                    <i class="ri-calendar-line"></i>
                    <input type="date" id="dob" name="dob" required 
                           value="${param.dob != null ? param.dob : ''}" />
                </div>
            </div>

            <div>
                <label for="role">Vai trò</label>
                <div class="input-group">
                    <i class="ri-user-settings-line"></i>
                    <select id="role" name="role" required>
                        <option value="child" ${param.role == 'child' ? 'selected' : ''}>Trẻ em</option>
                        <option value="parent" ${param.role == 'parent' ? 'selected' : ''}>Phụ huynh</option>
                    </select>
                </div>
            </div>

            <button type="submit">
                <i class="ri-user-add-line btn-icon"></i>
                <span>Đăng ký</span>
            </button>
        </form>

        <p class="bottom-text">
            Đã có tài khoản? <a href="${pageContext.request.contextPath}/login">Đăng nhập ngay</a>
        </p>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const form = document.getElementById('registerForm');
            form.addEventListener('submit', function (e) {
                const username = form.username.value.trim();
                const email = form.email.value.trim();
                const password = form.password.value.trim();
                const fullName = form.fullName.value.trim();
                const dob = form.dob.value;

                if (!username || !email || !password || !fullName || !dob) {
                    alert("Vui lòng nhập đầy đủ thông tin!");
                    e.preventDefault();
                }
            });
        });
    </script>
</body>
</html>
