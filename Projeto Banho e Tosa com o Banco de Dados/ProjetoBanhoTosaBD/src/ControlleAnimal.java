
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import javax.swing.JOptionPane;


public class ControlleAnimal {
    
    Animal anim = new Animal();
    
    Connection conexao;
    PreparedStatement instrucaosql;
    Statement comando;
    ResultSet lista;
    
    
     public void Conectar(){
        
        try{
            // definição de variáveis com as informações para conexão
            String usuario="root";
            String senha="";
            String nomebanco="DogOut"; 
            String servidor="localhost:3306";
            String driver="com.mysql.cj.jdbc.Driver";
            // carregando o driver
            Class.forName(driver);
            String url="jdbc:mysql://"+servidor+"/"+nomebanco+"?useTimezone=true&serverTimezone=UTC";
            conexao = DriverManager.getConnection(url,usuario,senha);
            comando=conexao.createStatement();
            
        }
        catch(ClassNotFoundException e){
            JOptionPane.showMessageDialog(null,"Problemas no Driver JDBC");
        }
        catch(Exception e){
            JOptionPane.showMessageDialog(null,"Problemas no acesso ao BD");
        }
        
          
    }
     
     
    
     public void Cadastrar(int cpf, String dono, String animal, String prt, String raca){
         
         anim.setCpf(cpf);
         anim.setDono(dono);
         anim.nome_animal = animal;
         anim.porte = prt;
         anim.raca = raca;
         
         
         try{
             
             instrucaosql = conexao.prepareStatement("Insert Into Animais(CPF, dono, nome_animal, porte, raca) values (?,?,?,?,?)");
             instrucaosql.setInt(1, anim.getCpf());
             instrucaosql.setString(2, anim.getDono());
             instrucaosql.setString(3, anim.nome_animal);
             instrucaosql.setString(4, anim.porte);
             instrucaosql.setString(5, anim.raca);
             int verifica = instrucaosql.executeUpdate();
             
             if (verifica == 1){
             
                 JOptionPane.showMessageDialog(null, "Dados Cadastrados com Sucesso!!");
             
             }
             else{
             
                 JOptionPane.showMessageDialog(null, "Dados Não Cadastrados");
             
             }
                          
         
         }
         
         catch(Exception e){
             
             JOptionPane.showMessageDialog(null,"Problemas no acesso ao BD");
         
         }
     
     
     }
    
}
