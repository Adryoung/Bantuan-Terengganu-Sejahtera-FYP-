<%-- 
    Document   : semakan
    Created on : Dec 27, 2022, 11:55:56 AM
    Author     : User
--%>

<%@page import="connection.db_connection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script type="text/javascript" src="script.js"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style-admin.css" >
    </head>
    <body>

        <div class="body">
            <div class="navbar">
                <a class="tittle">Bantuan Terengganu Sejahtera </a>

                <nav>
                    <ul class="items">

                        <li><a href="admin-status1.jsp">Utama</a></li>
                        <li><a href="admin-laporan1.jsp">Laporan</a></li>
                        <li><a href="admin-kategori.jsp">Senarai Kategori</a></li>
                        <li><a href="admin-profil.jsp">Profil</a></li>
                        <li><a href="admin-logkeluar.jsp">Log Keluar</a></li>
                    </ul>
                </nav>
            </div>
            <div class="">
                <form id="showD" class="input-group">

                    <div class="dtl">
                        <%/*
                                
                                                            try {

                                                                db_connection tc = new db_connection();//panggil java pkage connection
                                Statement st = tc.Connection().createStatement();
                                                                String ktg = request.getParameter("ktg");
                                                                ResultSet rs = st.executeQuery("select * from kategori");
                                                                while (rs.next()) {
                             */%>

                        <!--div class="radio">
                            <label><%//=rs.getString("ktg")%></label><input type="radio" name="ktg" value="<%//=rs.getString("ktg")%>" onkeyup="myFunction()" id="myInput">
                            
                        <%
                            /*}
                                } catch (Exception e) {
                                    request.setAttribute("error", e);
                                    out.println(e);
                                }
                                
                             */%>
                        <button name="cari" class="submit-btn">Cari</button>
                    </div-->
                        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Carian Kategori" title="Type in a name">

                        <table id="myTable">
                            <thead>
                            <th>Kategoteri:</th>
                            <th>No Kad Pengenalan:</th>
                            <th>Pendapatan Penerima:</th>
                            <th>Kemaskini</th>
                            </thead>
                            <%

                                try {

                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
                                    Statement st = con.createStatement();
                                    String ktg = request.getParameter("ktg");
                                    ResultSet rs = st.executeQuery("select * from kategori JOIN permohonan ON kategori.kid=permohonan.kid where permohonan.sts = 0");
                                    while (rs.next()) {
                                        String pid = rs.getString("pid");

                            %>
                            <tr>
                                <td><%=rs.getString("ktg")%></td>
                                <td><%=rs.getString("noKp")%></td>
                                <td><%=rs.getString("pendapatan")%></td>
                                <td><a href="admin-status2.jsp?pid=<%=pid%>">Lanjutan</a></td>
                            </tr>

                            <%}
                                } catch (Exception e) {
                                    request.setAttribute("error", e);
                                    out.println(e);
                                }

                            %>
                        </table>


                    </div>
                </form> 
            </div>
        </div>
    </body>
</html>
<script>

</script>