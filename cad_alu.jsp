<%-- 
    Document   : cliente
    Created on : 14/09/2023, 20:15:24
    Author     : alunos
--%>

<%@page import="Controle.Clientes"%>
<%@page import="Controle.CARROS"%>
<%@page import="Controle.Calculo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Alugar</title>
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
        CARROS Car = new CARROS();
        Calculo calculo = new Calculo();

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
        cli.setUf(request.getParameter("uf"));
        cli.setCnh(request.getParameter("Cnh"));
        Car.setPlaca(request.getParameter("Placa"));
        Car.setModelo(request.getParameter("Modelo"));
        Car.setAno(request.getParameter("ano"));
        Car.setCor(request.getParameter("cor"));
        Car.setFabricante(request.getParameter("Fabricante"));
       

        try {
            // Establishing database connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexao = DriverManager.getConnection("jdbc:mysql://127.0.0.1/bdaluguel", "usuariocurso", "123");

            // Preparing SQL statement with placeholders
            String sql = "INSERT INTO tb_calcular (nome, rg, cpf, email, telefone, celular, cep, endereco, complemento, bairro, cidade, estado, cnh, modelo, placa, ano, cor, fabricante) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

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
            pstmt.setString(14, Car.getModelo());
            pstmt.setString(15, Car.getPlaca());
            pstmt.setString(16, Car.getAno());
            pstmt.setString(17, Car.getCor());
            pstmt.setString(18, Car.getFabricante());

            // Executing update
            pstmt.executeUpdate();

            // Closing resources
            pstmt.close();
            conexao.close();
        } catch(Exception ex){
            ex.printStackTrace();
            out.println("Erro: " + ex.toString());
        }
          calculo.setN1(Double.parseDouble(request.getParameter("preco")));
         calculo.setN2(Double.parseDouble(request.getParameter("dias")));
         double resultado = calculo.getN1() + calculo.getN2();
        // Output - Displaying a confirmation message or any other relevant data
        out.println("<b>Registro - AluGuel</b>");
            out.println("<br>Valor a Pagar: "+ resultado);
            out.println("<br> Nome: " +  cli.getNome());
            out.println("<br> RG: " +cli.getRg());
            out.println("<br> CPF: " + cli.getCpf());
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
            out.println("<br> Placa: " +  Car.getPlaca());
            out.println("<br> Ano: " + Car.getAno());
            out.println("<br> Cor: " + Car.getCor());
            out.println("<br> Fabricante " +  Car.getFabricante());
        
        
        
        
        
        
        
        // Output other relevant data...
    %>
</body>
</html>