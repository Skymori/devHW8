<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="endpoint" value="${requestScope['javax.servlet.forward.servlet_path']}"/>
<c:choose>
    <c:when test="${endpoint == '/users/registration'}">
        <c:set var="actionUrl" value="/users/registration"/>
    </c:when>
    <c:otherwise>
        <c:set var="actionUrl" value="/users"/>
    </c:otherwise>
</c:choose>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>GOIT</title>
    <meta charset="utf-8">
    <link href="${contextPath}/view/css/common.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>

<div class="container">
    <form:form method="POST" modelAttribute="entityForm" class="form-signin" action="${actionUrl}">
        <h2 class="form-signin-heading">Create account</h2>
        <form:input type="hidden" path="id" value="${entity.id}"/>

        <spring:bind path="firstName">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="firstName" class="form-control" placeholder="first name" autofocus="true"></form:input>
                <form:errors path="firstName"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="lastName">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="lastName" class="form-control" placeholder="last name" autofocus="true"></form:input>
                <form:errors path="lastName"></form:errors>
            </div>
        </spring:bind>

        <span>${message}</span>
        <spring:bind path="email">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="text" path="email" class="form-control" placeholder="Username(use email as user name)"
                            autofocus="true"></form:input>
                <form:errors path="email"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="password">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
                <form:errors path="password"></form:errors>
            </div>
        </spring:bind>

         <c:if test="${endpoint != '/users/registration'}">
            <form:select class="form-control form-control-lg" path="userRole" items="${roles}" itemLabel="role" itemValue="role" />
        </c:if>

        <button class="btn btn-outline-primary btn-block" type="submit">Submit</button>
    </form:form>
</div>

</body>
</html>