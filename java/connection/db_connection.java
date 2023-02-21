/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package connection;

import java.sql.*;

/**
 *
 * @author User
 */
public class db_connection {
    public Connection Connection()
    {
        Connection connection;
        try {
            // below two lines are used for connectivity.
            
            //Class.forName("com.mysql.jdbc.Driver");
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/fyp","root", "");
 
            return connection;
        }
        catch (SQLException | ClassNotFoundException e) {
            return null;
        }
    } // function ends
   
}