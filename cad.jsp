<%-- 
    Document   : cliente
    Created on : 14/09/2023, 20:15:24
    Author     : alunos
--%>

<%@page import="Controle.Clientes"%>
<%@page import="Controle.CARROS"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <% Clientes cli = new Clientes();

        // Retrieving form data and setting attributes for Clientes and CARROS objects
        cli.setNome(request.getParameter("nome"));
        cli.setRg(request.getParameter("rg"));
        cli.setCpf(request.getParameter("cpf"));
        cli.setEmail(request.getParameter("email"));
        cli.setTelefone(request.getParameter("telefone"));
        cli.setCelular(request.getParameter("celular"));
        cli.setCep(request.getParameter("cep"));
        cli.setEndereco(request.getParameter("Endereco"));
        cli.setComplemento(request.getParameter("complemento"));
        cli.setBairro(request.getParameter("bairro"));
        cli.setCidade(request.getParameter("Cidade"));
        cli.setEstado(request.getParameter("estado")); // Make sure if this is supposed to be set as "estado" or "uf"
        cli.setCnh(request.getParameter("Cnh"));
   
        // Assuming Car.setPreco() is a method for setting the price

        try {
            // Establishing database connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexao = DriverManager.getConnection("jdbc:mysql://127.0.0.1/bdaluguel", "usuariocurso", "123");

            // Preparing SQL statement with placeholders
            String sql = "INSERT INTO tb_clientes (nome, rg, cpf, email, telefone, celular, cep, endereco, complemento, bairro, cidade, estado, cnh) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            // Creating prepared statement
            PreparedStatement pstmt = conexao.prepareStatement(sql);
            pstmt.setString(1, cli.getNome());
            pstmt.setString(2, cli.getRg());
            pstmt.setString(3, cli.getCpf());
            pstmt.setString(4, cli.getEmail());
            pstmt.setString(5, cli.getTelefone());
            pstmt.setString(6, cli.getCelular());
            pstmt.setString(7, cli.getCep());
            pstmt.setString(8, cli.getEndereco());
            pstmt.setString(9, cli.getComplemento());
            pstmt.setString(10, cli.getBairro());
            pstmt.setString(11, cli.getCidade());
            pstmt.setString(12, cli.getEstado()); 
            pstmt.setString(13, cli.getCnh());
         
            // Executing update
            pstmt.executeUpdate();

            // Closing resources
            pstmt.close();
            conexao.close();
        } catch(Exception ex){
            ex.printStackTrace();
            out.println("Erro: " + ex.toString());
        }

        // Output - Displaying a confirmation message or any other relevant data
        
            out.println("<b> Registro - Clientes </b>");
            out.println("<br> Nome: " +  cli.getNome());
            out.println("<br> RG: " +cli.getRg());
            out.println("<br> CPF: " +  cli.getCpf());
            out.println("<br> EMAIL: " +  cli.getEmail());
            out.println("<br> TELEFONE: " +  cli.getTelefone());
            out.println("<br> CELULAR: " +   cli.getCelular());
            out.println("<br> CEP: " +  cli.getCep());
            out.println("<br> ENDEREÇO: " +  cli.getEndereco());
            out.println("<br> COMPLEMENTO " +  cli.getComplemento());
            out.println("<br> BAIRRO " +  cli.getBairro());
            out.println("<br> CIDADE " +  cli.getCidade());
            out.println("<br> ESTADO " +  cli.getEstado());
            out.println("<br> CNH " +   cli.getCnh());
        
        
        
        
        
        
        // Output other relevant data...
    %>
</body>
</html>