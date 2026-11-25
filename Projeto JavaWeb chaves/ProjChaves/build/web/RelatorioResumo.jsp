<%-- 
    Document   : RelatorioResumo
    Created on : 25 de nov. de 2026, 09:19:25
    Author     : alunocmc
--%>


<%@page import="DAO.RelatorioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Relatório Resumo da Pesquisa</title>
        
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
            
            body {
                font-family: 'Segoe UI', Arial, sans-serif;
                background-color: #f1f1f1;
                padding: 30px 15px;
            }
            .container {
                max-width: 900px;
                margin: auto;
                background-color: #ffffff;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }
            h2 ,h3 {
                text-align: center;
                color: orange;
            }
            .resumo-box {
                background-color: #e0f2f1;
                border-left: 5px solid #009688;
                padding: 15px;
                margin-bottom: 25px;
                font-size: 18px;
                font-weight: bold;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 25px;
            }
            th, td {
                padding: 10px;
                text-align: center;
                border-bottom: 1px solid #ddd;
            }
            th {
                background-color: #009688;
                color: white;
            }
            
            
        </style>
    </head>
    <body>
        
        <header>
            
            <img id="icone" src="Imagens/IconeChaves.jpg" alt="IconeChaves"/>
            
            <h1>A História do Chaves</h1>
            
            
        </header>
        
        <div>
            
            <nav>
                <a id="voltar" href="index.html">Voltar</a>
                
            </nav>
                   
        </div>
        
        
        <div class="container">
            
            <h2>Resumo dos Registros - Vila do Chaves</h2>
            
            <%
                RelatorioDAO rel = new RelatorioDAO();
                int totalEntrevistados = rel.contarEntrevistados();
                

                String[] perguntas = {
                
                    "1. Em que ano a série Chaves chegou ao Brasil?",
                    "2. Onde o Chaves realmente mora?",
                    "3. Quantos meses de aluguel o Seu Madruga deve ao Seu Barriga?",
                    "4. Qual é o apelido que as crianças deram para a Dona Clotilde?",
                    "5. Quem é o filho do Seu Barriga?",
                    "6. O que o Professor Girafales sempre leva para a Dona Florinda?",
                    "7. Qual é o nome da boneca que a Pópis sempre carrega?",
                    "8. Qual personagem tem o hábito de beliscar o Quico?"
                };
                
                String[] colunas = {"R1", "R2", "R3", "R4", "R5", "R6", "R7", "R8"};
            %>
            
            <div class="resumo-box">
                Total de Registros: <%= totalEntrevistados %>
            </div>
            
            <%
                if(totalEntrevistados == 0){
                
            %>
                
            <p>Nenhuma entrevistado cadastrado até o momento!</p>
            
            <%
                }
                else {
                    for (int i = 0; i < perguntas.length; i++){
            %>
              
            <h3><%= perguntas[i]%></h3>
            
            <table>
                
                <thead>
                    <tr>
                        <th>Alternativa</th>
                        <th>Quantidade de Votos</th>
                        <th>Percentual(%)</th>
                    </tr>
                </thead>
                
                <tbody>
                    
                    <%
                        for (int opcao = 1; opcao <= 5; opcao++){
                        
                            int respostas = rel.contarRespostasPorOpçao(colunas[i], opcao);
                            double percentual = ((double)respostas / totalEntrevistados) * 100.0;
                        
                    %>
                    
                    <tr>
                        <td>Opção <%=opcao%></td>
                        <td><%= respostas  %></td>
                        <td><%= String.format("%.1f", percentual)%></td>
                    </tr>
                    
                    <%
                        }
                    %>
                    
                </tbody>
            </table>
                    
                
            
            <%
                    }
                    
                }
            %>
            
            
        </div>        
        
    </body>
</html>
