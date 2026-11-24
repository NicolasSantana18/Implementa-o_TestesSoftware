<%-- 
    Document   : EditarRegistro
    Created on : 23 de nov. de 2026, 14:06:34
    Author     : Nicolas
--%>

<%@page import="conexao.ConexaoBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Registro</title>
        
        <style>
            
            html, body, div, table, p, th, td, h1, h2, a{
                box-sizing: border-box;
                font-family: 'Segoe UI', Arial, sans-serif;
            }
            
            p {
                font-weight: bold;
            }
            
            
            h2 {
                
                text-align: center;
            }
            
            
            
            body {
                
                margin-top: 30px;
                margin-bottom: 40px;
                padding: 20px;
                display: flex;
                flex-direction: column;
                align-items: center;
                border-radius: 10px;
                background-color: greenyellow;
            }
            
            form {
                width: 30%;
                margin-top: 20px;
                border: 2px solid black;
                padding: 30px 20px 20px 30px;
                background-color: white;
                line-height: 1.6;
                border-radius: 20px;
            }
            
            a {
                margin-top: 20px;
                padding: 6px 30px;
                text-decoration: none;
                border: 2px solid black;
                border-radius: 30px;
                color: black;
                background-color: #2196F3;
                font-weight: bold;
                transition: 0.2s ease;
            }

            a:hover {
                color: blue;
            }

            a:active {
                color: chartreuse;
                background-color: #003380;
            }
            
            button {
                display: block;
                margin: 25px auto 0 auto;
                width: 160px;
                height: 40px;
                background-color: #0066cc;
                color: white;
                font-weight: bold;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            
            button:hover {
                opacity: 0.85;
                color: blue;
                
            }
            
            button:active {
                color: chartreuse;
                background-color: #003380;
            }
            
            input[type="text"] {
                width: 70%;
            }
            
            
        </style>
    </head>
    <body>
        <%
            String nome = request.getParameter("nome");
            String email="";
            int re1=0,re2=0,re3=0,re4=0, re5 = 0, re6 = 0, re7 = 0, re8 = 0;
            
            try{
                PreparedStatement sql;
                ResultSet lista;
                Connection conexao;
                
                conexao = ConexaoBD.conectar();
                sql = conexao.prepareStatement("Select * from barril where nome = ?");
                sql.setString(1, nome);
                lista = sql.executeQuery();
                 if (lista.next()){
                    email = lista.getString("email");
                    re1 = lista.getInt("R1");
                    re2 = lista.getInt("R2");
                    re3 = lista.getInt("R3");
                    re4 = lista.getInt("R4");
                    re5 = lista.getInt("R5");
                    re6 = lista.getInt("R6");
                    re7 = lista.getInt("R7");
                    re8 = lista.getInt("R8");
                } 
            }
            catch(Exception e){
                out.println("erro" + e);
            }
            
            
        %>
        
        <form method="post" action="SalvarEdicao.jsp">
            <h2>Editar Registro</h2>
            <p> Nome: <input type="text" name="nome" value=<%= nome%>><p>
            Email: <input type="text" name="email" value=<%= email%>><p>
            Resposta 1: <input type="text" name="r1" value=<%= re1%>><p>
            Resposta 2: <input type="text" name="r2" value=<%= re2%>><p>
            Resposta 3: <input type="text" name="r3" value=<%= re3%>><p>
            Resposta 4: <input type="text" name="r4" value=<%= re4%>><p>
            Resposta 5: <input type="text" name="r5" value=<%= re5%>><p>
            Resposta 6: <input type="text" name="r6" value=<%= re6%>><p>
            Resposta 7: <input type="text" name="r7" value=<%= re7%>><p>
            Resposta 8: <input type="text" name="r8" value=<%= re8%>><p>   
                <button type="submit" >SALVAR ALTERAÇÕES</button><p>
        
        </form>
                
                <a href="index.html">Voltar</a>
    </body>
</html>
