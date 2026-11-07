<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String username = (String) request.getAttribute("username");

    Integer totalXP = (Integer) request.getAttribute("totalXP");
    Integer level = (Integer) request.getAttribute("level");
    Integer completedMissions =
        (Integer) request.getAttribute("completedMissions");
    Integer progress = (Integer) request.getAttribute("progress");

    if (username == null) {
        response.sendRedirect("DashboardServlet");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodeQuest - Dashboard</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #0b1020;
    color: #ffffff;
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
}

.container {
    max-width: 1000px;
    margin: 40px auto;
    padding: 20px;
    text-align: center;
}

.welcome {
    margin-bottom: 30px;
}

.welcome h2 {
    color: #ffffff;
}

.welcome p {
    color: #cbd5e1;
}

.cards {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 20px;
}

.card {
    background: #151d35;
    border: 1px solid #334155;
    border-radius: 12px;
    padding: 25px;
    width: 220px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.3);
}

.card h3 {
    color: #38bdf8;
}

.card p {
    color: #ffffff;
    font-size: 25px;
    font-weight: bold;
}

.progress-box {
    background: #151d35;
    border: 1px solid #334155;
    border-radius: 12px;
    padding: 25px;
    max-width: 600px;
    margin: 30px auto;
}

.progress-box h3 {
    color: #38bdf8;
}

.progress-bar {
    background: #334155;
    height: 18px;
    border-radius: 20px;
    overflow: hidden;
    margin-top: 15px;
}

.progress-fill {
    background: #38bdf8;
    height: 100%;
    width: <%= Math.max(0, Math.min(100, progress)) %>%;
    border-radius: 20px;
}

.buttons {
    margin-top: 35px;
}

.btn {
    display: inline-block;
    background: #2563eb;
    color: white;
    text-decoration: none;
    padding: 14px 25px;
    margin: 10px;
    border-radius: 8px;
    font-weight: bold;
}

.btn:hover {
    background: #38bdf8;
    color: #0b1020;
}

.logout {
    background: #dc2626;
}

.logout:hover {
    background: #ef4444;
    color: white;
}

.footer {
    text-align: center;
    padding: 20px;
    color: #94a3b8;
}
</style>
</head>

<body>

<div class="header">
    <h1>CODEQUEST</h1>
</div>

<div class="container">

    <div class="welcome">
        <h2>Welcome, <%= username %>!</h2>
        <p>Ready to improve your programming skills?</p>
    </div>

    <div class="cards">

        <div class="card">
            <h3>Total XP</h3>
            <p><%= totalXP %></p>
        </div>

        <div class="card">
            <h3>Current Level</h3>
            <p><%= level %></p>
        </div>

        <div class="card">
            <h3>Completed Missions</h3>
            <p><%= completedMissions %></p>
        </div>

    </div>

    <div class="progress-box">
        <h3>Level Progress</h3>
        <p><%= progress %> / 100 XP</p>

        <div class="progress-bar">
            <div class="progress-fill"></div>
        </div>
    </div>

    <div class="buttons">
        <a href="MissionServlet" class="btn">Start Missions</a>

        <a href="leaderboard.jsp" class="btn">Leaderboard</a>

        <a href="logout" class="btn logout">Logout</a>
    </div>

</div>

<div class="footer">
    CodeQuest - Learn Coding Through Gaming
</div>

</body>
</html>