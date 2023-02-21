<%-- 
    Document   : semakan
    Created on : Dec 27, 2022, 11:55:56 AM
    Author     : User
--%>
<%@page import="connection.db_connection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%//kemaskini permohonan
    db_connection tc = new db_connection();//panggil java pkage connection
    Statement st = tc.Connection().createStatement();
%>

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

                        <li><a href="mohon-semakan1.jsp">Utama</a></li>
                        <li><a href="mohon-profil.jsp">Profil</a></li>
                        <li><a href="mohon-logkeluar.jsp">Log Keluar</a></li>
                    </ul>
                </nav>
            </div>
            <div class="form-box2">
                <div class="button-box">

                    <div id="btn"></div>
                    <button class="toggle-btn" type="button" onclick="showD()">Akaun</button>
                    <button class="toggle-btn" type="button" onclick="update()">Kemaskini</button>
                </div>

                <form id="showD" class="input-group">
                    <div class="dtl2">
                        <%
                           
                            
                            String status = "";
                            String noKp = (String) session.getAttribute("noKp");
                            ResultSet rs = st.executeQuery("SELECT * FROM pemohon  JOIN permohonan ON pemohon.noKp = permohonan.noKp JOIN kategori ON kategori.kid = permohonan.kid where permohonan.noKp ='" + noKp + "' and permohonan.sts = 0 ");
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
                        <table id="customers">
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


                <form id="update" class="input-group" action="mohon-con.jsp">

                    <div class="dtl2">
                        <h2>Kemaskini Maklumat</h2><br>
                        <label for="noKp">No Kad Pengenalan:</label>
                        <input type="text" name="noKp" id="" value="<%=rs.getString("noKp")%>" class="input-field" placeholder="Masukkan No Kad Pengenalan" disabled="">
                        <label for="nama">Nama:</label>
                        <input type="text" name="nama" id="" value="<%=rs.getString("nama")%>" class="input-field" placeholder="Masukkan Nama Penuh" disabled="">
                        <label for="ktg" >Kategori:</label>
                        <input type="text" name="ktg" id="" value="<%=rs.getString("ktg")%>" class="input-field" placeholder="Masukkan Ketegori" disabled="">

                        <label for="pendapatan" >Pendapatan Penerima:</label>
                        <input type="text" name="pendapatan" id="" value="<%=rs.getString("pendapatan")%>" class="input-field" placeholder="Masukkan Pendapatan Penerima " >
                        <label for="alamat" >Alamat:</label>
                        <input type="text" name="alamat" id="" value="<%=rs.getString("alamat")%>" class="input-field" placeholder="Masukkan Alamat" >
                        <label for="poskod">Poskod:</label>
                        <input type="text" name="poskod" id="" value="<%=rs.getString("poskod")%>" class="input-field" placeholder="Masukkan Poskod Daerah" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" >
                        <label for="daerah" >Daerah:</label>
                        <input type="text" name="daerah" id="" value="<%=rs.getString("daerah")%>" class="input-field" placeholder="Masukkan Daerah" >
                        <button name="update" class="submit-btn">Kemaskini</button>


                        <%} else {
                                response.sendRedirect("mohon-semakan2.jsp");
                            }%>
                    </div>
                </form>
            </div>
            <script>
                //untuk pergerakan
                var x = document.getElementById("showD");
                var y = document.getElementById("update");
                var z = document.getElementById("btn");

                function update() {
                    x.style.left = "-700px";
                    y.style.left = "180px";
                    z.style.left = "210px";
                }
                var x = document.getElementById("showD");
                var y = document.getElementById("update");
                var z = document.getElementById("btn");

                function showD() {
                    x.style.left = "180px";
                    y.style.left = "850px";
                    z.style.left = "0px";

                }
            </script>
    </body>
</html>
