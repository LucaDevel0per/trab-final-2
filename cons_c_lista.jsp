<%-- 
    Document   : cliente
    Created on : 14/09/2023, 20:15:24
    Author     : alunos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controle.Clientes"%>
<%@page import="java.text.*" import="java.lang.*"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Controle de carros</title>        
             
    </head>
    <body>
        <h1>Clientes - Lista New </h1>
        <%
            // Recebendo dados
            
            String id = request.getParameter("ident");                      
            
            //Consultar
            try{
                Class.forName("com.mysql.jdbc.Driver"); //registra            
                Connection conexao = DriverManager.getConnection("jdbc:mysql://127.0.0.1/bdaluguel", "usuariocurso", "123"); // abre Conn
                Statement stmt = conexao.createStatement(); //cria uma instrução
                ///          SELECT * FROM clientes WHERE id = 3;
                //String sql = "SELECT * FROM clientes WHERE id = " + id; //defin instr. SQL
                String sql = "SELECT * FROM tb_clientes " ; //defin instr. SQL
                ResultSet rs = stmt.executeQuery(sql); // exec. Query.
        %>
        <table style="width:100%"; border="1">
            <tr bgcolor="F5F5F5">
                <th> #</th>
                <th> Nome</th>
                <th> rg</th>
                <th> cpf</th>
                <th> celular</th>
                <th> cep</th>
                <th> Endereço:</th>
                <th> numero</th>
                <th> Complemento:</th>
                <th> Bairro:</th>
                <th> Cidade:</th>
                <th> estado</th>
                <th> cnh:</th>
                <th> Alterar?</th>
                <th> Excluir?</th>
            </tr>
        
        
        <%    
                //Saída
                while (rs.next()){
        %>
            <tr>
                <td><%= rs.getRow() %></td>
                <td><%= rs.getString("nome") %></td>
                <td><%= rs.getString("rg") %></td>
                <td><%= rs.getString("cpf") %></td> 
                <td><%= rs.getString("celular") %></td> 
                <td><%= rs.getString("cep") %></td> 
                <td><%= rs.getString("Endereco") %></td> 
                <td><%= rs.getString("numero") %></td> 
                <td><%= rs.getString("Complemento") %></td> 
                <td><%= rs.getString("bairro") %></td> 
                <td><%= rs.getString("cidade") %></td> 
                <td><%= rs.getString("estado") %></td> 
                <td><%= rs.getString("Cnh")%></td> 
                
                <td><a href="cons_alt_c.jsp?ident=<%= rs.getString("id") %>"><img src="imagem/update.png" alt=""/></a></td> 
                <td><a href="exc_c.jsp?ident=<%= rs.getString("id") %>"><img src="imagem/delete.png" alt=""/></a></td> 
            </tr> 
                    
        <%
                }             
        %>   
        </table>
        <%
                conexao.close(); //fecha                
            }
            catch(Exception ex){
                ex.printStackTrace();
                out.println("Erro: " + ex.toString());
            }                 
        %>
    </body>
</html>

