<%-- 
    Document   : permohonan
    Created on : Dec 27, 2022, 11:55:07 AM
    Author     : User
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style-mohon.css">
    </head>
    <body>
        <div class="body">
            <div class="navbar">
                <a class="tittle">Bantuan Terengganu Sejahtera </a>

                <nav>
                    <ul class="items">

                        <li><a href="mohon-kategori.jsp">Utama</a></li>
                        <li><a href="mohon-logkeluar.jsp">Log Keluar</a></li>
                    </ul>
                </nav>
            </div>
            <div class="form-box2">
                <form id="showD" class="input-group" action="mohon-con.jsp">
                    <div class="dtl">
                        <h2>Permohonan</h2><br>
                        <%
                            
                                String noKp = (String) session.getAttribute("noKp");
                                String kid = request.getParameter("kid");
                                Class.forName("com.mysql.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
                                Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp", "root", "");
                                Statement st = con.createStatement();
                                Statement st1 = con1.createStatement();
                                ResultSet rs = st.executeQuery("select * from pemohon where noKp = '" + noKp + "' ");
                                ResultSet rs1 = st1.executeQuery("select * from kategori where kid = '" + kid + "' ");
                                
                                if (rs.next()) {
                                while (rs1.next()){
                            %>
                        <label for="noKp">No Kad Pengenalan:</label><!--Select dari table pemohon-->
                        <input type="text" name="noKp" id="" value="<%=rs.getString("noKp")%>" class="input-field" placeholder="Masukkan No Kad Pengenalan" readonly>
                        <label for="nama">Nama:</label><!--Select dari table pemohon-->
                        <input type="text" name="nama" id="" value="<%=rs.getString("nama")%>" class="input-field" placeholder="Masukkan Nama Penuh" readonly>
                        
                        <label for="ktg" >Kategoteri:</label><!--Select dari table ktg-->
                        <input type="text" name="" id="" value="<%=rs1.getString("ktg")%>" class="input-field" placeholder="Masukkan Ketegori" readonly>
                        <label for="jbtuan" >Jenis Bantuan:</label><!--Select dari table ktg-->
                        <input type="text" name="" value="<%=rs1.getString("jbtuan")%>" class="input-field" readonly="">
                        
                        <input type="hidden" name="kid" value="<%=rs1.getString("kid")%>">
                        
                        <label for="pendapatan" >Pendapatan Penerima:</label>
                        <input type="text" name="pendapatan" id="" value="" class="input-field" placeholder="Masukkan Pendapatan Penerima " required>
                        <label for="alamat" >Alamat:</label>
                        <input type="text" name="alamat" id="" value="" class="input-field" placeholder="Masukkan Alamat" required>
                        <label for="poskod">Poskod:</label>
                        <input type="text" name="poskod" id="" value="" class="input-field" placeholder="Masukkan Poskod Daerah" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" required>
                        <label for="daerah" >Daerah:</label>
                        <input type="text" name="daerah" id="" value="" class="input-field" placeholder="Masukkan Daerah" required>
                        <button name="Mohon" class="submit-btn">Mohon</button>
                        <%}}%>
                    </div>
                </form> 
            </div>
    </body>
</html>
