/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;
import conexao.ConexaoBD;
import java.sql.*;
import javax.swing.JOptionPane;

/**
 *
 * @author Nicolas
 */
public class EditarDAO {
    
    Connection conexao;
    PreparedStatement sql;
    
    public void Editar(String nm, String nomeAntigo , String email, int r1, int r2, int r3, int r4, int r5, int r6, int r7, int r8 ){
        
        try{
            conexao = ConexaoBD.conectar();
            sql = conexao.prepareStatement("update barril set nome = ?, email=?,R1=?,R2=?,R3=?,R4=?, R5 = ?, R6 = ?, R7 = ?, R8 = ?  where nome=?");
            sql.setString(1, nm);
            sql.setString(2, email);
            sql.setInt(3, r1);
            sql.setInt(4, r2);
            sql.setInt(5, r3);
            sql.setInt(6, r4);
            sql.setInt(7, r5);
            sql.setInt(8, r6);
            sql.setInt(9, r7);
            sql.setInt(10, r8);
            sql.setString(11, nomeAntigo);
            int verifica = sql.executeUpdate();
            
            if(verifica > 0){
            
                JOptionPane.showMessageDialog(null,"Dados Alterados com Sucesso !!");
            
            }
            else {
            
                
                JOptionPane.showMessageDialog(null,"Não foi possível realizar a alteração !!");
            
            }
        
        
        }
        
        catch(Exception e){
        
            JOptionPane.showMessageDialog(null,"erro: "+ e);
        
        }
    
    }
    
}
