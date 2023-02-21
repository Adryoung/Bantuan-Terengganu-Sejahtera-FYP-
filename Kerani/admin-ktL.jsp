<%-- 
    Document   : passU
    Created on : Dec 1, 2022, 11:04:09 PM
    Author     : User
--%>

<%@page import="connection.db_connection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    db_connection tc = new db_connection();//panggil java pkage connection
    Statement st = tc.Connection().createStatement();
%>

<%
    if (request.getParameter("kemaskini") != null) {

        try{
        String noKp = request.getParameter ("noKp");
        String ktL = request.getParameter("ktL");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
        PreparedStatement pst;
        ResultSet rs;
        pst = con.prepareStatement("update kerani set ktL = ? where noKp = ? ");        
        pst.setString(1,ktL);
        pst.setString(2,noKp);
        int i = pst.executeUpdate();

if (i > 0){%>
<script>
    alert("Kata Laluan Anda Berjaya Ditukar!");
    window.location="admin-index.html";
</script>
<%} else{%>
<script>
    alert("Maaf, Kata Laluan Gagal Ditukar!");
</script>
<%
}}catch (Exception e){
request.setAttribute ("error",e);
out.println (e);
}} 
%>
<style>
  input
  {
      width: 300px;
      height: 50px;
  }
  .table td{
      padding: 12px 20px 12px 40px;
  }
  
 input[type=submit]{
      background-color: skyblue;
  }
</style>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>passU Page</title>
        <link rel="stylesheet" href="style-admin.css">
    </head>
    <body>
        <div class="body" align="center">
        <div class="navbar">
                <a class="tittle">Bantuan Terengganu Sejahtera </a>

                <nav>
                    <ul class="items">
                        <li><a href="admin-index.html">Kembali</a></li>
                    </ul>
                </nav>
            </div>
        <form>
            <table class="table" id="" style="height:30px;">
                <thead>
                <th>No Kad Pengenalan</th>
                <th><input type="text" name="noKp" id="noKp">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button name="cari" class="" style="width:100px; height: 50px;">Cari</button></th>
            </thead>
            </table>
            
        </form>
            
            <br><br>
        <form action="" method="post">

            <table class="table" align="center">
                <%
                    try {
                        ResultSet rs;
                        String noKp = request.getParameter("noKp");
                        rs = st.executeQuery("select * from kerani where noKp = '" + noKp + "'   ");
                        while (rs.next()) {
                %>
                <thead><th>Tukar Kata Laluan</th></thead>
            <tr><td>Nama:<%=rs.getString("nama")%></td></tr>
            <tr><td>No Kad Pengenalan:<%=rs.getString("noKp")%></td></tr>
            <tr><td>Tukar Kata Laluan</td></tr><tr>
                    <td><input type="password" name="ktL" id="ktL" value=""></td></tr>
                <tr><td><input type="submit" name="kemaskini" id="submit"></td></tr>
                 <%}
                        } catch (Exception e) {
                            request.setAttribute("error", e);
                        out.println(e);
                    }%>

            </table>
            <div></div>

        </form>
    </div>
    </body>
</html>
