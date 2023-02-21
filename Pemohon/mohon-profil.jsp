<%-- 
    Document   : semua
    Created on : Dec 25, 2022, 10:16:02 AM
    Author     : User
--%>

<%@page import="connection.db_connection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style-mohon.css" >
    </head>
    <body>

        <div class="body">
            <div class="navbar">
                <a class="tittle">Bantuan Terengganu Sejahtera </a>

                <nav>
                    <ul class="items">

                        <li><a href="mohon-semakan1.jsp">Utama</a></li>
                        <li><a href="mohon-profil.jsp">Profil</a></li>
                        <li><a href="mohon-logkeluar.jsp">Log Keluar</a></li>
                    </ul>
                </nav>
            </div>
            <div class="form-box">
                <div class="button-box">
                    <div id="btn"></div>
                    <button class="toggle-btn" type="button" onclick="showD()">Akaun</button>
                    <button class="toggle-btn" type="button" onclick="update()">Kemaskini</button>
                </div>
                <%
                    String noKp = (String) session.getAttribute("noKp");
                    db_connection tc = new db_connection();//panggil java pkage connection
                    Statement st = tc.Connection().createStatement();
                    ResultSet rs = st.executeQuery("select * from pemohon where noKp = '" + noKp + "' ");
                    while (rs.next()) {
                    session.setAttribute(noKp,"noKp");
                %>
                <form id="showD" class="input-group">
                    <div class="dtl-upd">
                        <h2>Maklumat Anda</h2><br>
                        <div class="bord" align="center">

                            <label class="label1">No Kad Pengenalan:<%=rs.getString("noKp")%></label><br>
                            <label class="label1">Nama:<%=rs.getString("nama")%></label><br>

                        </div>
                    </div>
                </form> 

                <form id="update" class="input-group" action="mohon-con.jsp">
                    <div class=dtl-upd>
                        <h2>Kemaskini Maklumat</h2><br>
                        <label for="noKp">No Kad Pengenalan:</label>
                        <input type="text" name="noKp" id="" value="<%=rs.getString("noKp")%>" class="input-field" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                        <label for="nama" class="label">Nama:</label>
                        <input type="text" name="nama" id="" value="<%=rs.getString("nama")%>" class="input-field">
                        <label for="ktL" class="label">Kata Laluan:</label>
                        <input type="password" name="ktL" value="<%=rs.getString("ktL")%>" id="ktL" class="input-field" >
                        <input type="checkbox" onclick="show()"><label class="label">Show Password</label>
                        <button name="kemaskini" class="submit-btn">Kemaskini</button>
                    </div>
                    <%}%>
                </form>
            </div>
            <script>
                //untuk pergerakan
                var x = document.getElementById("showD");
                var y = document.getElementById("update");
                var z = document.getElementById("btn");

                function update() {
                    x.style.left = "-700px";
                    y.style.left = "180px";
                    z.style.left = "210px";
                }
                var x = document.getElementById("showD");
                var y = document.getElementById("update");
                var z = document.getElementById("btn");

                function showD() {
                    x.style.left = "180px";
                    y.style.left = "850px";
                    z.style.left = "0px";

                }
                
                            function show(){//ambik dari onclick
  var x = document.getElementById("ktL"); //ambik dari id
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}
            </script>
    </body>
</html>
