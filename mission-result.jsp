<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Boolean alreadyAttempted =
        (Boolean) request.getAttribute("alreadyAttempted");

    Boolean isCorrect =
        (Boolean) request.getAttribute("isCorrect");

    Integer xpEarned =
        (Integer) request.getAttribute("xpEarned");

    if (alreadyAttempted == null) alreadyAttempted = false;
    if (xpEarned == null) xpEarned = 0;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodeQuest - Mission Result</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
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

.result-card {
    background: #151d35;
    width: 100%;
    max-width: 500px;
    padding: 40px 30px;
    border-radius: 15px;
    border: 1px solid #334155;
    text-align: center;
    box-shadow: 0 8px 25px rgba(0,0,0,0.4);
}

.result-card h2 {
    margin-top: 0;
    font-size: 28px;
}

.result-card p {
    color: #e2e8f0;
    line-height: 1.7;
}

.success {
    color: #4ade80;
}

.failure {
    color: #f87171;
}

.warning {
    color: #fbbf24;
}

.xp {
    color: #facc15;
    font-size: 25px;
    font-weight: bold;
    margin: 20px 0;
}

.buttons {
    margin-top: 30px;
}

.btn {
    display: inline-block;
    background: #2563eb;
    color: white;
    padding: 13px 22px;
    margin: 8px;
    border-radius: 7px;
    text-decoration: none;
    font-weight: bold;
}

.btn:hover {
    background: #38bdf8;
    color: #0b1020;
}

.secondary {
    background: #334155;
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

    <div class="result-card">

        <% if (alreadyAttempted) { %>

            <h2 class="warning">Already Attempted!</h2>

            <p>You have already submitted your answer for this mission.</p>
            <p>Only one attempt is allowed per mission.</p>
            <p>No additional XP awarded.</p>

        <% } else if (isCorrect != null && isCorrect) { %>

            <h2 class="success">Correct Answer!</h2>

            <h2>Congratulations!</h2>

            <p>Great job! You answered correctly.</p>

            <div class="xp">
                +<%= xpEarned %> XP
            </div>

            <p>Keep completing missions to increase your level!</p>

        <% } else if (isCorrect != null) { %>

            <h2 class="failure">Wrong Answer!</h2>

            <p>Your first attempt was incorrect.</p>
            <p>No XP awarded.</p>
            <p>Don't give up. Keep learning!</p>

        <% } else { %>

            <h2 class="warning">Result Not Available</h2>

            <p>Please start a mission first.</p>

        <% } %>

        <div class="buttons">

            <a href="MissionServlet" class="btn">
                Back to Missions
            </a>

            <a href="DashboardServlet" class="btn secondary">
                Go to Dashboard
            </a>

        </div>

    </div>

</div>

<div class="footer">
    CodeQuest - Learn Coding Through Gaming
</div>

</body>
</html>