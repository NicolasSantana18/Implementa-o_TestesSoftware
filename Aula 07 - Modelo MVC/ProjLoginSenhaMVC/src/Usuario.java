/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author alunocmc
 */
public class Usuario {
    
    
    public String login;
    public int senha;
    
    
    public boolean Logar(){
    
    
        if ((this.login.equals("Antonio"))&& (this.senha == 1234)){
        
            return true;
        }
        else {
        
            return false;
        
        }
    
    
    }
    
    
}
