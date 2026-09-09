/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author alunocmc
 */
public class Paciente {
    
    
    public String nome;
    public int ano_nascimento;
    private double valor_Consulta;
    private String profissao;

    
    
    
    
    public int CalcularIdade(){
    
        return 2026 - this.ano_nascimento;
    
    }
    
    
     public double CalcularValorConsulta(int idade){
    
        double valor;
        if (idade < 50){
        
            valor = this.valor_Consulta;
        
        } 
        else{
            if (idade<= 70){
            
                valor = this.valor_Consulta - this.valor_Consulta * 0.10;
            
            }
            else{
                
                valor = this.valor_Consulta - this.valor_Consulta * 0.20;
                
            }
        
        }
        
        
        return valor;
    
    
    }
    
    

    
    public double getValor_Consulta() {
        return valor_Consulta;
    }

    
    public void setValor_Consulta(double valor_Consulta) {
        this.valor_Consulta = valor_Consulta;
    }

    
    public String getProfissao() {
        return profissao;
    }

    
    public void setProfissao(String profissao) {
        this.profissao = profissao;
    }
    
    
   
    
    
}
