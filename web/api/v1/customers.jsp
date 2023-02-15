<%@page import="dao.CustomerDAO"%>
<%@page import="model.Customer"%>
<jsp:useBean id="obj" class="model.Customer"/>
<jsp:setProperty name="obj" property="name"/>
<jsp:setProperty name="obj" property="tel"/>
<jsp:setProperty name="obj" property="password"/>
<jsp:setProperty name="obj" property="password2"/>
<%
    try {
        CustomerDAO dao = new CustomerDAO();
        dao.cadastrar(obj);
        session.setAttribute("user", obj);
        response.sendRedirect("/web/");
    } catch (IllegalArgumentException e) {
        session.setAttribute("error", "As senhas não coincidem!");
        response.sendRedirect("/web/cadastro/");
    } catch (RuntimeException e) {
        session.setAttribute("error", "Erro ao se comunicar com o banco de dados...");
        response.sendRedirect("/web/cadastro/");
    }
%>
