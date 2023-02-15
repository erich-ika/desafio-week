<!DOCTYPE html>
<html>

    <head>
        <title>Yara Manicure</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/web/style.css">
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
                <form action="" method="post">
                    <label for="service">Serviço</label><br>
                    <select name="service" id="service">
                        <option value="produto1">Produto 1</option>
                        <option value="produto2">Produto 2</option>
                        <option value="produto3">Produto 3</option>
                        <option value="produto4">Produto 4</option>
                        <option value="produto5">Produto 5</option>
                    </select><br>
                    <label for="date">Data</label><br>
                    <input type="date" name="date" id="date">
                    <label for="time">Horário</label><br>
                    <select name="time" id="time">
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
