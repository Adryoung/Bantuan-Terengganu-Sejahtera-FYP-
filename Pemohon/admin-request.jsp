<%-- 
    Document   : admi-request
    Created on : Jan 22, 2023, 3:56:00 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <link rel="stylesheet" href="style-index.css">
    </head>
    <style>

        
        input{
            borde: 1 px solid black;
            border-radius: 15px;
            width: 500px;
            height: 32px;
            font-size: 15px;
        }
        
    </style>
    <body>
        <h1></h1>
        
        <form>
            <div class="nav">
                <a class="a">Bantuan Terengganu Sejahtera</a>
                <a class="a" href="home.html">Halaman Utama</a>
                <a class="a" href="admin-request.jsp">Staff</a>
                <a class="a" href="mohon-index.html">Permohonan</a>
                <div class="animation start-home"></div>
            </div>
            
            <div class="note1" align="center">
            <div class="bord">
                <table align="center">
                    <tr><td><label>Masukkan Kata Kunci</label></td></tr>
                    <tr><td><input type="password" name="pass" class="input-field"></td></tr>
                    <tr><td><input type="submit" value="Pergi" name="a"></td></tr>
                </table>
            </div>
            </div>
        </form>


        <%
            if (request.getParameter("a") != null) {
                String i = request.getParameter("pass");
                //String j = "abc";
                if (i.equals("BTS11")) {
                    response.sendRedirect("http://localhost:8083/PROJEK/BTS/Kerani/admin-index.html");
                } else {
                    response.sendRedirect("admin-request.jsp");
                }
            }
        %>
    </body>
</html>
