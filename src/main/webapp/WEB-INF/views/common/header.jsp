<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<header class="main-header">
    <div class="logo">
        <a href="/"><img src="image/logo.png" alt="New Face Logo"></a>
    </div>
    <nav>
        <ul>
            <li><a href="/" class="<%= request.getRequestURI().contains("index") ? "active" : "" %>">Home</a></li>
            <li><a href="#" class="<%= request.getRequestURI().contains("start_virtual") ? "active" : "" %>">Start Virtual</a></li>
            <li><a href="shorts" class="<%= request.getRequestURI().contains("shorts") ? "active" : "" %>">Shorts</a></li>
            <li><a href="contest" class="<%= request.getRequestURI().contains("contest") ? "active" : "" %>">Contest</a></li>
        </ul>
    </nav>
    <div class="sign-in">
        <button id="signUpButton" onclick="location.href='/joinForm'">Sign Up</button>
        <button id="loginButton" onclick="location.href='/loginForm'">Login</button>
        <span id="greeting" style="display: none;">000님 안녕하세요</span>
        <button id="logoutButton" style="display: none;" onclick="location.href='/logout'">Logout</button>
    </div>

    <script>
        window.onload = function() {
            var userNickname = "${sessionScope.loginUser.getUserNickname()}";
            var greeting = document.getElementById("greeting");
            var signUpButton = document.getElementById("signUpButton");
            var loginButton = document.getElementById("loginButton");
            var logoutButton = document.getElementById("logoutButton");
            
            if (userNickname) {
                greeting.style.display = "inline";
                greeting.textContent = userNickname + "님 안녕하세요";
                signUpButton.style.display = "none";
                loginButton.style.display = "none";
                logoutButton.style.display = "inline";
            } else {
                greeting.style.display = "none";
                signUpButton.style.display = "inline";
                loginButton.style.display = "inline";
                logoutButton.style.display = "none";
            }
        }
    </script>


</header>
