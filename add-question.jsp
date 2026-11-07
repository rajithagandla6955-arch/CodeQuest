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
<title>Add Question - CodeQuest</title>

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
    max-width: 650px;
    margin: 35px auto;
    padding: 30px;
    background: #151d35;
    border: 1px solid #334155;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.3);
}

.container h2 {
    text-align: center;
    color: #38bdf8;
    margin-bottom: 10px;
}

.subtitle {
    text-align: center;
    color: #cbd5e1;
    margin-bottom: 30px;
}

label {
    display: block;
    margin: 15px 0 8px;
    color: #e2e8f0;
    font-weight: bold;
}

input, textarea, select {
    width: 100%;
    padding: 12px;
    border: 1px solid #475569;
    border-radius: 7px;
    background: #1e293b;
    color: white;
    font-size: 15px;
    outline: none;
}

input:focus, textarea:focus, select:focus {
    border-color: #38bdf8;
}

textarea {
    min-height: 100px;
    resize: vertical;
}

select option {
    background: #1e293b;
    color: white;
}

button {
    width: 100%;
    margin-top: 25px;
    padding: 14px;
    background: #2563eb;
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
}

button:hover {
    background: #38bdf8;
    color: #0b1020;
}

.back-link {
    display: block;
    text-align: center;
    margin-top: 22px;
    color: #38bdf8;
    text-decoration: none;
}

.back-link:hover {
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
    <h1>⚙️ CODEQUEST ADMIN</h1>
</div>

<div class="container">

    <h2>➕ Add New Question</h2>
    <p class="subtitle">Create a new programming mission for students.</p>

    <form action="AddQuestionServlet" method="post">

        <label>Question Title:</label>
        <input type="text" name="title" placeholder="Enter question title" required>

        <label>Description:</label>
        <textarea name="description" placeholder="Enter question description" required></textarea>

        <label>Category:</label>
        <select name="category">
            <option>Java</option>
            <option>SQL</option>
            <option>DSA</option>
        </select>

        <label>Difficulty:</label>
        <select name="difficulty">
            <option>Easy</option>
            <option>Medium</option>
            <option>Hard</option>
        </select>

        <label>Option A:</label>
        <input type="text" name="optionA" placeholder="Enter option A" required>

        <label>Option B:</label>
        <input type="text" name="optionB" placeholder="Enter option B" required>

        <label>Option C:</label>
        <input type="text" name="optionC" placeholder="Enter option C" required>

        <label>Option D:</label>
        <input type="text" name="optionD" placeholder="Enter option D" required>

        <label>Correct Answer:</label>
        <select name="correctAnswer">
            <option>A</option>
            <option>B</option>
            <option>C</option>
            <option>D</option>
        </select>

        <label>XP Points:</label>
        <input type="number" name="xp" min="1" placeholder="Enter XP points" required>

        <button type="submit">Add Question</button>

    </form>

    <a href="admin-dashboard.jsp" class="back-link">← Back to Dashboard</a>

</div>

<div class="footer">
    CodeQuest - Admin Control Panel
</div>

</body>
</html>