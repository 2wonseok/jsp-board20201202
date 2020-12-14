<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="value" type="java.lang.String" required="true"  %>
<%
	value = value.replace("<", "&lt;");	
	value = value.replace(">", "&gt;");	
	value = value.replace("&", "&amp;");	
	value = value.replace("\n", "\n<br>");	
	value = value.replace(" ", "&nbsp;");	
%>
<%= value %>
