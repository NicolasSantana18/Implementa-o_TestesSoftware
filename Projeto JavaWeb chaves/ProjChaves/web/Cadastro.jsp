<%-- 
    Document   : Cadastro
    Created on : 22 de nov. de 2026, 11:12:47
    Author     : Nicolas
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="DAO.CadastrarDAO"%>
<%@page import="model.VilaChaves"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrando os dados</title>
    </head>
    <body>
        <%
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            int r1 = Integer.parseInt(request.getParameter("r1"));
            int r2 = Integer.parseInt(request.getParameter("r2"));
            int r3 = Integer.parseInt(request.getParameter("r3"));
            int r4 = Integer.parseInt(request.getParameter("r4"));
            int r5 = Integer.parseInt(request.getParameter("r5"));
            int r6 = Integer.parseInt(request.getParameter("r6"));
            int r7 = Integer.parseInt(request.getParameter("r7"));
            int r8 = Integer.parseInt(request.getParameter("r8"));
            
            VilaChaves vila = new VilaChaves();
            
            vila.setNome(nome);
            vila.setEmail(email);
            vila.setR1(r1);
            vila.setR2(r2);
            vila.setR3(r3);
            vila.setR4(r4);
            vila.setR5(r5);
            vila.setR6(r6);
            vila.setR7(r7);
            vila.setR8(r8);
            
            CadastrarDAO cadast = new CadastrarDAO();
            
            if(cadast.Cadastrar(vila)== true){
                
                JOptionPane.showMessageDialog(null, "Dados Cadastrados com Sucesso!!");
        %>     
            <script>
                    window.location.href = "index.html";
            </script>
             
        <%
            }
            else {
            
                JOptionPane.showMessageDialog(null, "Não foi possível cadastrar o registro");
        %>
            <script>
                    window.location.href = "Cadastro.html";
            </script>
        <%
            }
        %>
    </body>
</html>
