/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package conexao;
import java.sql.*;

/**
 *
 * @author Nicolas
 */
public class ConexaoBD {
    
    public static Connection conectar() throws ClassNotFoundException{
    
        Connection conexao = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/vilabd?useUnicode=true&characterEncoding=UTF-8","root","");
            return conexao;
        }
        
        
        catch(SQLException e){
           System.out.println("error: " + e);
        }
        
        return conexao;
    
    
    }
    
}
