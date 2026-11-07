<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<%@ page import="com.codequest.db.DBConnection" %>

<%
String username = (String) session.getAttribute("username");

if (username == null) {
    response.sendRedirect("login.jsp");
    return;
}

String email = "";
int totalXP = 0;
int playerLevel = 1;
int completedMissions = 0;

String sql = "SELECT email, total_xp, player_level FROM users WHERE username = ?";

try (Connection con = DBConnection.getConnection()) {

    if (con != null) {

        try (PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, username);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    email = rs.getString("email");
                    totalXP = rs.getInt("total_xp");
                    playerLevel = rs.getInt("player_level");
                }
            }
        }

        String countSQL =
            "SELECT COUNT(DISTINCT mission_id) FROM mission_submissions "
            + "WHERE user_id = (SELECT id FROM users WHERE username = ?) "
            + "AND is_correct = 1";

        try (PreparedStatement ps = con.prepareStatement(countSQL)) {

            ps.setString(1, username);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    completedMissions = rs.getInt(1);
                }
            }
        }
    }

} catch (Exception e) {
    e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodeQuest - My Profile</title>
<link rel="stylesheet" href="css/style.css">

<style>
body {
    font-family: Arial;
    background: #f2f4f8;
    text-align: center;
}

.profile {
    background: white;
    width: 350px;
    margin: 60px auto;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 2px 10px #ccc;
}

h1 {
    color: #333;
}

p {
    font-size: 18px;
    color: #555;
}

button {
    background: #4CAF50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}
</style>
</head>

<body>

<div class="profile">

<h1>My Profile</h1>

<p><b>Username:</b> <%= username %></p>

<p><b>Email:</b> <%= email %></p>

<p><b>Level:</b> <%= playerLevel %></p>

<p><b>Total XP:</b> <%= totalXP %></p>

<p><b>Completed Missions:</b> <%= completedMissions %></p>

<br>

<a href="dashboard.jsp">
    <button>Back to Dashboard</button>
</a>

</div>

</body>
</html>