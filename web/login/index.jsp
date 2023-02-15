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
            Copyright � 2023 Erich IKA
        </footer>
    </body>

</html>
