<%-- 
    Document   : permohonan
    Created on : Dec 27, 2022, 11:55:07 AM
    Author     : User
--%>

<%@page import="connection.db_connection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%!
    public String changeStatus(int value) {
        if (value == 0) {
            return "Permohonan Dalam Proses";
        } else if (value == 1) {
            return "Permohonan Lulus";
        } else {
            return "Permohonan Gagal";
        }
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style-admin.css">
        <script type="text/javascript" src="script.js"></script>
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
                        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Carian Kategori" title="Type in a name">
                        <table id="myTable">
                            <thead>
                                <th>Kategori:</th>
                            <th>No Kad Pengenalan:</th>
                            <th>Status:</th>
                            <th>Tarikh Permohonan</th>
                            <th>Lanjutan:</th>
                            <th>Hapus:</th>
                            </thead>
                            <%

                                try {

                                    db_connection tc = new db_connection();//panggil java pkage connection
                                    Statement st = tc.Connection().createStatement();
                                    String ktg = request.getParameter("ktg");
                                    ResultSet rs = st.executeQuery("SELECT * FROM  kategori JOIN permohonan ON kategori.kid= permohonan.kid ");
                                    while (rs.next()) {
                                        String noKp = rs.getString("noKp");

                            %>
                            <tr>
                                <td><%=rs.getString("ktg")%></td>
                                <td><%=rs.getString("noKp")%></td>
                                <td><%=changeStatus(Integer.parseInt(rs.getString("sts")))%></td>
                                <td><%=rs.getString("trkmohon")%></td>
                                <td><a href="admin-laporan2.jsp?noKp=<%=noKp%>">lanjutan</a></td>
                                <td><a href="admin-con.jsp?noKp=<%=noKp%>" onclick="return confirm('adakah anda ingin hapus?');">Hapus</a></td>
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
    </body>
</html>
