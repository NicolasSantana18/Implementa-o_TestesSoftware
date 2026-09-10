
import javax.swing.JOptionPane;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author alunocmc
 */
public class ControleLogin {
    
    Usuario usuario = new Usuario();
    public static int tentativas;

    
    public void VerifLogin(String log, int sen){
    
        //As informações que vieram por parâmetros,
        //serão armazenados nos atributos
        usuario.login = log;
        usuario.senha = sen;
        //Chama o método logar que retornará true ou false,
        //Retornará true deve chamar a interface FormEmpresa,
        //caso contrário chamar a Interface inicial
        if (usuario.Logar() == true){
            
            new FormEmpresa().setVisible(true);
        
        }
        else{
            
            JOptionPane.showMessageDialog(null, "Usuário / Senha Incorretos");
            
            this.LimiteTentativas();
        
            new FormLoginSenha().setVisible(true);
            
            
        
        }
    
    
    }
    
    public void LimiteTentativas(){
        
        if (usuario.Logar() == false){
        
          tentativas += 1;
          JOptionPane.showMessageDialog(null, "Tentativas Restantes: 3/" + tentativas);
          
          if (tentativas > 3){
          
              JOptionPane.showMessageDialog(null, "Tentativas Encerradas, Até mais!!");
              System.exit(0);
              
          
          }
        
        }
        
    
    
    }
    
}
