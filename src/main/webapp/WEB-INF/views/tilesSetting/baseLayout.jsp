<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Explosion</title>
    <tiles:insertAttribute name="style"/>
</head>
<body>
    <tiles:insertAttribute name="header"/>
    <tiles:insertAttribute name="menu" />
    <tiles:insertAttribute name="submenu"/>
    <tiles:insertAttribute name="body" />
    <tiles:insertAttribute name="footer" />
</body>
</html>