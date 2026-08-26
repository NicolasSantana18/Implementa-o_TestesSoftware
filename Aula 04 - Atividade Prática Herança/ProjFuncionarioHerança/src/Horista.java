/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author alunocmc
 */
public class Horista extends Funcionario {
    
    public double numhoras;
    public double valorhora;
    
    
    public double CalcularSalarioHorista(){
        
        return this.numhoras*this.valorhora;
    
    }
}
