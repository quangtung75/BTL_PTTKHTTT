<%--
  Created by IntelliJ IDEA.
  User: vongn
  Date: 10/21/2024
  Time: 5:06 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.ArrayList,libman.dao.*,libman.model.*" %>
<%
    String username = (String) request.getParameter("username");
    String password = (String) request.getParameter("password");
    ThanhVien764 tv = new ThanhVien764();
    tv.setTaiKhoan(username);
    tv.setMatKhau(password);
    ThanhVien764DAO dao = new ThanhVien764DAO();
    boolean kq = dao.dangnhap(tv);
    if (kq && (tv.getVaiTro().equalsIgnoreCase("bandoc"))) {
        session.setAttribute("bandoc", tv);
        response.sendRedirect("bandoc\\gdChinhBD764.jsp");
    } else if(kq && (tv.getVaiTro().equalsIgnoreCase("nvtv"))) {
        session.setAttribute("nvtv", tv);
        response.sendRedirect("nvtv\\gdChinhNVTV764.jsp");
    } else {
        response.sendRedirect("gdDangnhap764.jsp?err=fail");
    }
%>

