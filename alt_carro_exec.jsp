<%-- 
    Document   : cliente
    Created on : 14/09/2023, 20:15:24
    Author     : alunos
--%>

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
    <h1>Clientes</h1>
    <%            
        // Recebendo dados
        String id = request.getParameter("ident");
        String Placa = request.getParameter("Placa");
        String Modelo = request.getParameter("Modelo");
        String Ano = request.getParameter("ano");
        String Cor = request.getParameter("cor");
        String Fabricante = request.getParameter("Fabricante");
          
        //Alterar
        try {
            Class.forName("com.mysql.jdbc.Driver"); // registra            
            Connection conexao = DriverManager.getConnection("jdbc:mysql://127.0.0.1/bdaluguel", "usuariocurso", "123"); // abre Conn
                
            String sql = "UPDATE tb_carros SET modelo=?, placa=?, ano=?, cor=?, fabricante=? WHERE id=?";
                
            PreparedStatement pstmt = conexao.prepareStatement(sql);
            pstmt.setString(1, Modelo);
            pstmt.setString(2, Placa);
            pstmt.setString(3, Ano);
            pstmt.setString(4, Cor);
            pstmt.setString(5, Fabricante);
            pstmt.setString(6, id);

           pstmt.executeUpdate(); // executa a atualização
            
            conexao.close(); // fecha a conexão
            
            //Saída
           
        } catch(Exception ex) {
            ex.printStackTrace();
            out.println("Erro: " + ex.toString());
        }
    %>
</body>
</html>
