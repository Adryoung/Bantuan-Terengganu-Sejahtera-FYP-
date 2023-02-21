<%-- 
    Document   : semakan
    Created on : Dec 27, 2022, 11:55:56 AM
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

                        <li><a href="mohon-semakan2.jsp">Utama</a></li>
                        <li><a href="mohon-logkeluar.jsp">Log Keluar</a></li>
                    </ul>
                </nav>
            </div>
            <div class="form-box2">
                <form id="showD" class="input-group">
                    <div class="dtl2">
                        <%
                            String noKp = (String) session.getAttribute("noKp");
                            String status = "";
                            db_connection tc = new db_connection();//panggil java pkage connection
                            Statement st = tc.Connection().createStatement();
                            ResultSet rs = st.executeQuery("SELECT * FROM pemohon JOIN permohonan ON pemohon.noKp = permohonan.noKp JOIN kategori ON kategori.kid = permohonan.kid where permohonan.noKp ='" + noKp + "' ");
                            //ResultSet rs1 = st.executeQuery("SELECT * FROM pemohon JOIN permohonan ON pemohon.noKp = permohonan.noKp JOIN kategori ON kategori.kid = permohonan.kid where permohonan.noKp ='" + noKp + "'");
                            if (rs.next()) {
                                String sts = rs.getString("sts");
                                if (sts.equalsIgnoreCase("2")) {
                                    status = "Permohonan Gagal";
                                } else if (sts.equalsIgnoreCase("1")) {
                                    status = "Permohonan Lulus";
                                } else {
                                    status = "Pemohonan dalam proses";
                                }

                        %>
                        <h2>Maklumat Permohonan</h2><br>
                        <table id="customers" >
                            <tr><td><label class="label1">Status Permohonan:</label></td><td><%=status%> </td></tr>
                            <tr><td ><label for="noKp" class="label1">No Kad Pengenalan:</label></td><td> <%=rs.getString("noKp")%></td></tr>
                            <tr><td><label for="nama" class="label1" >Nama:</label></td><td><%=rs.getString("nama")%> </td> </tr>
                            <tr><td><label for="ktg" class="label1" >Kategori:</label></td><td ><%=rs.getString("ktg")%></td></tr>
                            <tr><td><label for="jbtuan" class="label1" >Jenis Bantuan:</label></td><td ><%=rs.getString("jbtuan")%></td></tr>
                            <tr><td><label for="pendapatan" class="label1" >Pendapatan Penerima:</label></td><td><%=rs.getString("pendapatan")%> </td></tr>
                            <tr><td><label for="alamat" class="label1" >Alamat:</label></td><td> <%=rs.getString("alamat")%></td></tr>
                            <tr><td><label for="poskod" class="label1">Poskod:</label></td><td><%=rs.getString("poskod")%> </td></tr>
                            <tr><td><label for="daerah" class="label1" >Daerah:</label></td><td><%=rs.getString("daerah")%> </td></tr>
                        </table>

                    </div>
                        
                </form> 
                        <%} else {
                                response.sendRedirect("mohon-kategori.jsp");
                            }%>
                            <div align="center"><button id="printBtn" style="width: 20em; height: 3em; background-color:skyblue;">CETAK</button></div>
                    </div>
               
            </div>
                     
    </body>
</html>
<script type="text/javascript">

  document.getElementById('printBtn').addEventListener('click', () => { window.print()});
  
  
  // Prints area to which class was assigned only

</script>