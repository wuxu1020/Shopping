<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
session.removeAttribute("username");//移除属性
session.invalidate();//销毁session
response.sendRedirect("Homepage.jsp");
 %>

