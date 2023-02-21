<%-- 
    Document   : detailA
    Created on : Dec 1, 2022, 9:53:12 PM
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

<%
    if (request.getParameter("submit") != null) {

        try {
            String sts = request.getParameter("sts");
            String pid = request.getParameter("pid");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
            PreparedStatement pst;
            ResultSet rs;
            pst = con.prepareStatement("update permohonan set sts = ? where pid = ? ");
            pst.setString(1, sts);
            pst.setString(2, pid);
            int i = pst.executeUpdate();

            if (i > 0) {%>
<script>
    alert("Kemasukan Status Berjaya");
</script>
<%} else {%>
<script>
    alert("Maaf Kemasukan Status Gagal");
</script>
<%
            }
        } catch (Exception e) {
            request.setAttribute("error", e);
            out.println(e);
        }
    }
%>

<style>


</style>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <link rel="stylesheet" href="k2.css">
    </head>
    <body>
        <form action="#" method="post">
            <div><h1>Maklumat Pemohon Bantuan Terengganu Sejahtera</h1></div>
            <table border="2" bordercolor=""   cellspacing="1px" cellpadding="9px"
                   style="background-color:whitesmoke;  width:auto; height: auto; color: black; " >
                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
                        Statement st = con.createStatement();
                        ResultSet rs;
                        String pid = request.getParameter("pid");
                        rs = st.executeQuery("select * from pemohon JOIN permohonan ON pemohon.noKp = permohonan.noKp JOIN kategori ON kategori.kid = permohonan.kid where permohonan.pid = '" + pid + "'   ");
                        while (rs.next()) {
                %>
                <tr><td>Tarikh Permohonan</td><td><%=rs.getString("trkMohon")%></td></tr>
                <tr><td>Nama:</td><td><%=rs.getString("nama")%></td></tr>
                <tr><td>No Kad Pengenalan:</td><td><%=rs.getString("noKp")%></td></tr>
                <tr><td>Kategori:</td><td><%=rs.getString("ktg")%></td></tr>
                <tr><td>Pendapatan Penerima</td><td><%=rs.getString("pendapatan")%></td></tr><tr>
                <tr><td>Alamat:</td><td><%=rs.getString("alamat")%></td></tr></tr>
                <tr><td>Poskod :</td><td><%=rs.getString("poskod")%></td></tr></tr>
                <tr><td>Daerah:</td><td><%=rs.getString("daerah")%></td></tr></tr>
                <tr><td>Status:</td>
                    <td>
                        <select name="sts">
                            <option><%=changeStatus(Integer.parseInt(rs.getString("sts")))%></option>
                            <option value="1">Lulus</option>
                            <option value="2">Gagal</option>
                        </select>
                    </td></tr>
                    <%}
                        } catch (Exception e) {
                            request.setAttribute("error", e);
                            out.println(e);
                        }%>
            </table>
                        <div><input type="submit" name="submit" value="Kemaskini" style="width: 150px; background-color: #267C73; border-radius: 5px; padding: 14px 20px; margin: 8px 0; margin-left: 1em;border: 1px solid;cursor: pointer; color: white;" ></div>
                        <div><a href="admin-status1.jsp">KEMBALI</a></div>
        </form>
    </body>
</html>

