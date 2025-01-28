<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Form</title>
</head>
<body>
    <h1>Contact Us</h1>
    <form action="submit.asp" method="POST">
        <label for="userName">Name:</label><br>
        <input type="text" id="userName" name="userName" required><br><br>

        <label for="userEmail">Email:</label><br>
        <input type="email" id="userEmail" name="userEmail" required><br><br>

        <label for="userMessage">Message:</label><br>
        <textarea id="userMessage" name="userMessage" rows="4" required></textarea><br><br>

        <input type="submit" value="Submit">
    </form>
</body>
</html>
