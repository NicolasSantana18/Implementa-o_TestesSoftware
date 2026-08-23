/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Nicolas
 */
public class Sal_liquid {
    public String nome_func;
    public String cargo;
    public double Sal_bruto;
    public int faltas;
    
    
    
    public double DescontoIR(){
    
        if (this.Sal_bruto > 10000.0){
            
            return this.Sal_bruto * 0.275;
        
        } else if (this.Sal_bruto >= 5000.0) {
            
            return this.Sal_bruto * 0.12;
            
        } else {
            return 0.0;
        }
    
    }
    
    
    public double DescontoINSS(){
        
        return this.Sal_bruto * 0.05;
        
    }
    
    
    
    public double DescontoFaltas(){
        
        double desconto = (this.Sal_bruto/30/8) * this.faltas;
        
        return desconto;
    
    }
    
    
    
    public double Exibir_SalLiquido(){
    
        double Sal_liquido = this.Sal_bruto - this.DescontoIR() - this.DescontoINSS() - this.DescontoFaltas();
        
                
        return Sal_liquido;
    
    }
}
