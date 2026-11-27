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
        
        <style>
            * {
                box-sizing: border-box;
                font-family: 'Segoe UI', Arial, sans-serif;
            }

            body {
                margin: 0;
                padding: 30px 15px;
                background-color: #f1f1f1;
                color: #333;
                line-height: 1.6;
                font-family: Arial, sans-serif;
            }
            
            header {
                background: linear-gradient(90deg, #003380 0%, #0066cc 50%, #1e90ff 100%);
                color: #ffffff;
                padding: 20px 30px;
                display: flex;
                align-items: center;
            }

            #icone {
                width: 130px;
                height: 130px;
                border-radius: 50%;
            }

            h1 {
                flex: 1;
                text-align: center;
                padding-right: 130px; /* Compensa os 130px do #icone para centralizar o título */
                color: orange;
            }

            /* Centraliza o menu e o conteúdo principal sem precisar de 20em */
            nav, main {
                max-width: 750px;
                margin: 0 auto;
            }

            nav {
                background-color: orange;
                padding: 16px;
                border-radius: 0 10px 20px 20px;
                display: flex;
                justify-content: center;
                gap: 40px;
            }

            nav a {
                padding: 6px 30px;
                text-decoration: none;
                border: 2px solid black;
                border-radius: 30px;
                color: black;
                background-color: greenyellow;
                font-weight: bold;
                transition: 0.2s ease;
            }

            nav a:hover {
                color: blue;
            }

            nav a:active {
                color: chartreuse;
                background-color: #003380;
            }

            #voltar {
                margin-right: 60px;
            }

            h2 {
                text-align: center;
                color: #009688;
                font-size: 26px;
                margin-bottom: 20px;
            }

            p {
                max-width: 700px;
                margin: 10px auto;
                background-color: #e0f2f1;
                border-left: 5px solid #009688;
                padding: 12px 18px;
                border-radius: 6px;
                font-size: 18px;
            }

            ul {
                list-style: none;
                padding: 0;
                max-width: 700px;
                margin: 25px auto;
            }

            li {
                background-color: #ffffff;
                padding: 14px 18px;
                margin-bottom: 10px;
                border-radius: 8px;
                border: 1px solid #ddd;
                box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
                font-size: 16px;
                font-weight: 500;
            }

            
    </style>
    </head>
    <body>
        
        <header>
            
            <img id="icone" src="Imagens/IconeChaves.jpg" alt="IconeChaves"/>
            
            <h1>Cadastro e Resultado do Quiz</h1>
            
            
        </header>
        
        <div>
            
            <nav>
                <a id="voltar" href="index.html">Voltar</a>
            </nav>
                   
        </div>
        
        
        <%
            request.setCharacterEncoding("UTF-8");
            
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
            
            if (cadast.Cadastrar(vila) == true) {
                int[] respostasUsuario = {r1, r2, r3, r4, r5, r6, r7, r8};
                
                // Ajuste os números abaixo (1 a 5) conforme as opções corretas do seu Cadastro.html
                int[] gabarito = {4, 2, 3, 1, 5, 2, 4, 1}; 

                int acertos = 0;
                int erros = 0;

                for (int i = 0; i < 8; i++) {
                    if (respostasUsuario[i] == gabarito[i]) {
                        acertos++;
                    } else {
                        erros++;
                    }
                }
        %>   
        <h2>Dados Cadastrados com Sucesso, <%= nome %>!</h2>
        <p><strong>Acertos:</strong> <%= acertos %> de 8</p>
        <p><strong>Erros:</strong> <%= erros %> de 8</p>

        <ul>
        <%
            for (int i = 0; i < 8; i++) {
                if (respostasUsuario[i] == gabarito[i]) {
        %>
                    <li style="color: green;">Pergunta <%= (i + 1) %>: Acertou (Opção <%= respostasUsuario[i] %>)</li>
        <%
                } else {
        %>
                    <li style="color: red;">Pergunta <%= (i + 1) %>: Errou (Você marcou <%= respostasUsuario[i] %> | Correta: <%= gabarito[i] %>)</li>
        <%
                }
            }
        %>
            </ul>
            <a href="index.html">Voltar ao Início</a>
        <%
            } else {
        %>
            <p>Não foi possível cadastrar o registro.</p>
        <%
            }
        %>
            
    </body>
</html>
