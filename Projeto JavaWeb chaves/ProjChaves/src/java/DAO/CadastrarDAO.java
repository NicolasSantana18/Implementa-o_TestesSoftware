/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import conexao.ConexaoBD;
import java.sql.*;
import model.VilaChaves;

/**
 *
 * @author Nicolas
 */
public class CadastrarDAO {
        Statement executar;
        PreparedStatement sql;
        Connection conexao;
        ResultSet lista;
        
        
        public boolean Cadastrar(VilaChaves v) throws ClassNotFoundException, SQLException{
        
            try{  
                conexao=ConexaoBD.conectar();
                sql=conexao.prepareStatement("Insert into barril (nome,email,R1,R2,R3,R4,R5,R6,R7,R8) values (?,?,?,?,?,?,?,?,?,?)");
                sql.setString(1, v.getNome());
                sql.setString(2, v.getEmail());
                sql.setInt(3, v.getR1());
                sql.setInt(4, v.getR2());
                sql.setInt(5, v.getR3());
                sql.setInt(6, v.getR4());
                sql.setInt(7, v.getR5());
                sql.setInt(8, v.getR6());
                sql.setInt(9, v.getR7());
                sql.setInt(10, v.getR8());
                sql.executeUpdate();
                return true;
              }
            
            catch(SQLException e){
            
                System.out.println("Erro: "+e);
                return false;
            }
        
        
        }
}
