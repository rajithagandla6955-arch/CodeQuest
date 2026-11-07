<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodeQuest - Mission Question</title>

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
    display: flex;
    justify-content: center;
    padding: 40px 15px;
}

.question-card {
    background: #151d35;
    width: 100%;
    max-width: 650px;
    padding: 35px;
    border-radius: 15px;
    border: 1px solid #334155;
    box-shadow: 0 8px 25px rgba(0,0,0,0.4);
}

.question-card h2 {
    color: #38bdf8;
    margin-top: 0;
    text-align: center;
}

.description {
    color: #ffffff;
    font-size: 17px;
    line-height: 1.6;
    margin: 25px 0;
}

.option {
    display: flex;
    align-items: center;
    text-align: left;
    background: #0b1020;
    border: 1px solid #334155;
    padding: 15px;
    margin: 12px 0;
    border-radius: 8px;
    color: #ffffff;
    cursor: pointer;
}

.option:hover {
    border-color: #38bdf8;
    background: #1e293b;
}

.option input {
    margin-right: 12px;
    accent-color: #38bdf8;
    width: 18px;
    height: 18px;
    cursor: pointer;
}

.option span {
    color: #ffffff;
    font-size: 15px;
}

button {
    width: 100%;
    padding: 15px;
    margin-top: 25px;
    background: #2563eb;
    color: #ffffff;
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

    <div class="question-card">

        <h2><%= request.getAttribute("title") %></h2>

        <p class="description">
            <%= request.getAttribute("description") %>
        </p>

        <form action="submitAnswer" method="post">

            <input type="hidden" name="missionId"
            value="<%= request.getAttribute("missionId") %>">

            <label class="option">
                <input type="radio" name="answer" value="A" required>
                <span>A. <%= request.getAttribute("optionA") %></span>
            </label>

            <label class="option">
                <input type="radio" name="answer" value="B">
                <span>B. <%= request.getAttribute("optionB") %></span>
            </label>

            <label class="option">
                <input type="radio" name="answer" value="C">
                <span>C. <%= request.getAttribute("optionC") %></span>
            </label>

            <label class="option">
                <input type="radio" name="answer" value="D">
                <span>D. <%= request.getAttribute("optionD") %></span>
            </label>

            <button type="submit">Submit Answer</button>

        </form>

    </div>

</div>

<div class="footer">
    CodeQuest - Learn Coding Through Gaming
</div>

</body>
</html>