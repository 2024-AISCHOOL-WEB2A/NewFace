<header class="main-header">
    <div class="logo">
        <img src="image/logo.png" alt="New Face Logo">
    </div>
    <nav>
        <ul>
            <li><a href="index.jsp" class="<%= request.getRequestURI().contains("index") ? "active" : "" %>">Home</a></li>
            <li><a href="start_virtual.jsp" class="<%= request.getRequestURI().contains("start_virtual") ? "active" : "" %>">Start Virtual</a></li>
            <li><a href="shorts.jsp" class="<%= request.getRequestURI().contains("shorts") ? "active" : "" %>">Shorts</a></li>
            <li><a href="contest.jsp" class="<%= request.getRequestURI().contains("contest") ? "active" : "" %>">Contest</a></li>
        </ul>
    </nav>
    <div class="sign-in">
        <button id="signUpButton">Sign Up</button>
        <button id="loginButton">Login</button>
        <span id="greeting" style="display: none;">000님 안녕하세요</span>
    </div>
</header>
