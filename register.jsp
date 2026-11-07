<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodeQuest - Student Registration</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background: #0b1020;
    color: #ffffff;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

.header {
    background: #151d35;
    padding: 20px;
    text-align: center;
    border-bottom: 2px solid #2563eb;
}

.header h1 {
    color: #38bdf8;
    margin: 0;
    letter-spacing: 2px;
}

.container {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 30px 15px;
}

.register-card {
    background: #151d35;
    width: 100%;
    max-width: 430px;
    padding: 35px;
    border-radius: 15px;
    border: 1px solid #334155;
    box-shadow: 0 8px 25px rgba(0,0,0,0.4);
}

.register-card h2 {
    color: #38bdf8;
    text-align: center;
    margin-top: 0;
}

.subtitle {
    color: #cbd5e1;
    text-align: center;
    margin-bottom: 25px;
}

label {
    display: block;
    color: #ffffff;
    font-weight: bold;
    margin-bottom: 8px;
}

input {
    width: 100%;
    padding: 13px;
    margin-bottom: 18px;
    background: #0b1020;
    color: #ffffff;
    border: 1px solid #475569;
    border-radius: 7px;
    font-size: 15px;
}

input:focus {
    outline: none;
    border-color: #38bdf8;
}

input::placeholder {
    color: #94a3b8;
}

button {
    width: 100%;
    padding: 14px;
    background: #2563eb;
    color: white;
    border: none;
    border-radius: 7px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    margin-top: 8px;
}

button:hover {
    background: #38bdf8;
    color: #0b1020;
}

.error {
    color: #f87171;
    background: #3b1722;
    border: 1px solid #ef4444;
    padding: 10px;
    border-radius: 6px;
    text-align: center;
}

.login-link {
    text-align: center;
    color: #cbd5e1;
    margin-top: 25px;
}

a {
    color: #38bdf8;
    text-decoration: none;
    font-weight: bold;
}

a:hover {
    color: white;
}

.footer {
    background: #151d35;
    color: #94a3b8;
    text-align: center;
    padding: 18px;
}
</style>
</head>

<body>

<div class="header">
    <h1>CODEQUEST</h1>
</div>

<div class="container">

    <div class="register-card">

        <h2>Create Your Account</h2>

        <p class="subtitle">
            Join CodeQuest and start your coding adventure!
        </p>

        <%
        String error = (String) request.getAttribute("error");
        if (error != null) {
        %>
            <p class="error"><%= error %></p>
        <%
        }
        %>

        <form action="register" method="post">

            <label>Username</label>
            <input type="text"
                   name="username"
                   placeholder="Enter your username"
                   required>

            <label>Email Address</label>
            <input type="email"
                   name="email"
                   placeholder="Enter your email"
                   required>

            <label>Password</label>
            <input type="password"
                   name="password"
                   placeholder="Create a password"
                   required>

            <label>Confirm Password</label>
            <input type="password"
                   name="confirmPassword"
                   placeholder="Confirm your password"
                   required>

            <button type="submit">Create Account</button>

        </form>

        <div class="login-link">
            Already have an account?
            <a href="login.jsp">Login Here</a>
        </div>

    </div>

</div>

<div class="footer">
    CodeQuest - Learn Coding Through Gaming
</div>

</body>
</html>