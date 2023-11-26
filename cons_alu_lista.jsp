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

        a {
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Clientes - Lista New</h1>

    <%
        // Recebendo dados
        String id = request.getParameter("ident");                      

        // Consultar
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conexao = DriverManager.getConnection("jdbc:mysql://127.0.0.1/bdaluguel", "usuariocurso", "123");
            Statement stmt = conexao.createStatement();
            String sql = "SELECT * FROM tb_calcular";
            ResultSet rs = stmt.executeQuery(sql);
    %>
            <table>
                <tr>
                    <th>#</th>
                    <th>Nome</th>
                    <th>RG</th>
                    <th>CPF</th>
                    <th>Celular</th>
                    <th>CEP</th>
                    <th>Endereço</th>
                    <th>Complemento</th>
                    <th>Bairro</th>
                    <th>Cidade</th>
                    <th>Estado</th>
                    <th>CNH</th>
                    <th>Placa</th>
                    <th>Modelo</th>
                    <th>Ano</th>
                    <th>Cor</th>
                    <th>Fabricante</th>
                    <th>Excluir</th>
                </tr>

                <%
                    // Saída
                    while (rs.next()) {
                %>
                        <tr>
                            <td><%= rs.getRow() %></td>
                            <td><%= rs.getString("nome") %></td>
                            <td><%= rs.getString("rg") %></td>
                            <td><%= rs.getString("cpf") %></td> 
                            <td><%= rs.getString("celular") %></td> 
                            <td><%= rs.getString("cep") %></td> 
                            <td><%= rs.getString("Endereco") %></td> 
                            <td><%= rs.getString("Complemento") %></td> 
                            <td><%= rs.getString("bairro") %></td> 
                            <td><%= rs.getString("cidade") %></td> 
                            <td><%= rs.getString("estado") %></td> 
                            <td><%= rs.getString("Cnh") %></td> 
                            <td><%= rs.getString("Placa") %></td>
                            <td><%= rs.getString("Modelo") %></td>
                            <td><%= rs.getString("ano") %></td> 
                            <td><%= rs.getString("cor") %></td> 
                            <td><%= rs.getString("Fabricante") %></td> 
                            <td><a href="exc_alu.jsp?ident=<%= rs.getString("id") %>"><img src="imagem/delete.png" alt="Excluir"/></a></td> 
                        </tr> 
                <%
                    }             
                %>   
            </table>
    <%
            conexao.close();
        } catch(Exception ex) {
            ex.printStackTrace();
            out.println("Erro: " + ex.toString());
        }                 
    %>
</body>
</html>


