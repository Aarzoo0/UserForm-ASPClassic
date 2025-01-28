<%@ Language="VBScript" %>
<%
    On Error Resume Next  ' Keeps going even if error occurs, useful to catch it later

    Dim conn, rs, u_name, u_email, u_message, dbPath

    ' Get form values
    u_name = Request.Form("u_name")
    u_email = Request.Form("u_email")
    u_message = Request.Form("u_message")

    ' For debugging, you can print out values here
    Response.Write("Name: " & u_name & "<br>")
    Response.Write("Email: " & u_email & "<br>")
    Response.Write("Message: " & u_message & "<br>")

    ' Database connection string (update with correct path to your .accdb file)
    dbPath = "C:\Databases\form.accdb" ' Ensure the path is correct
    Set conn = Server.CreateObject("ADODB.Connection")

    ' Update the connection string to use the ACE provider for .accdb files
    conn.Open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" & dbPath

    ' Insert form data into the database
    Set rs = Server.CreateObject("ADODB.Recordset")
    rs.Open "SELECT * FROM ContactMessages", conn, 1, 3
    rs.AddNew
    rs("u_name") = u_name
    rs("u_email") = u_email
    rs("u_message") = u_message
    rs.Update

    ' Check if any error occurred
    If Err.Number <> 0 Then
        Response.Write("Error: " & Err.Description)
        Err.Clear
    End If

    ' Close the database connection and clean up
    rs.Close
    Set rs = Nothing
    conn.Close
    Set conn = Nothing

    ' Redirect to a thank-you page
    Response.Redirect "thankyou.asp"
%>
