<%-- 
    Document   : lanjutan
    Created on : Jan 3, 2023, 12:39:03 AM
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
        <form>
            <center>
            <h1 class="tittle">Maklumat Permohonan Bantuan</h1>
            <div>
                <table>
                    <%

                        try {

                            db_connection tc = new db_connection();//panggil java pkage connection
                            Statement st = tc.Connection().createStatement();
                            String noKp = request.getParameter("noKp");
                            String status = "";
                            ResultSet rs = st.executeQuery("SELECT * FROM pemohon JOIN permohonan ON pemohon.noKp = permohonan.noKp "
                            + "JOIN kategori ON kategori.kid = permohonan.kid where pemohon.noKp = '" + noKp + "' ");
                            while (rs.next()) {
                                String sts = rs.getString("sts");
                                if (sts.equalsIgnoreCase("2")) {
                                    status = "Permohonan Gagal";
                                } else if (sts.equalsIgnoreCase("1")) {
                                    status = "Permohonan Lulus";
                                } else {
                                    status = "Pemohonan dalam proses";
                                }
                    %>
                    <thead>
                    <th>Maklumat Pemohon</th>
                    </thead>
                    <tr><td>Nama:<%=rs.getString("nama")%></td></tr>
                    <tr><td>No Kad Pengenalan:<%=rs.getString("noKp")%></td></tr>
                    <tr><td>Pendapatan:<%=rs.getString("pendapatan")%></td></tr>
                    <tr><td>Alamat:<%=rs.getString("alamat")%></td></tr><!-- comment -->
                    <tr><td>Poskod:<%=rs.getString("poskod")%></td></tr>
                    <tr><td>Daerah:<%=rs.getString("daerah")%></td></tr>
                    <tr><td>Tarikh Permohonan:<%=rs.getString("trkmohon")%></td></tr>

                </table>

                <table>
                    <thead>
                    <th>Maklumat Bantuan</th>
                    </thead>
                    <tr><td>Kategori:<%=rs.getString("ktg")%></td></tr>
                    <tr><td>Jenis Bantuan:<%=rs.getString("jbtuan")%></td></tr>
                    <tr><td>Status Permohonan:<%=status%></td></tr>
                    <%}
                        } catch (Exception e) {
                            request.setAttribute("error", e);
                            out.println(e);
                        }

                    %>
                </table>
            </div>
                
            <div><a href="admin-laporan1.jsp">KEMBALI</a></div>
            </center>
        </form>
                <div align="center"><button id="printBtn">CETAK</button></div>
    </body>
</html>
<script type="text/javascript">

  document.getElementById('printBtn').addEventListener('click', () => { window.print()});
  
  
  // Prints area to which class was assigned only

</script>