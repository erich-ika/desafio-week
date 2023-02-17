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
            if (user == null) {
                response.sendRedirect("/web/");
            }
        %>
    </head>

    <body>
        <header>
            <h1>Yara Manicure</h1>
        </header>
        <main>
            <div>
                <h2>Marque seu horário</h2>
            </div>
            <div>
                <form action="/web/api/v1/appointments.jsp" method="post">
                    <label for="service">Serviço</label><br>
                    <select name="service" id="service" required>
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
                    <label for="date">Data</label><br>
                    <input type="date" name="date" id="date" required>
                    <label for="time">Horário</label><br>
                    <select name="time" id="time" required>
                        <option value=""></option>
                        <option value="8">08:00</option>
                        <option value="9">09:00</option>
                        <option value="10">10:00</option>
                        <option value="11">11:00</option>
                        <option value="13">13:00</option>
                        <option value="14">14:00</option>
                        <option value="15">15:00</option>
                        <option value="16">16:00</option>
                        <option value="17">17:00</option>
                        <option value="18">18:00</option>
                        <option value="19">19:00</option>
                    </select><br>
                    <button class="button" type="submit">Marcar</button>
                </form>
            </div>
            <%@page import="dao.AppointmentDAO"%>
            <%@page import="model.Appointment"%>
            <%@page import="java.util.ArrayList"%>
            <%
                out.print("<table>");
                AppointmentDAO dao = new AppointmentDAO();
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
