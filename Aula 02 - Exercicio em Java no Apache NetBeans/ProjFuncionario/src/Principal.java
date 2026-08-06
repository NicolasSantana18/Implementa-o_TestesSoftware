
public class Principal {

   
    public static void main(String[] args) {
        //criando a instância da classe Funcionario
        Funcionario func = new Funcionario();
        //definindo valores aos atributos
        func.nome="Alfredo";
        func.reg=1234;
        func.salbruto=5000;
        func.valordesc=500;
        double salario=func.CalcSalario();
        //enviar o salario para o método exibir
        func.ExibirDados(salario);
    }
    
}
