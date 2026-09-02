
public class Principal {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //Criando a instância da classe
        Aluno al = new Aluno();
        
        //Exibindo o conteúdo dos atributos
        //onde seus valores foram repassados pelos construtores
        System.out.println("Nome: " + al.nome);
        System.out.println("Idade: " + al.idade);
    }
    
}
