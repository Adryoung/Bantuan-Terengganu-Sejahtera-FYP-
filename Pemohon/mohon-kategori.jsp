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
        <link rel="stylesheet" href="style-mohon.css">
    </head>
    <body>
        <div class="body">
            <div class="navbar">
                <a class="tittle">Bantuan Terengganu Sejahtera </a>

                <nav>
                    <ul class="items">
                        <li><a href="mohon-logkeluar.jsp">Log Keluar</a></li>
                    </ul>
                </nav>
            </div>
            <div class="">
                <form id="showD" class="input-group">
                    <div class="dtl-upd">

                        <table class="table">
                            <thead>
                            <th>Kategori:</th>
                            <th>Permohonan</th>
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
                                <td><a href="mohon-borang.jsp?kid=<%=kid%>">Mohon</a></td>
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
