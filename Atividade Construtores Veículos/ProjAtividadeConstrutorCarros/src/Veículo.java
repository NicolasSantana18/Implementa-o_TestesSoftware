/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author alunocmc
 */
public class Veículo {
    public String marca;
    public String modelo;
    public int ano;
    public Double valor;
    
    
    
    
    public Veículo(){
    
        this("Porsche", "Porsche 911", 2026, 15000.0);
    
    
    }
    
    
    
    
    public Veículo(String marca, String modelo, int ano, Double valor){
    
        this.marca = marca;
        this.modelo = modelo;
        this.ano = ano;
        this.valor = valor;
    
    }
    
    
    
}
