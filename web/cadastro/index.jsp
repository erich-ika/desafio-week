<!DOCTYPE html>
<html>

    <head>
        <title>Yara Manicure</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/web/style.css" type="text/css">

    </head>

    <body>
        <header>
            <h1>Yara Manicure</h1>
        </header>
        <main>
            <div>
                <h2>Cadastro</h2>
                <p class="errormessage">
                    <% 
                        String message = (String)session.getAttribute("error");
                        if (message != null) out.print(message);
                        session.setAttribute("error", null);
                    %>
                </p>
            </div>
            <div>
                <p class="center">Já se cadastrou?</p>
                <a href="/web/login/" class="button">Faça Login</a>
            </div>
            <div>
                <form action="/web/api/v1/customers.jsp" method="post">
                    <label for="name">Nome</label><br>
                    <input type="text" name="name" id="name" required><br>
                    <label for="tel">Telefone</label><br>
                    <input type="tel" name="tel" id="tel" required><br>
                    <label for="password">Senha</label><br>
                    <input type="password" name="password" id="password" required><br>
                    <label for="password2">Confirmar Senha</label><br>
                    <input type="password" name="password2" id="password2" required><br>
                    <button class="button" type="submit">Cadastre-se</button>
                </form>
            </div>
            <%@page import="dao.CustomerDAO"%>
            <%@page import="model.Customer"%>
            <%@page import="java.util.ArrayList"%>
            <%
                out.print("<table>");
                CustomerDAO dao = new CustomerDAO();
                ArrayList<Customer> customers = dao.getCustomers();
                out.print(Customer.HTMLTABLEHEADER);
                
                for (int i = 0; i < customers.size(); i++) {
                    out.print(customers.get(i).toHTMLRow());
                }
                out.print("</table>");
            %>
        </main>
        <footer>
            Copyright © 2023 Erich IKA
        </footer>
    </body>

</html>
