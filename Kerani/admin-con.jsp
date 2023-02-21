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
%>

<%
//ni untuk Pendaftaran
    if (request.getParameter("daftar") != null) {
        String noKp = request.getParameter("noKp");
        String nama = request.getParameter("nama");
        String ktL = request.getParameter("ktL");

        try {
            int i = st.executeUpdate("insert into kerani (noKp,nama,ktL,trkDftar)values('" + noKp + "','" + nama + "','" + ktL + "',CURDATE())");
            if (i > 0) {
%>
<script>
    alert("Pendaftaran berjaya");
    window.location = "admin-index.html";
</script>
<%
    } else {

    }
} catch (Exception e) {
    request.setAttribute("error", e);
%>
<script>
    alert("Pendafataran telah Sedia Ada");
    window.location = "admin-index.html";
</script>
<%
        }
    };

%>



<%    //ni Untuk Log Masuk
    if (request.getParameter("logmasuk") != null) {
        String noKp = request.getParameter("noKp");
        String ktL = request.getParameter("ktL");
        ResultSet rs;
        rs = st.executeQuery("select * from kerani where noKp= '" + noKp + "' and ktL = '" + ktL + "' ");

        if (rs.next()) {
            session.setAttribute("noKp", rs.getString("noKp"));
            %>
            <script>
                alert("log masuk berjaya");
                window.location="admin-status1.jsp";
            </script>
<%

        } else {
            %>
            <script>
                alert("Sila Masukkan Maklumat Yang Betul");
                window.location="admin-index.html";
            </script>
            <%
        }
    };
%>



<%
//ni untuk masukan kategori
    if (request.getParameter("tambah") != null) {
        String ktg = request.getParameter("ktg");
        String jbtuan = request.getParameter("jbtuan");

        try {
            int i = st.executeUpdate("insert into kategori (ktg,jbtuan)values('" + ktg + "','" + jbtuan + "')");
            if (i > 0) {
                response.sendRedirect("admin-kategori.jsp");
            } else {
                out.println("Maaf! Sila masukkan maklumat yang tepat");
            }
        } catch (Exception e) {
            request.setAttribute("error", e);
            out.println(e);
        }
    }

%>



<%//kemaskini profil
    if (request.getParameter("kemaskini") != null) {
String Kp = (String) session.getAttribute("noKp");
        String nama = request.getParameter("nama");
        String noKp = request.getParameter("noKp");
        String ktL = request.getParameter("ktL");
        ResultSet rs;
        int i = st.executeUpdate("update kerani set noKp = '" + noKp + "',nama ='" + nama + "', ktL = '" + ktL + "'  where noKp = '" + Kp + "'");
        session.setAttribute("noKp", noKp);
        if (i > 0) {

            response.sendRedirect("admin-profil.jsp");
        } else {
            response.sendRedirect("admin-profil.jsp");
        }
    }%>



<%// delete maklumat laporan

    String noKp = request.getParameter("noKp");
    {
        int i = st.executeUpdate("delete from permohonan where noKp ='" + noKp + "'");
        if (i > 0) {
            response.sendRedirect("admin-laporan1.jsp");
        } else {
%>
<script>
    alert("data gagal dipadam")
    :
            window.location = "admin-laporan1.jsp";
</script>
<%
        }
    }
%>



<%// delete maklumat kategori
    String kid = request.getParameter("kid");
    int i = st.executeUpdate("delete from kategori where kid ='" + kid + "'");
    if (i > 0) {
        response.sendRedirect("admin-kategori.jsp");
    } else { %><script>
        alert("data gagal dipadam");
        window.location = "admin-kategori.jsp";
</script><%}%>



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
