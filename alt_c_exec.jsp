<%-- 
    Document   : cliente
    Created on : 14/09/2023, 20:15:24
    Author     : alunos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.*" import="java.lang.*"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Controle de Clientes</title>
         <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 20px;
            text-align: center;
        }

        h1 {
            color: #333;
        }

        form {
            max-width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        p {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        input[type="reset"],
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-right: 10px;
        }

        input[type="reset"]:hover,
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
    </head>
    <body>
        <h1>Clientes</h1>
        <%            
            // Recebendo dados
            String id = request.getParameter("ident");
            String nome = request.getParameter("nome");
            String rg = request.getParameter("rg");
            String cpf = request.getParameter("cpf");
            String email = request.getParameter("email");
            String telefone = request.getParameter("telefone");
            String celular = request.getParameter("celular");
            String cep = request.getParameter("cep");
            String endereco = request.getParameter("Endereco");
            String complemento = request.getParameter("complemento");
            String bairro = request.getParameter("bairro");
            String cidade = request.getParameter("Cidade");
            String estado = request.getParameter("estado");
            String uf = request.getParameter("uf");
            String cnh = request.getParameter("Cnh");
            
            //Alterar
            try {
                Class.forName("com.mysql.jdbc.Driver"); // registra            
                Connection conexao = DriverManager.getConnection("jdbc:mysql://127.0.0.1/bdaluguel", "usuariocurso", "123"); // abre Conn
                
                String sql = "UPDATE tb_clientes SET nome=?, rg=?, cpf=?, email=?, telefone=?, celular=?, cep=?, endereco=?, complemento=?, bairro=?, cidade=?, estado=?, cnh=? WHERE id=?";
                
                PreparedStatement pstmt = conexao.prepareStatement(sql);
                pstmt.setString(1, nome);
                pstmt.setString(2, rg);
                pstmt.setString(3, cpf);
                pstmt.setString(4, email);
                pstmt.setString(5, telefone);
                pstmt.setString(6, celular);
                pstmt.setString(7, cep);
                pstmt.setString(8, endereco);
                pstmt.setString(9, complemento);
                pstmt.setString(10, bairro);
                pstmt.setString(11, cidade);
                pstmt.setString(12, estado);
                pstmt.setString(13, cnh);
                pstmt.setString(14, id);

                pstmt.executeUpdate(); // executa a atualização
                
                conexao.close(); // fecha a conexão
                
                
                
            } catch(Exception ex) {
                ex.printStackTrace();
                out.println("Erro: " + ex.toString());
            }
            
            //Saída
            out.println("<b>Registro - Alterado!</b>");
        %>
    </body>
</html>

