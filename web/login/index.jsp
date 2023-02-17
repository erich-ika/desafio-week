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
                <h2>Login</h2>
                <p class="errormessage">
                    <%
                        String message = (String)session.getAttribute("error");
                        if (message != null) out.print(message);
                        session.setAttribute("error", null);
                    %>
                </p>
            </div>
            <div>
                <form action="/web/api/v1/login.jsp" method="post">
                    <label for="tel">Telefone</label><br>
                    <input type="tel" name="tel" id="tel" required><br>
                    <label for="password">Senha</label><br>
                    <input type="password" name="password" id="password" required><br>
                    <button class="button" type="submit">Login</button>
                </form>
            </div>
        </main>
        <footer>
            Copyright © 2023 Erich IKA
        </footer>
    </body>

</html>
