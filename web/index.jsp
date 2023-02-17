<!DOCTYPE html>
<html>

    <head>
        <title>Yara Manicure</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/web/style.css">
        <%@page import="model.Customer"%>
        <%
            Customer user = (Customer) session.getAttribute("user");
        %>
    </head>

    <body>
        <header>
            <h1>Yara Manicure</h1>
            <%
                if (user == null) {
            %><a class="loginout" href="/web/login/">Login</a><%
                } else {
            %><a class="loginout" href="/web/api/v1/logout.jsp">Sair</a><%
                }
            %>
        </header>
        <main>
            <div>
                <% if (user == null) {%>
                <h2>Junte-se a nós!</h2>
                <a href="/web/cadastro/" class="button">Cadastre-se</a>
                <% } else { %>
                <h2>Bem-vinda(o), <%= user.getName() %></h2>
                <a href="/web/marcar/" class="button">Marque seu horário</a>
                <% } %>
            </div>
            <img src="https://st3.depositphotos.com/1000995/33559/i/1600/depositphotos_335598628-free-stock-photo-female-hands-lunar-black-manicure.jpg"
                 alt="unhas">
            <div>
                <h2>Suas unhas, profissionalmente.</h2>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et
                    dolore magna aliqua. Condimentum id venenatis a condimentum. Sed libero enim sed faucibus turpis in. Nec
                    ullamcorper sit amet risus nullam eget felis eget nunc. Turpis egestas maecenas pharetra convallis
                    posuere morbi. Hendrerit gravida rutrum quisque non. Ultrices tincidunt arcu non sodales. Quam vulputate
                    dignissim suspendisse in est ante. Sed risus pretium quam vulputate dignissim suspendisse in est. Orci
                    porta non pulvinar neque laoreet suspendisse. Eros donec ac odio tempor orci dapibus ultrices.
                    Suspendisse in est ante in. Ullamcorper morbi tincidunt ornare massa eget egestas purus. A pellentesque
                    sit amet porttitor eget. Ut ornare lectus sit amet est placerat in egestas erat. At ultrices mi tempus
                    imperdiet nulla malesuada pellentesque. Nisi porta lorem mollis aliquam ut porttitor leo a.
                </p>
            </div>
        </main>
        <footer>
            Copyright © 2023 Erich IKA
        </footer>
    </body>

</html>
