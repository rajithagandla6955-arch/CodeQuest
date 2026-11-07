<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>

<%
    if (session.getAttribute("adminId") == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }

    List<HashMap<String, Object>> questions =
        (List<HashMap<String, Object>>) request.getAttribute("questions");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Questions - CodeQuest</title>

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
    margin: 40px auto;
    padding: 20px;
}

.subtitle {
    color: #cbd5e1;
    margin-bottom: 30px;
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
    min-width: 650px;
    border-collapse: collapse;
}

th {
    background: #2563eb;
    color: white;
    padding: 17px;
}

td {
    padding: 16px;
    color: #e2e8f0;
    border-bottom: 1px solid #334155;
}

tr:nth-child(even) {
    background: #1e293b;
}

tr:hover {
    background: #263653;
}

.buttons {
    margin-top: 30px;
}

.btn {
    display: inline-block;
    background: #2563eb;
    color: white;
    text-decoration: none;
    padding: 13px 22px;
    margin: 8px;
    border-radius: 8px;
    font-weight: bold;
}

.btn:hover {
    background: #38bdf8;
    color: #0b1020;
}

.back-btn {
    background: #334155;
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
    <h1>📋 CODEQUEST QUESTIONS</h1>
</div>

<div class="container">

    <h2>All Questions</h2>
    <p class="subtitle">View all programming questions added by the admin.</p>

    <div class="table-box">

        <table>

            <tr>
                <th>Question ID</th>
                <th>Question Title</th>
                <th>Category</th>
                <th>Difficulty</th>
                <th>XP Points</th>
            </tr>

            <%
                if (questions != null && !questions.isEmpty()) {
                    for (HashMap<String, Object> q : questions) {
            %>

            <tr>
                <td><%= q.get("id") %></td>
                <td><%= q.get("title") %></td>
                <td><%= q.get("category") %></td>
                <td><%= q.get("difficulty") %></td>
                <td>⭐ <%= q.get("xp") %></td>
            </tr>

            <%
                    }
                } else {
            %>

            <tr>
                <td colspan="5">No Questions Available</td>
            </tr>

            <%
                }
            %>

        </table>

    </div>

    <div class="buttons">
        <a href="add-question.jsp" class="btn">➕ Add More Questions</a>
        <a href="admin-dashboard.jsp" class="btn back-btn">← Back to Dashboard</a>
    </div>

</div>

<div class="footer">
    CodeQuest - Admin Control Panel
</div>

</body>
</html>