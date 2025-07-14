<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Đăng nhập - KidConnect</title>
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.6.0/fonts/remixicon.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Quicksand:wght@300..700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/style.css" />
</head>
<body>

    <div class="login-wrapper">

        <!-- Box xanh + logo -->
        <div class="login-header-box">
            <div class="logo-row">
                <div class="logo-circle">
                    <i class="ri-bear-smile-fill"></i>
                </div>
                <h1 class="logo-text-white">KidConnect</h1>
            </div>
        </div>

        <p class="subtitle">Chào mừng bạn quay trở lại!</p>

        <c:if test="${not empty error}">
            <div class="error-msg">${error}</div>
        </c:if>
        <c:if test="${not empty successMessage}">
            <div class="success-msg">${successMessage}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/login" method="post" id="loginForm">

            <div>
                <label for="email">Email</label>
                <div class="input-group">
                    <i class="ri-mail-line"></i>
                    <input type="email" id="email" name="email" required
                           value="${cookie.email != null ? cookie.email.value : ''}"
                           placeholder="Nhập địa chỉ email của bạn" />
                </div>
            </div>

            <div>
                <label for="password">Mật khẩu</label>
                <div class="input-group">
                    <i class="ri-lock-line"></i>
                    <input type="password" id="password" name="password" required
                           value="${cookie.password != null ? cookie.password.value : ''}"
                           placeholder="Nhập mật khẩu của bạn" />
                </div>
            </div>

            <div class="form-footer">
                <label class="custom-checkbox">
                    <input type="checkbox" name="remember" ${cookie.email != null ? "checked" : ""} />
                    <span class="checkmark"></span>
                    Ghi nhớ đăng nhập
                </label>
                <a href="#" tabindex="-1">Quên mật khẩu?</a>
            </div>

            <button type="submit">
                <i class="ri-login-circle-line btn-icon"></i>
                <span>Đăng nhập</span>
            </button>

            <div class="divider"><span>Hoặc đăng nhập với</span></div>

            <div class="social-buttons">
                <button type="button" class="social-button">
                    <i class="ri-google-fill social-google"></i> Google
                </button>
                <button type="button" class="social-button">
                    <i class="ri-facebook-fill social-facebook"></i> Facebook
                </button>
            </div>
        </form>

        <p class="bottom-text">
            Chưa có tài khoản?
            <a href="${pageContext.request.contextPath}/register.jsp">Đăng ký ngay</a>
        </p>

    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const form = document.getElementById('loginForm');
            form.addEventListener('submit', function (e) {
                const email = form.email.value.trim();
                const password = form.password.value.trim();
                if (!email || !password) {
                    alert("Vui lòng nhập đầy đủ email và mật khẩu.");
                    e.preventDefault();
                }
            });
        });
    </script>
</body>
</html>
