<%-- 
    Document   : equipManage
    Created on : Jul 8, 2020, 11:03:57 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Equipment Manage</title>
        <%@include file="/metadata.html" %>
    </head>
    <body>
        <header id="header" class="bg-white">
            <div class="container">
                <div class="logo float-left">
                    <!-- Uncomment below if you prefer to use an image logo -->
                    <h1 class="text-light"><a href="#" class="scrollto"><span>TayDuKi</span></a></h1>
                    <!-- <a href="#header" class="scrollto"><img src="img/logo.png" alt="" class="img-fluid"></a> -->
                </div>

                <nav class="main-nav float-right d-none d-lg-block">
                    <ul>
                        <li><a href="searchUserPage">Manage User</a></li>
                        <li><a href="lifeManagePage">Manage Life</a></li>
                        <li class='active'><a href="addEquipPage">Add New Equipment</a></li>
                        <li><a href="logout">Logout</a></li>
                    </ul>
                </nav><!-- .main-nav -->
            </div>
        </header><br/><br/><br/><br/>

        <section class="section-bg clearfix" id="pricing">
            <div class="container">
                <h1>Equipment Manager</h1>
                Name equipment: <form action="searchEquip" method="POST">
                    <input type="text" name="txtSearch" required="true">
                    <input type="submit" name="action" value="Search">
                </form>
                <font color="red">
                ${requestScope.MESSAGE}
                </font>

                <!--display search result -->
                <c:if test="${requestScope.DTOS != null}">
                    <c:if test="${not empty requestScope.DTOS}" var="isEmpty">
                        <section id="team" class="section-bg">
                            <div class="container">
                                <div class="row">
                                    <c:forEach var="dto" items="${requestScope.DTOS}">
                                        <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                                            <div class="member">
                                                <img src="${dto.imgEquip}" class="img-fluid" alt="${dto.nameEquip}">
                                                <div class="member-info">
                                                    <div class="member-info-content">
                                                        <h4>${dto.nameEquip}</h4>
                                                        <span>${dto.descEquip}</span>
                                                        <div class="social">
                                                            <a href="viewEquip?idEquip=${dto.idEquip}">View</a>
                                                            |
                                                            <c:url var="deleteLink" value="deleteEquip">
                                                                <c:param name="idEquip" value="${dto.idEquip}"/>
                                                                <c:param name="txtSearch" value="${param.txtSearch}"/>
                                                            </c:url>                        
                                                            <a href="${deleteLink}">Delete</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </section>
                    </c:if>
                    <c:if test="${not isEmpty}">No result<br/></c:if>
                </c:if>
            </div>
        </section>
    </body>
</html>
