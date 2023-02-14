<%@page import="dao.CustomerDAO"%>
<%@page import="model.Customer"%>
<jsp:useBean id="obj" class="model.Customer"/>
<jsp:setProperty name="obj" property="tel"/>
<jsp:setProperty name="obj" property="password"/>
<%
    CustomerDAO dao = new CustomerDAO();
    obj = dao.login(obj.getTel(), obj.getPassword());
    session.setAttribute("user", obj);
    response.sendRedirect("/web/");
%>
