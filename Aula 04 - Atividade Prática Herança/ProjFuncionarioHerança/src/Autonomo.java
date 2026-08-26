/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Nicolas
 */
public class Autonomo extends Funcionario {
    
    public double totalVendas;
    public double percentVendas;



    public double CalcularSalarioAuto(){
    
        return (this.percentVendas/100)*this.totalVendas;
    }

    
}
