
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
            comando =conexao.createStatement();
            
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
     
     
     
     
    public String Consultar(int cpf){
        String registro = "";
     
        try{
            
            instrucaosql = conexao.prepareStatement("Select * From Animais Where CPF =" + cpf);
            lista = instrucaosql.executeQuery();
            
            if (lista.next()){
            
                registro = lista.getString("dono") + ";" +
                        lista.getString("nome_animal") + ";" +
                        lista.getString("porte") + ";" +
                        lista.getString("raca");
            
            }
            
            else{
            
                JOptionPane.showMessageDialog(null, "Registro Não encontrado");
            
            }
        
        }
     
        catch(Exception e){
            
            JOptionPane.showMessageDialog(null,"Problemas no acesso ao BD");
     
        }
        
       return registro;
     
    }
    
    
    
    public void Alterar(int cpf, String dono, String animal, String prt, String raca){
    
        try{
            instrucaosql = conexao.prepareStatement("update Animais set dono='"+dono+"',nome_animal='"+animal+"',porte='"+prt+"',raca='"+raca+"'where CPF="+cpf);
            int verifica = instrucaosql.executeUpdate();
            
            if (verifica == 1){
            
                JOptionPane.showMessageDialog(null, "Dados Alterados com Sucesso!!");
            
            }
            
            else {
                JOptionPane.showMessageDialog(null, "Dados Não querem ser Alterados");
            
            }
        }
        
        catch(Exception e){
        
            JOptionPane.showMessageDialog(null,"Problemas no acesso ao Banco de Dados");
        
        }
    
    }
    
    
    public void Excluir(int cpf){
    
        try{
            instrucaosql = conexao.prepareStatement("delete from Animais Where CPF="+cpf);
            int verifica = instrucaosql.executeUpdate();
            
            if (verifica == 1){
            
                JOptionPane.showMessageDialog(null, "Registro Excluído com Sucesso!!");
            }
            
            else{
            
                JOptionPane.showMessageDialog(null, "Remoção de Registro Sem Sucesso!!");
            
            }
        }
        
        catch(Exception e){
        
            JOptionPane.showMessageDialog(null,"Problemas no acesso ao BD");
        
        }
    
    
    }
    
    
    public void listarTodos(){
    
        try{
            instrucaosql = conexao.prepareStatement("Select * From Animais");
            lista = instrucaosql.executeQuery();
            
            while(lista.next()){
            
                System.out.println("CPF: "+ lista.getString("CPF"));
                System.out.println("Dono: "+ lista.getString("dono"));
                System.out.println("Nome do Animal: "+ lista.getString("nome_animal"));
                System.out.println("Porte: "+ lista.getString("porte"));
                System.out.println("Raca: "+ lista.getString("raca"));
                System.out.println();
                
            
            }
        
        }
        
        catch(Exception e){
        
            JOptionPane.showMessageDialog(null,"Problemas no acesso ao BD");
        }
    
    }
    
    
    public void listarPorte(String prt){
    
        try{
            instrucaosql = conexao.prepareStatement("Select * From Animais Where porte='"+ prt + "'");
            lista = instrucaosql.executeQuery();
            
            while(lista.next()){
            
                System.out.println("CPF: "+ lista.getString("CPF"));
                System.out.println("Dono: "+ lista.getString("dono"));
                System.out.println("Nome do Animal: "+ lista.getString("nome_animal"));
                System.out.println("Porte: "+ lista.getString("porte"));
                System.out.println("Raca: "+ lista.getString("raca"));
                System.out.println();
            
            }
        
        }
        
        catch(Exception e){
        
            JOptionPane.showMessageDialog(null,"Problemas no acesso ao BD");
        }
    
    }
    
    
    public void listarRaca(String raca){
    
        try{
            instrucaosql = conexao.prepareStatement("Select * From Animais Where raca='"+ raca +"'");
            lista = instrucaosql.executeQuery();
          
            while(lista.next()){
            
                System.out.println("CPF: "+ lista.getString("CPF"));
                System.out.println("Dono: "+ lista.getString("dono"));
                System.out.println("Nome do Animal: "+ lista.getString("nome_animal"));
                System.out.println("Porte: "+ lista.getString("porte"));
                System.out.println("Raca: "+ lista.getString("raca"));
                System.out.println();
                
            
            }
        
        }
        
        catch(Exception e){
        
            JOptionPane.showMessageDialog(null,"Problemas no acesso ao BD");
        }
    
    }
    
    
    
    public double CalcularValor(String prt){
        
        
        if ("Pequeno".equals(prt) || "pequeno".equals(prt)){
        
            return 35.0;
        
        }
        
        else if ("Médio".equals(prt) || "médio".equals(prt) || "medio".equals(prt)){
        
            return 50.0;
        }
        
        else {
        
            return 75.0;
        
        }
    
    
    
    }
}
