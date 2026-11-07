<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>

<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<HashMap<String, Object>> missions =
        (List<HashMap<String, Object>>) request.getAttribute("missions");

    if (missions == null) {
        response.sendRedirect("MissionServlet");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodeQuest - Missions</title>

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
    max-width: 1100px;
    margin: 35px auto;
    padding: 20px;
    text-align: center;
}

.container h2 {
    color: white;
}

.subtitle {
    color: #cbd5e1;
    margin-bottom: 35px;
}

.mission-list {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 25px;
}

.mission {
    background: #151d35;
    width: 300px;
    padding: 25px;
    border: 1px solid #334155;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.3);
    text-align: left;
    transition: transform 0.2s;
}

.mission:hover {
    transform: translateY(-5px);
    border-color: #38bdf8;
}

.mission h3 {
    color: #38bdf8;
    font-size: 21px;
    margin-top: 0;
}

.description {
    color: #cbd5e1;
    line-height: 1.6;
    min-height: 55px;
}

.details {
    color: #e2e8f0;
    margin: 12px 0;
}

.xp {
    color: #facc15;
    font-weight: bold;
    margin-top: 18px;
}

button {
    width: 100%;
    margin-top: 15px;
    padding: 12px;
    background: #2563eb;
    color: white;
    border: none;
    border-radius: 7px;
    font-weight: bold;
    cursor: pointer;
}

button:hover {
    background: #38bdf8;
    color: #0b1020;
}

.empty {
    background: #151d35;
    padding: 30px;
    border-radius: 12px;
    color: #cbd5e1;
    border: 1px solid #334155;
}

.back-btn {
    display: inline-block;
    margin-top: 35px;
    padding: 13px 25px;
    background: #334155;
    color: white;
    text-decoration: none;
    border-radius: 8px;
}

.back-btn:hover {
    background: #38bdf8;
    color: #0b1020;
}

.footer {
    text-align: center;
    margin-top: 35px;
    padding: 20px;
    color: #94a3b8;
}
</style>
</head>

<body>

<div class="header">
    <h1>🎮 CODEQUEST MISSIONS</h1>
</div>

<div class="container">

    <h2>Choose Your Coding Mission</h2>

    <p class="subtitle">
        Complete programming challenges and earn XP points!
    </p>

    <%
        if (missions.isEmpty()) {
    %>

        <div class="empty">
            <h3>No Missions Available!</h3>
            <p>Please check again later.</p>
        </div>

    <%
        } else {
    %>

    <div class="mission-list">

        <%
            for (HashMap<String, Object> mission : missions) {
        %>

        <div class="mission">

            <h3>🚀 <%= mission.get("title") %></h3>

            <p class="description">
                <%= mission.get("description") %>
            </p>

            <p class="details">
                📚 Category: <%= mission.get("category") %>
            </p>

            <p class="details">
                🎯 Difficulty: <%= mission.get("difficulty") %>
            </p>

            <p class="xp">
                ⭐ XP Reward: <%= mission.get("xp") %>
            </p>

            <form action="startMission" method="get">

                <input type="hidden" name="missionId"
                       value="<%= mission.get("id") %>">

                <button type="submit">Start Mission →</button>

            </form>

        </div>

        <%
            }
        %>

    </div>

    <%
        }
    %>

    <a href="DashboardServlet" class="back-btn">
        ← Back to Dashboard
    </a>

</div>

<div class="footer">
    CodeQuest - Learn Coding Through Gaming
</div>

</body>
</html>