<!DOCTYPE html>
<html>

    <head>
        <title>Yara Manicure</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/web/style.css">
        <script src="/web/menu.js"></script>
        <%@page import="model.Customer"%>
        <%
            Customer user = (Customer) session.getAttribute("user");
            if (user == null) {
                session.setAttribute("error", "Você precisa se cadastrar primeiro!");
                response.sendRedirect("/web/cadastro/");
            }
        %>
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
                <h2>Marque seu horário</h2>
                <p class="errormessage">
                    <%
                        String message = (String)session.getAttribute("error");
                        if (message != null) out.print(message);
                        session.setAttribute("error", null);
                    %>
                </p>
            </div>
            <div>
                <form action="." method="get">
                    <label for="date">Data</label><br>
                    <input type="date" name="date" id="date" value="<%= request.getParameter("date") %>" onchange="this.form.submit()" required>
                </form>
                <form action="/web/api/v1/appointments.jsp" method="post">
                    <input type="date" name="date" value="<%= request.getParameter("date") %>" style="display: none" required>
                    <%
                        String date = request.getParameter("date");
                        boolean selected = date != null;
                    %>
                    <label for="time">Horário</label><br>
                    <select name="time" id="time" required <%= selected ? "" : "disabled" %>>
                        <option value=""></option>
                        <%
                            AppointmentDAO dao = new AppointmentDAO();                            
                            if (selected) {
                                ArrayList<Integer> ocupados = dao.getAppointmentsByDate(date);
                                for (int i = 8; i < 18; i++) {
                                    if (!ocupados.contains(i))
                                        out.print("<option value=\"" + i + "\">" + i + ":00</option>");
                                }
                            }
                        %>
                    </select><br>
                    <label for="service">Serviço</label><br>
                    <select name="service" id="service" required <%= selected ? "" : "disabled" %>>
                        <option value=""></option>
                        <%@page import="dao.ServiceDAO"%>
                        <%@page import="model.Service"%>
                        <%@page import="java.util.ArrayList"%>
                        <%
                            ServiceDAO servdao = new ServiceDAO();
                            ArrayList<Service> services = servdao.getServices();
                
                            for (int i = 0; i < services.size(); i++) {
                                out.print(services.get(i).toHTMLSelectOptions());
                            }
                        %>
                    </select><br>
                    <button class="button" type="submit">Marcar</button>
                </form>
            </div>
            <%@page import="dao.AppointmentDAO"%>
            <%@page import="model.Appointment"%>
            <%@page import="java.util.ArrayList"%>
            <%
                out.print("<br><br><br><br><br><br><br><br><br><table>");
                ArrayList<Appointment> appointments = dao.getAppointments();
                out.print(Appointment.HTMLTABLEHEADER);
                
                for (int i = 0; i < appointments.size(); i++) {
                    out.print(appointments.get(i).toHTMLRow());
                }
                out.print("</table>");
            %>
        </main>
        <footer>
            Copyright © 2023 Erich IKA
        </footer>
    </body>

</html>
