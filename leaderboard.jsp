<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="com.codequest.db.DBConnection" %>

<%
if (session.getAttribute("userId") == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodeQuest - Leaderboard</title>

<style>
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #0b1020;
    color: white;
    text-align: center;
}

.header {
    background: #151d35;
    padding: 22px;
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
}

.subtitle {
    color: #cbd5e1;
    margin-bottom: 25px;
}

.table-box {
    overflow-x: auto;
    background: #151d35;
    padding: 15px;
    border: 1px solid #334155;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.3);
}

table {
    width: 100%;
    border-collapse: collapse;
    min-width: 650px;
}

th {
    background: #2563eb;
    color: white;
    padding: 17px 12px;
}

td {
    padding: 16px 12px;
    border-bottom: 1px solid #334155;
    color: #e2e8f0;
}

tr:nth-child(even) {
    background: #1e293b;
}

tr:hover {
    background: #263653;
}

.top1 {
    background: #493c18 !important;
    font-weight: bold;
}

.top2 {
    background: #374151 !important;
    font-weight: bold;
}

.top3 {
    background: #493027 !important;
    font-weight: bold;
}

.back-btn {
    display: inline-block;
    margin-top: 30px;
    padding: 13px 25px;
    background: #2563eb;
    color: white;
    text-decoration: none;
    border-radius: 8px;
    font-weight: bold;
}

.back-btn:hover {
    background: #38bdf8;
    color: #0b1020;
}

.footer {
    margin-top: 35px;
    padding: 20px;
    color: #94a3b8;
}
</style>
</head>

<body>

<div class="header">
    <h1>🏆 CODEQUEST LEADERBOARD</h1>
</div>

<div class="container">

    <h2>Top Coding Players</h2>
    <p class="subtitle">Compete with other students and climb the rankings!</p>

    <div class="table-box">

    <table>

    <tr>
        <th>Rank</th>
        <th>Student Name</th>
        <th>Total XP</th>
        <th>Level</th>
        <th>Completed Missions</th>
    </tr>

    <%
    String sql =
        "SELECT u.id, u.username, u.total_xp, u.player_level, "
        + "COUNT(CASE WHEN ms.is_correct = 1 THEN 1 END) AS completed "
        + "FROM users u "
        + "LEFT JOIN mission_submissions ms ON u.id = ms.user_id "
        + "GROUP BY u.id, u.username, u.total_xp, u.player_level "
        + "ORDER BY u.total_xp DESC, u.username ASC";

    int rank = 1;

    try (Connection con = DBConnection.getConnection()) {

        if (con != null) {

            try (PreparedStatement ps = con.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {

                boolean hasStudents = false;

                while (rs.next()) {
                    hasStudents = true;

                    String rowClass = "";
                    String medal = "";

                    if (rank == 1) {
                        rowClass = "top1";
                        medal = "🥇 ";
                    } else if (rank == 2) {
                        rowClass = "top2";
                        medal = "🥈 ";
                    } else if (rank == 3) {
                        rowClass = "top3";
                        medal = "🥉 ";
                    }
    %>

    <tr class="<%= rowClass %>">
        <td><%= medal %><%= rank %></td>
        <td><%= rs.getString("username") %></td>
        <td><%= rs.getInt("total_xp") %></td>
        <td><%= rs.getInt("player_level") %></td>
        <td><%= rs.getInt("completed") %></td>
    </tr>

    <%
                    rank++;
                }

                if (!hasStudents) {
    %>
    <tr>
        <td colspan="5">No students available in leaderboard.</td>
    </tr>
    <%
                }
            }

        } else {
    %>
    <tr>
        <td colspan="5">Database connection failed!</td>
    </tr>
    <%
        }

    } catch (Exception e) {
    %>
    <tr>
        <td colspan="5">Error: <%= e.getMessage() %></td>
    </tr>
    <%
    }
    %>

    </table>

    </div>

    <a href="DashboardServlet" class="back-btn">← Back to Dashboard</a>

</div>

<div class="footer">
    CodeQuest - Learn Coding Through Gaming
</div>

</body>
</html>