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
            
            .acerto { color: #2e7d32; }
            .erro { color: #c62828; }

            .lista-respostas {
                list-style: none;
                padding: 0;
                margin: 20px 0;
            }

            .lista-respostas li {
                padding: 14px 16px;
                margin-bottom: 12px;
                border-radius: 8px;
                border-left: 6px solid #ccc;
                background-color: #f9f9f9;
                line-height: 1.5;
            }

            .lista-respostas li.item-acerto {
                border-left-color: #2e7d32;
                background-color: #e8f5e9;
            }

            .lista-respostas li.item-erro {
                border-left-color: #c62828;
                background-color: #ffebee;
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
                int[] gabarito = {4, 2, 4, 3, 5, 2, 4, 1}; 
                
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

                    String[][] opcoesTexto = {
                        {"1 - 1971", "2 - 1975", "3 - 1978", "4 - 1984", "5 - 1990"},
                        {"1 - Dentro do barril", "2 - Na casa número 8", "3 - Na casa número 71", "4 - Na casa do Seu Barriga", "5 - Na escolinha"},
                        {"1 - 2 meses", "2 - 5 meses", "3 - 10 meses", "4 - 14 meses", "5 - 20 meses"},
                        {"1 - Dona Florinda", "2 - Mestre Linguiça", "3 - Bruxa do 71", "4 - Serafina", "5 - Dona Neves"},
                        {"1 - Quico", "2 - Chaves", "3 - Godínez", "4 - Professor Girafales", "5 - Nhonho"},
                        {"1 - Sanduíches", "2 - Flores", "3 - Bonecas", "4 - Dinheiro", "5 - Brinquedos"},
                        {"1 - Chiquinha", "2 - Clotilde", "3 - Florinda", "4 - Serafina", "5 - Neves"},
                        {"1 - Seu Madruga", "2 - Seu Barriga", "3 - Professor Girafales", "4 - Godínez", "5 - Nhonho"}
                    };

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
                int respUser = respostasUsuario[i];
                int respCerta = gabarito[i];
                String textoMarcado = opcoesTexto[i][respUser - 1];
                String textoCorreto = opcoesTexto[i][respCerta - 1];

                if (respUser == respCerta) {
        %>
                    <li class="item-acerto">
                        <strong><%= perguntas[i] %></strong><br>
                        Sua resposta: <strong><%= textoMarcado %></strong> — <span class="acerto"><strong>✔ Acertou!</strong></span>
                    </li>
        <%
                } else {
        %>
                    <li class="item-erro">
                        <strong><%= perguntas[i] %></strong><br>
                        Sua resposta: <strong><%= textoMarcado %></strong> — <span class="erro"><strong>✘ Errou!</strong></span><br>
                        Resposta correta: <strong><%= textoCorreto %></strong>
                    </li>
        <%
                }
            }
        %>
        </ul>
        
        <%
            } else {
        %>
                <h2 class="erro">Não foi possível cadastrar o registro.</h2>
                
        <%
            }
            
        %>
    </body>
</html>
