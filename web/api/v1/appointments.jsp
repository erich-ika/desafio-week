<%@page import="dao.AppointmentDAO"%>
<%@page import="model.Customer"%>
<jsp:useBean id="obj" class="model.Appointment"/>
<jsp:setProperty name="obj" property="date"/>
<jsp:setProperty name="obj" property="time"/>
<jsp:setProperty name="obj" property="service"/>
<%
    AppointmentDAO dao = new AppointmentDAO();
    obj.customer = (Customer) session.getAttribute("user");
    dao.cadastrar(obj);
    response.sendRedirect("/web/marcar/");
%>
