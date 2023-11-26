

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
    <h1>Clientes - Consulta para Alteração</h1>
    <%
        // Recebendo dados
        String id = request.getParameter("ident");                      
            
        //Consultar
        try {
            Class.forName("com.mysql.jdbc.Driver"); //registra            
            Connection conexao = DriverManager.getConnection("jdbc:mysql://127.0.0.1/bdaluguel", "usuariocurso", "123"); // abre Conn
            String sql = "SELECT * FROM tb_clientes WHERE id = ?";
            PreparedStatement pstmt = conexao.prepareStatement(sql);
            pstmt.setString(1, id); // definir valor do parâmetro
            ResultSet rs = pstmt.executeQuery(); // executa a consulta

            //Saída
            while (rs.next()) {
    %>
    <h1>Atualização de Clientes</h1>
    <form method="post" action="alt_c_exec.jsp">
        <input type="hidden" name="ident" value="<%= rs.getString("id") %>">
        <label for="id">ID:</label>
        <input type="text" name="id" value="<%= rs.getString("id") %>" disabled><br>
        <label for="nome">Nome:</label>
        <input type="text" name="nome" value="<%= rs.getString("nome") %>"><br>
        <label for="rg">RG:</label>
        <input type="text" name="rg" value="<%= rs.getString("rg") %>"><br>
        <label for="cpf">CPF:</label>
        <input type="text" name="cpf" value="<%= rs.getString("cpf") %>"><br>
        <label for="celular">Celular:</label>
        <input type="text" name="celular" value="<%= rs.getString("celular") %>"><br>
        <label for="cep">CEP:</label>
        <input type="text" name="cep" value="<%= rs.getString("cep") %>"><br>
        <label for="endereco">Endereço:</label>
        <input type="text" name="endereco" value="<%= rs.getString("Endereco") %>"><br>
        <label for="numero">Número:</label>
        <input type="text" name="numero" value="<%= rs.getString("numero") %>"><br>
        <label for="complemento">Complemento:</label>
        <input type="text" name="complemento" value="<%= rs.getString("Complemento") %>"><br>
        <label for="bairro">Bairro:</label>
        <input type="text" name="bairro" value="<%= rs.getString("bairro") %>"><br>
        <label for="estado">Estado:</label>
        <input type="text" name="estado" value="<%= rs.getString("estado") %>"><br>
        <label for="cnh">CNH:</label>
        <input type="text" name="cnh" value="<%= rs.getString("Cnh") %>"><br>
        <input type="submit" name="salvar" value="Salvar">
    </form>
    <%
            }                                        
            conexao.close(); // fecha a conexão                
        } catch(Exception ex) {
            ex.printStackTrace();
            out.println("Erro: " + ex.toString());
        }            
    %>
</body>
</html>