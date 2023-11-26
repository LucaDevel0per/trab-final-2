<%-- 
    Document   : cliente
    Created on : 14/09/2023, 20:15:24
    Author     : alunos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controle.CARROS"%>
<%@page import="java.text.*" import="java.lang.*"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Controle de carros</title>
    </head>
    <body>
        <h1>Clientes</h1>
        <%
            // Recebendo dados
            String id = request.getParameter("ident");
            
            //Excluir!
            try{
                Class.forName("com.mysql.jdbc.Driver"); //registra            
                 Connection conexao = DriverManager.getConnection("jdbc:mysql://127.0.0.1/bdaluguel", "usuariocurso", "123"); // abre Conn
                Statement stmt = conexao.createStatement(); //cria uma instrução
                String sql = "DELETE FROM tb_carros WHERE id = " + id; //defin instr. SQL
                stmt.executeUpdate(sql); // exec. Query.
                conexao.close(); //fecha

                //Saída
                out.println("<b> Registro excluído com sucesso! </b>");                
            }
            catch(Exception ex){
                ex.printStackTrace();
                out.println("Erro: " + ex.toString());
            }
            
            
           
        %>
    </body>
</html>

