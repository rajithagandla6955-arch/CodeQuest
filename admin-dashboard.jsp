<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
if (session.getAttribute("adminId") == null) {
    response.sendRedirect("admin-login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard - CodeQuest</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #0b1020;
    color: white;
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
    max-width: 950px;
    margin: 50px auto;
    padding: 20px;
    text-align: center;
}

.welcome h2 {
    color: white;
    font-size: 28px;
}

.welcome p {
    color: #cbd5e1;
    margin-bottom: 40px;
}

.cards {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 25px;
}

.card {
    background: #151d35;
    border: 1px solid #334155;
    border-radius: 12px;
    padding: 30px;
    width: 260px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.3);
}

.card h3 {
    color: #38bdf8;
    margin-bottom: 15px;
}

.card p {
    color: #cbd5e1;
    line-height: 1.6;
}

.btn {
    display: inline-block;
    background: #2563eb;
    color: white;
    text-decoration: none;
    padding: 12px 22px;
    margin-top: 12px;
    border-radius: 7px;
    font-weight: bold;
}

.btn:hover {
    background: #38bdf8;
    color: #0b1020;
}

.home-btn {
    background: #334155;
}

.logout {
    display: inline-block;
    margin-top: 35px;
    background: #dc2626;
    color: white;
    text-decoration: none;
    padding: 13px 28px;
    border-radius: 8px;
    font-weight: bold;
}

.logout:hover {
    background: #ef4444;
}

.footer {
    text-align: center;
    padding: 25px;
    color: #94a3b8;
}
</style>
</head>

<body>

<div class="header">
    <h1>⚙️ CODEQUEST ADMIN</h1>
</div>

<div class="container">

    <div class="welcome">
        <h2>Welcome to Admin Dashboard</h2>
        <p>Manage questions and control your CodeQuest learning platform.</p>
    </div>

    <div class="cards">

        <div class="card">
            <h3>➕ Add Questions</h3>
            <p>Create new programming questions and add missions for students.</p>
            <a href="add-question.jsp" class="btn">Add Questions</a>
        </div>

        <div class="card">
            <h3>📋 View Questions</h3>
            <p>View and manage all the questions available in CodeQuest.</p>
            <a href="ViewQuestionsServlet" class="btn">View Questions</a>
        </div>

        <div class="card">
            <h3>🏠 Home Page</h3>
            <p>Return to the main CodeQuest website.</p>
            <a href="index.html" class="btn home-btn">Go to Home</a>
        </div>

    </div>

    <a href="AdminLogoutServlet" class="logout">Logout</a>

</div>

<div class="footer">
    CodeQuest - Admin Control Panel
</div>

</body>
</html>