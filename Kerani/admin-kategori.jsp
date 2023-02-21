<%-- 
    Document   : permohonan
    Created on : Dec 27, 2022, 11:55:07 AM
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
        <link rel="stylesheet" href="style-admin.css">
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
                <form id="showD" class="input-group" action="admin-con.jsp">
                    <div class="dtl">
                        <div class="bord1" align="center">
                            <label class="label">Kategori</label>
                            <input type="text" name="ktg" id="ktg" class="input-field" required>
                            <label class="label">Jenis Bantuan</label>
                            <input type="text" name="jbtuan" id="jbtuan" class="input-field" required>

                        </div>
                        <button name="tambah" class="submit-btn">Tambah</button>
                        <br>
                        <br>
                        <div>
                            <table>
                                <thead>
                                <th>Kategori:</th>
                                <th>Jenis Bantuan:</th>
                                <th>Hapus:</th>
                                </thead>
                                <%

                                    try {

                                        db_connection tc = new db_connection();//panggil java pkage connection
                                        Statement st = tc.Connection().createStatement();
                                        String ktg = request.getParameter("ktg");
                                        ResultSet rs = st.executeQuery("select * from kategori ");
                                        while (rs.next()) {
                                            String kid = rs.getString("kid");


                                %>
                                <tr>
                                    <td><%=rs.getString("ktg")%></td>
                                    <td><%=rs.getString("jbtuan")%></td>
                                    <td><a href="admin-con.jsp?kid=<%=kid%>">Hapus</a></td>
                                </tr>
                                <%}
                                    } catch (Exception e) {
                                        request.setAttribute("error", e);
                                        out.println(e);
                                    }

                                %>
                            </table>
                        </div>
                    </div>
                </form> 
            </div>
    </body>
</html>
