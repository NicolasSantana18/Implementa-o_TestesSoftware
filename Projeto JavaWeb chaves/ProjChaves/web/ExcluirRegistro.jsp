<%-- 
    Document   : ExcluirRegistro
    Created on : 23 de nov. de 2026, 12:56:11
    Author     : Nicolas
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="DAO.ExcluirDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir Registro</title>
    </head>
    <body>
        
        <%
            String nome = request.getParameter("nome");
            ExcluirDAO ex = new ExcluirDAO();
            
            if(ex.Excluir(nome)== true){
            
                JOptionPane.showMessageDialog(null, "Registro Excluído com Sucesso / Nome do Registro: " +  nome);
            
        %>
        
        <script>
                    window.location.href = "Listar.jsp";
        </script>
        
        
                
        <%        
            }
            
            else {
            
                JOptionPane.showMessageDialog(null, "Não foi possível excluir esse registro");
            
            }
        %>
        
    </body>
</html>
