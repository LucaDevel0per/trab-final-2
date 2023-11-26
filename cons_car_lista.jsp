<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.*" import="java.lang.*"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f5f5f5;
        }
        img {
            width: 20px;
            height: 20px;
        }
    </style>
</head>
<body>
    <h1>Clientes - Lista New</h1>
    <table>
        <tr>
            <th>#</th>
            <th>Placa</th>
            <th>Modelo</th>
            <th>Ano</th>
            <th>Cor</th>
            <th>Fabricante</th>
            <th>Alterar</th>
            <th>Excluir</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conexao = DriverManager.getConnection("jdbc:mysql://127.0.0.1/bdaluguel", "usuariocurso", "123");
                Statement stmt = conexao.createStatement();
                String sql = "SELECT * FROM tb_carros";
                ResultSet rs = stmt.executeQuery(sql);
                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getRow() %></td>
                        <td><%= rs.getString("Placa") %></td>
                        <td><%= rs.getString("Modelo") %></td>
                        <td><%= rs.getString("ano") %></td> 
                        <td><%= rs.getString("cor") %></td> 
                        <td><%= rs.getString("Fabricante") %></td> 
                        <td><a href="cons_alt_carro.jsp?ident=<%= rs.getString("id") %>"><img src="imagem/update.png" alt="Alterar"/></a></td> 
                        <td><a href="exc_car.jsp?ident=<%= rs.getString("id") %>"><img src="imagem/delete.png" alt="Excluir"/></a></td> 
                    </tr> 
        <%
                }
                
                conexao.close();
            } catch(Exception ex) {
                ex.printStackTrace();
                out.println("Erro: " + ex.toString());
            }
        %>   
    </table>
</body>
</html>


