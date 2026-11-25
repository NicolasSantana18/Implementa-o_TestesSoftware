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
 * @author alunocmc
 */
public class RelatorioDAO {
    
    Connection conexao;
    PreparedStatement sql;
    ResultSet lista;
    
    public int contarEntrevistados(){
    
        int total = 0;
        
        try{
          conexao = ConexaoBD.conectar();
          sql = conexao.prepareStatement("Select count(*) as total from barril");
          lista = sql.executeQuery();
            
          if(lista.next()){
              
            total = lista.getInt("total");
          
          }
          
        }
        
        catch(Exception e){
        
            JOptionPane.showMessageDialog(null, "Erro ao contar os entrevistados: " + e);
        
        }
        
        return total;
    
    
    }
    
    
    public int contarRespostasPorOpçao(String colunaPergunta, int opçao){
    
        int quant = 0;
        
        try{
          conexao = ConexaoBD.conectar();
          sql = conexao.prepareStatement("Select count(*) as qtd from barril WHERE " + colunaPergunta + "= ?");
          sql.setInt(1, opçao);
          lista = sql.executeQuery();
            
          if(lista.next()){
              
              quant = lista.getInt("qtd");
          
          }
          
        }
        
        catch(Exception e){
        
            JOptionPane.showMessageDialog(null, "Erro ao contar a opção: " + e);
        
        }
        
        return quant;
    
    
    }
    
}
