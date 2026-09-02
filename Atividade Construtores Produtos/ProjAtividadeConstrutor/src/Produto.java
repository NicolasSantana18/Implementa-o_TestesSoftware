/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author alunocmc
 */
public class Produto {
    public String descricao;
    public Double valorCompra;
    public Double valorVenda;
    public int quantidadeEstoque;
    public int quantidadeVendas;
    
    
    
    
    public Produto(){
    
        this( 10, 40.0, 50.0);
    
    }
    
    
    public Produto(int quant, Double valorCompra, Double valorVenda){
        
        this.quantidadeEstoque = quant;
        this.valorCompra = valorCompra;
        
        
        this.valorVenda = valorCompra * 1.5;
    
    }
    
    
    public void Vender(int quantidadeVendas){
    
        if (quantidadeVendas <= quantidadeEstoque){
            this.quantidadeEstoque -= quantidadeVendas;
            
            System.out.println("Venda Realizada com Sucesso");
        } else {
        
            System.out.println("Quantidade Inválida");
            
        }
        
    }
    
    
}
