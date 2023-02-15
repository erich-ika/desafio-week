<%@page import="dao.CustomerDAO"%>
<%@page import="model.Customer"%>
<%@page import="javax.naming.AuthenticationException"%>
<jsp:useBean id="obj" class="model.Customer"/>
<jsp:setProperty name="obj" property="tel"/>
<jsp:setProperty name="obj" property="password"/>
<%
    try {
        CustomerDAO dao = new CustomerDAO();
        obj = dao.login(obj.getTel(), obj.getPassword());
        session.setAttribute("user", obj);
        response.sendRedirect("/web/");
    } catch (AuthenticationException e) {
        session.setAttribute("error", "Usuário ou senha incorretos.");
        response.sendRedirect("/web/login/");
    } catch (RuntimeException e) {
        session.setAttribute("error", "Erro ao se comunicar com o banco de dados...");
        response.sendRedirect("/web/login/");
    }
%>
