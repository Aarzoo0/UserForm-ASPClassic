<%@ Language="VBScript" %>
<%
    On Error Resume Next  ' Continue even if an error occurs

    ' Declare variables
    Dim conn, rs, userName, userEmail, userMessage, dbPath

    ' Get form values from the POST request
    userName = Request.Form("userName")
    userEmail = Request.Form("userEmail")
    userMessage = Request.Form("userMessage")

    ' Debugging - display values (optional for debugging)
    Response.Write("Name: " & userName & "<br>")
    Response.Write("Email: " & userEmail & "<br>")
    Response.Write("Message: " & userMessage & "<br>")

    ' Database connection string (update with the correct path to your .accdb file)
    dbPath = "C:\inetpub\wwwroot\form_db.accdb"  ' Correct file path to your database
    Set conn = Server.CreateObject("ADODB.Connection")

    ' Use ACE provider to open the Access database
    conn.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & dbPath

    ' Insert the form data into the ContactMessages table in the database (do not insert into uid)
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open "SELECT * FROM ContactMessages", conn, 1, 3
    rs.AddNew  ' Add a new record (this will automatically handle the auto-increment for uid)
    rs("userName") = userName  ' Insert the form data
    rs("userEmail") = userEmail
    rs("userMessage") = userMessage
    rs.Update  ' Commit the new record

    ' Check for errors during database operations
    If Err.Number <> 0 Then
        Response.Write("Error: " & Err.Description)
        Err.Clear
    Else
        Response.Write("Data inserted successfully!<br>")
    End If

    ' Close the database connection and cleanup
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing

    ' Redirect to a thank-you page after successful submission
    Response.Redirect "thankyou.asp"
%>
