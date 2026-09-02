

/**
 *
 * Este projeto utiliza um construtor e os valores
 * são repassados pela instância da classe
 */
public class Principal {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //na criação da instância da classe, definimos os 
        //valores dos atributos
        
        Aluno aluno = new Aluno("Ana", 18);
        //Exibindo os valores armazenados nos atributos
        System.out.println("Nome: " + aluno.nome);
        System.out.println("Idade: " + aluno.idade);
    }
    
}
