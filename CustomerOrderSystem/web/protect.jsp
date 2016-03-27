<%
    if(session.getAttribute("customer") == null){
        response.sendRedirect("index.html");
    }
%>
