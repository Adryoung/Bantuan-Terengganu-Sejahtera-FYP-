<%-- 
    Document   : index2
    Created on : Dec 29, 2022, 11:33:54 AM
    Author     : User
--%>
<%@page import="connection.db_connection"%>
<%@page import="java.sql.*"%>
<%
    db_connection tc = new db_connection();//panggil java pkage connection
    Statement st = tc.Connection().createStatement();
    ResultSet rs;
%>
<%
//ni untuk Pendaftaran
    if (request.getParameter("daftar") != null) {
        String noKp = request.getParameter("noKp");
        String nama = request.getParameter("nama");
        String ktL = request.getParameter("ktL");
        try {
            int i = st.executeUpdate("insert into pemohon (noKp,nama,ktL,trkDftar)values('" + noKp + "','" + nama + "','" + ktL + "',CURDATE())");
            if (i > 0) {
%>
<script>
    alert("Pendaftaran Berjaya");
    window.location = "mohon-index.html";
</script>
<%
    } else {

    }
} catch (Exception e) {
    request.setAttribute("error", e);
%>
<script>
    alert("Pendaftaran Telah Sedia Ada");
    window.location = "mohon-index.html";
</script>
<%
        }
    }

%>




<%    //ni Untuk Log Masuk
    if (request.getParameter("logmasuk") != null) {
        String noKp = request.getParameter("noKp");
        String ktL = request.getParameter("ktL");

        rs = st.executeQuery("select * from pemohon where noKp= '" + noKp + "' and ktL = '" + ktL + "' ");

        if (rs.next()) {

            session.setAttribute("noKp", noKp);
%>
<script>
    alert("Log Masuk Berjaya");
    window.location = "mohon-semakan1.jsp";
</script>
<%
} else {
%>
<script>
    alert("Maaf, Sila Masukkan Kad Pengenalan dan Kata Laluan Yang betul");
    window.location = "mohon-index.html";
</script>
<%
        }
    }
%>



<%
//ni untuk insert Permohonan
    if (request.getParameter("Mohon") != null) {
        String noKp = request.getParameter("noKp");
        String kid = request.getParameter("kid");
        String pendapatan = request.getParameter("pendapatan");
        String alamat = request.getParameter("alamat");
        String poskod = request.getParameter("poskod");
        String daerah = request.getParameter("daerah");
        //String jbtuan = request.getParameter("jbtuan");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            int i = st.executeUpdate("insert into permohonan (noKp,kid,pendapatan,alamat,poskod,daerah,trkMohon)values('" + noKp + "','" + kid + "','" + pendapatan + "','" + alamat + "','" + poskod + "','" + daerah + "',CURDATE())");
            if (i > 0) {
                response.sendRedirect("mohon-semakan1.jsp");
            } else {
                out.println("Maaf! Sila masukkan maklumat yang tepat...");
            }
        } catch (Exception e) {
            request.setAttribute("error", e);
            out.println(e);
        }
    }

%>


<%//kemaskini permohonan
    if (request.getParameter("update") != null) {

        String pendapatan = request.getParameter("pendapatan");
        String alamat = request.getParameter("alamat");
        String poskod = request.getParameter("poskod");
        String daerah = request.getParameter("daerah");
        String noKp = (String) session.getAttribute("noKp");
        String pid = request.getParameter("pid");

        int i = st.executeUpdate("update permohonan set pendapatan = '" + pendapatan + "',alamat = '" + alamat + "',poskod = '" + poskod + "',daerah = '" + daerah + "' where noKp =  '" + noKp + "' ");
        if (i > 0) {
%>
<script>
    alert("Kemaskini Permohonan Berjaya");
    window.location = "mohon-semakan1.jsp";
</script>    
<%
} else {
%>
<script>
    alert("Permohonan Gagal Dikemaskini");
    window.location = "mohon-semakan1.jsp";
</script>    
<%
        }
    }%>

<%//kemaskini profil
    if (request.getParameter("kemaskini") != null) {
        String Kp = (String) session.getAttribute("noKp");
        String nama = request.getParameter("nama");
        String noKp = request.getParameter("noKp");
        String ktL = request.getParameter("ktL");
        int i = st.executeUpdate("update pemohon set noKp = '" + noKp + "',nama = '" + nama + "',ktL = '" + ktL + "' where noKp = '" + Kp + "'");
        session.setAttribute("noKp", noKp);
        if (i > 0) {
            
%>
<script>
    alert("Kemaskini Data Berjaya");
    window.location = "mohon-profil.jsp";
</script>    
<%
} else {
%>
<script>
    alert("Data Gagal Dikemaskini");
    window.location = "mohon-profil.jsp";
</script>    
<%
        }
    }%>






<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1></h1>
    </body>
</html>
