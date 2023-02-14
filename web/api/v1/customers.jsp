<%@page import="dao.CustomerDAO"%>
<%@page import="model.Customer"%>
<jsp:useBean id="obj" class="model.Customer"/>
<jsp:setProperty name="obj" property="name"/>
<jsp:setProperty name="obj" property="tel"/>
<jsp:setProperty name="obj" property="password"/>
<jsp:setProperty name="obj" property="password2"/>
<%
    CustomerDAO dao = new CustomerDAO();
    session.setAttribute("user", obj);
%>
