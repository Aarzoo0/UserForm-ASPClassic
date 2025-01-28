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
        <label for="u_name">Name:</label><br>
        <input type="text" id="u_name" name="u_name" required><br><br>

        <label for="u_email">Email:</label><br>
        <input type="email" id="u_email" name="u_email" required><br><br>

        <label for="u_message">Message:</label><br>
        <textarea id="u_message" name="u_message" rows="4" required></textarea><br><br>

        <input type="submit" value="Submit">
    </form>
</body>
</html>
