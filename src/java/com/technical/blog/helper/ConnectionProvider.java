
package com.technical.blog.helper;
import java.sql.*;
public class ConnectionProvider {
    private static Connection con;
    public static Connection getConnecton(){
        try{
            if(con==null){
                Class.forName("com.mysql.cj.jdbc.Driver");
                String user="root";
                String password="Sadam$1234";
                String url="jdbc:mysql://localhost:3306/technicalblog";
                con=DriverManager.getConnection(url,user,password);
            }
        }catch(ClassNotFoundException | SQLException e){
            System.out.print(e);
        }
        return con;
    }
}
