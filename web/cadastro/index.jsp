<!DOCTYPE html>
<html>

    <head>
        <title>Yara Manicure</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/web/style.css" type="text/css">
        <script src="/web/menu.js"></script>

    </head>

    <body>
        <nav id="nav">
            <a href="/web/">Início</a>
            <br><br>
            <a href="/web/login/">Login</a>
            <br><br>
            <a href="/web/cadastro/">Cadastro</a>
            <br><br>
            <a href="/web/marcar/">Marcar Horário</a>
            <br><br><br>
            <a href="/web/api/v1/logout.jsp">Sair</a>
        </nav>
        <header>
            <h1>Yara Manicure</h1>
            <img class="menubutton" src="/web/assets/menu.png" alt="menu" onclick="openNav()">
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
                out.print("<br><br><br><br><br><br><br><br><br><table>");
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
