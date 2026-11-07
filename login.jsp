<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodeQuest - Student Login</title>

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
    padding: 22px;
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

.login-card {
    background: #151d35;
    width: 100%;
    max-width: 420px;
    padding: 35px;
    border-radius: 15px;
    border: 1px solid #334155;
    box-shadow: 0 8px 25px rgba(0,0,0,0.4);
}

.login-card h2 {
    color: #38bdf8;
    text-align: center;
    margin-top: 0;
    margin-bottom: 10px;
}

.subtitle {
    color: #cbd5e1;
    text-align: center;
    margin-bottom: 30px;
}

label {
    display: block;
    color: #ffffff;
    margin-bottom: 8px;
    font-weight: bold;
}

input {
    width: 100%;
    padding: 13px;
    margin-bottom: 22px;
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
    color: #ffffff;
    border: none;
    border-radius: 7px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
}

button:hover {
    background: #38bdf8;
    color: #0b1020;
}

.register {
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
    color: #ffffff;
}

.home {
    text-align: center;
    margin-top: 20px;
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

    <div class="login-card">

        <h2>Student Login</h2>

        <p class="subtitle">
            Welcome back! Continue your coding journey.
        </p>

        <form action="login" method="post">

            <label>Username or Email</label>
            <input type="text" name="username"
                placeholder="Enter username or email" required>

            <label>Password</label>
            <input type="password" name="password"
                placeholder="Enter your password" required>

            <button type="submit">Login</button>

        </form>

        <div class="register">
            Don't have an account?
            <a href="register.jsp">Register here</a>
        </div>

        <div class="home">
            <a href="index.html">← Back to Home</a>
        </div>

    </div>

</div>

<div class="footer">
    CodeQuest - Learn Coding Through Gaming
</div>

</body>
</html>