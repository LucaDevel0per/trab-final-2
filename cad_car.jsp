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
    <title>Controle de carros</title>
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
    <h1>carros</h1>
    <%
        CARROS Car = new CARROS();

 
        Car.setPlaca(request.getParameter("Placa"));
        Car.setModelo(request.getParameter("Modelo"));
        Car.setAno(request.getParameter("ano"));
        Car.setCor(request.getParameter("cor"));
        Car.setFabricante(request.getParameter("Fabricante"));
        // Assuming Car.setPreco() is a method for setting the price

        try {
            // Establishing database connection
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexao = DriverManager.getConnection("jdbc:mysql://127.0.0.1/bdaluguel", "usuariocurso", "123");

            // Preparing SQL statement with placeholders
            String sql = "INSERT INTO tb_carros ( modelo, placa, ano, cor, fabricante) VALUES (?, ?, ?, ?, ?)";

            // Creating prepared statement
            PreparedStatement pstmt = conexao.prepareStatement(sql);
           
            pstmt.setString(1, Car.getModelo());
            pstmt.setString(2, Car.getPlaca());
            pstmt.setString(3, Car.getAno());
            pstmt.setString(4, Car.getCor());
            pstmt.setString(5, Car.getFabricante());

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
        out.println("<b>Registro - AluGuel</b>");
            out.println("<b>Registro - </b>");
            out.println("<b> Registro - Clientes </b>");
            out.println("<br> Placa: " +  Car.getPlaca());
            out.println("<br> Ano: " + Car.getAno());
            out.println("<br> Cor: " + Car.getCor());
            out.println("<br> Fabricante " +  Car.getFabricante());
        
        
        
        
        
        
        // Output other relevant data...
    %>
</body>
</html>