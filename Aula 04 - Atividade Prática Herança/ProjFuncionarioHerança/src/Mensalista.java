/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author alunocmc
 */
public class Mensalista extends Funcionario {
        
    public double Sal_bruto;
    public double Desconto;
    
    
    
     public double SalárioLiquid(){
     
         return this.Sal_bruto - this.Desconto;
     
     }
    
        
    
}
