
import javax.swing.JOptionPane;


public class Principal {

  
    public static void main(String[] args) {
        Funcionario func = new Funcionario();
        //Entradas através da classe JOptionPane
        func.nome=JOptionPane.showInputDialog("Digite o seu nome: ");
        //convertendo para tipo inteiro
        func.reg=Integer.parseInt(JOptionPane.showInputDialog("Digitre o registro: "));
        //Convertendo para o tipo Real
        func.salbruto=Double.parseDouble(JOptionPane.showInputDialog("Salario bruto: "));
        func.valordesc=Double.parseDouble(JOptionPane.showInputDialog("Desconto: "));
        double salario=func.CalcSalario();
        func.ExibirDados(salario);
    }
    
}
