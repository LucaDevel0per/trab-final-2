<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Controle de Carros</title>
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
    <h1>Carros - Consulta para Alteração</h1>
    <%
        // Recebendo dados
        String id = request.getParameter("ident");                      
            
        // Consultar
        try {
            Class.forName("com.mysql.jdbc.Driver"); // Registra o driver do MySQL
            Connection conexao = DriverManager.getConnection("jdbc:mysql://127.0.0.1/bdaluguel", "usuariocurso", "123"); // Abre conexão
            String sql = "SELECT * FROM tb_carros WHERE id = ?";
            PreparedStatement pstmt = conexao.prepareStatement(sql);
            pstmt.setString(1, id); // Define o valor do parâmetro
            ResultSet rs = pstmt.executeQuery(); // Executa a consulta

            // Saída do formulário para atualização dos dados do carro
            while (rs.next()) {
    %>
    <h1>Atualização de Carros</h1>
    <form method="post" action="alt_carro_exec.jsp">
        <input type="hidden" name="ident" value="<%= rs.getString("id") %>">
        <label for="id">ID:</label>
        <input type="text" name="id" value="<%= rs.getString("id") %>" disabled><br>
        <label for="placa">Placa:</label>
        <input type="text" name="Modelo" value="<%= rs.getString("Modelo") %>"><br>
        <label for="modelo">Modelo:</label>
        <input type="text" name="Placa" value="<%= rs.getString("Placa") %>"><br>
        <label for="ano">Ano:</label>
        <input type="text" name="ano" value="<%= rs.getString("ano") %>"><br>
        <label for="cor">Cor:</label>
        <input type="text" name="cor" value="<%= rs.getString("cor") %>"><br>
        <label for="fabricante">Fabricante:</label>
        <input type="text" name="Fabricante" value="<%= rs.getString("Fabricante") %>"><br>
        
        <input type="submit" name="salvar" value="Salvar">
    </form>
    <%
            }                                        
            conexao.close(); // Fecha a conexão                
        } catch(Exception ex) {
            ex.printStackTrace();
            out.println("Erro: " + ex.toString());
        }            
    %>
</body>
</html>
