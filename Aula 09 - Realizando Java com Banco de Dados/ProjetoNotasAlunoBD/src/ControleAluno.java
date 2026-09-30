
import javax.swing.JOptionPane;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;


public class ControleAluno {
    
    Aluno aluno = new Aluno();
    
    Connection conexao;
    PreparedStatement instrucaosql;
    Statement comando;
    ResultSet lista;
    
    public void Conectar(){
        
        try{
            // definição de variáveis com as informações para conexão
            String usuario="root";
            String senha="";
            String nomebanco="notasalunodb"; //o do professor é notasalunobd, o nosso é diferente. Mudar no banco do Mysql e aqui
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
    
    public void cadastrar(int rgm, String nm, double n1, double n2){
        //os dados da interface devem ir para a classe Aluno
        aluno.setRgm(rgm);
        aluno.setNome(nm);
        aluno.setNota1(n1);
        aluno.setNota2(n2);
        
        try{
        
            instrucaosql = conexao.prepareStatement("Insert into alunos (rgm, nome, nota1, nota2) values (?,?,?,?)");
            instrucaosql.setInt(1,aluno.getRgm());
            instrucaosql.setString(2, aluno.getNome());
            instrucaosql.setDouble(3, aluno.getNota1());
            instrucaosql.setDouble(4, aluno.getNota2());
            int verifica = instrucaosql.executeUpdate();
            //enviando a instrução ao Mysql e verificando se houve alteração de registros
            if (verifica == 1){
                // houve alteração na tabela com 1 registro alterado
                JOptionPane.showMessageDialog(null, "Dados Cadastrados no Banco com Sucesso");
            
            }
            else{
                //Se não retornou 1 é porque nenhum dado foi cadastrado
                JOptionPane.showMessageDialog(null, "Dados Não Cadastrados");
            
            }
        }
        catch(Exception e){
            
            JOptionPane.showMessageDialog(null,"Problemas no acesso ao BD");
        
        }
    }
}
