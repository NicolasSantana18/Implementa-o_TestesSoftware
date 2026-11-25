<%-- 
    Document   : Listar
    Created on : 23 de nov. de 2026, 10:43:27
    Author     : Nicolas
--%>

<%@page import="conexao.ConexaoBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registros Cadastrados</title>
        
        <style>
            
            * {
                margin: 0;
                padding: 0;
            }
            
            header {
  
            background-color: #0066cc;
            background: linear-gradient(
                90deg,
                #003380 0%,    /* Azul profundo na esquerda */
                #0066cc 50%,   /* Azul royal no centro */
                #1e90ff 100%   /* Azul celeste na direita */
            );

            color: #ffffff;
            padding: 20px;
            padding-left: 30px;
            
            display: flex;
            flex-direction: row;
            align-items: center;
            
            }
            
            #icone {
               width: 130px;
               height: 130px;
               border-radius: 50%;
            }
            
            h1{
                flex: 1;
                text-align: center;
                margin: 0;
                padding-right: 5em;
                color: orange;
                font-family: "Arial";
            }
            
            nav {
                margin-top: 0px;
                text-align: center;
                margin-right: 30px;
                background-color: orange;
                padding-top: 16px;
                padding-bottom: 16px;
                margin-right: 20em;
                margin-left: 20em;
                border-radius: 0px 10px 20px 20px;
                margin-bottom: 20px;
            }
            
             a {
                
                padding-left: 30px;
                padding-right: 30px;
                text-decoration: none;
                border: 2px solid black;
                border-radius: 30px;
                margin-top: 30px;
                color: black;
                background-color: greenyellow;
                font-family: "Arial";
                transition: blue 0.2s ease;
            }
            
            a:hover{
                color: blue;
            }
            
            a:active {
                color: chartreuse;
                background-color: #003380;
            }
            
            #voltar{
                margin-right: 60px;
                padding-top: 6px;
                padding-bottom: 6px;
                font-weight: bold;
            }
            
            #relatorio{
                margin-left: 60px;
                padding-top: 6px;
                padding-bottom: 6px;
                font-weight: bold;
            }
            
            ﻿html, body, div, table, th, td, h1, a{
                box-sizing: border-box;
                font-family: 'Segoe UI', Arial, sans-serif;
            }
            
            

            body {
                background-color: #f1f1f1;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 1000px;
                margin: auto;
                background-color: #ffffff;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                overflow-x: auto; /* Evita que a tabela quebre em telas menores */
            }

            .chaves {
                text-align: center;
                color: #009688;
                margin-top: 0;
                font-weight: 400;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                padding: 12px 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            thead tr {
                background-color: #009688;
                color: #ffffff;
            }

            tbody tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            tbody tr:hover {
                background-color: #e9e9e9;
            }

            .btn {
                display: inline-block;
                padding: 6px 12px;
                color: #ffffff;
                text-decoration: none;
                border-radius: 4px;
                font-size: 13px;
                transition: opacity 0.2s;
                cursor: pointer;
            }

            .btn:hover {
                opacity: 0.85;
                color: blue;
                
            }
            
            .btn:active {
                color: chartreuse;
                background-color: #003380;
            }

            .btn-editar {
                background-color: #2196F3;
                padding: 10px 15px 10px 15px;
                margin-right: 15px;
                margin-left: 10px;
                font-weight: bold;
            }

            .btn-excluir {
                background-color: #f44336;
                padding: 10px 15px 10px 15px;
                font-weight: bold;
            }
        </style>
        
    </head>
    <body>
        
        <%
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
        %>
        
        <header>
            
            <img id="icone" src="Imagens/IconeChaves.jpg" alt="IconeChaves"/>
            
            <h1 id="chaves">A História do Chaves</h1>
            
            
        </header>
        
        <div>
            
            <nav>
                <a id="voltar" href="index.html">Voltar</a>
                <a id="relatorio" href="RelatorioResumo.jsp">Relatório</a>
            </nav>
                   
        </div>
        
        <div class="container">
            
            <h1 class="w3-center w3-text-teal">Registros</h1>
            
            <table class="w3-table w3-striped w3-bordered w3-hoverable w3-white">
                
                <thead>
                        
                    <tr class="w3-teal">
                        <th>Nome</th>
                        <th>Email</th>
                        <th>R1</th>
                        <th>R2</th>
                        <th>R3</th>
                        <th>R4</th>
                        <th>R5</th>
                        <th>R6</th>
                        <th>R7</th>
                        <th>R8</th>
                    </tr>
                </thead>
                
                <tbody>
                    <%
                        
                    try{
                        PreparedStatement sql;
                        Connection conexao;
                        ResultSet lista;
                        
                        conexao = ConexaoBD.conectar();
                        sql = conexao.prepareStatement("select * from barril");
                        lista = sql.executeQuery();
                        
                        while (lista.next()){
                        
                          String nome = lista.getString("nome");
                          String email = lista.getString("email");
                          int re1 = lista.getInt("R1");
                          int re2 = lista.getInt("R2");
                          int re3 = lista.getInt("R3");
                          int re4 = lista.getInt("R4");
                          int re5 = lista.getInt("R5");
                          int re6 = lista.getInt("R6");
                          int re7 = lista.getInt("R7");
                          int re8 = lista.getInt("R8");
                        
                    %>
                    
                    <tr>
                        <td><%= nome %></td> 
                        <td><%= email %></td>
                        <td><%= re1 %></td>
                        <td><%= re2 %></td>
                        <td><%= re3 %></td>
                        <td><%= re4 %></td>
                        <td><%= re5 %></td>
                        <td><%= re6 %></td>
                        <td><%= re7 %></td>
                        <td><%= re8 %></td>
                        <td>
                            <a href="EditarRegistro.jsp?nome=<%= nome %>" class="btn btn-editar">Editar</a>
                            <a href="ExcluirRegistro.jsp?nome=<%= nome %>" class="btn btn-excluir">Excluir</a>
                        </td>
                    </tr>
                    
                    <%
                        }
                        
                        } catch(Exception e){

                            out.println("<tr><td colspan='6'>Erro: "+ e.getMessage()+ "</td></tr>");
                        }
                     %>
                        
                    
                    
                </tbody>
                
            </table>
            
        </div>
        
    </body>
</html>
