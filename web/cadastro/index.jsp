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
        </div>
        <div>
        </div>
        <div>
            <form action="/web/api/v1/customers.jsp" method="post">
                <label for="name">Nome</label><br>
                <label for="tel">Telefone</label><br>
                <label for="password">Senha</label><br>
                <label for="password2">Confirmar Senha</label><br>
                <button class="button" type="submit">Cadastre-se</button>
            </form>
        </div>
    </main>
    <footer>
    </footer>
</body>
                <p class="center">J� se cadastrou?</p>
                <a href="/web/login/" class="button">Fa�a Login</a>
            Copyright � 2023 Erich IKA
                    <% 
                        String message = (String)session.getAttribute("error");
                        if (message != null) out.print(message);
                        session.setAttribute("error", null);
                    %>
                    <input type="text" name="name" id="name" required><br>
                    <input type="tel" name="tel" id="tel" required><br>
                    <input type="password" name="password" id="password" required><br>
                    <input type="password" name="password2" id="password2" required><br>

</html>
