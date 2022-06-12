<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="endpoint" value="${requestScope['javax.servlet.forward.servlet_path']}"/>
<c:choose>
    <c:when test="${endpoint == '/products/form/add'}">
        <c:set var="action" value="Create"/>
    </c:when>
    <c:otherwise>
        <c:set var="action" value="Edit"/>
    </c:otherwise>
</c:choose>

<!DOCTYPE html>
<html>
<head>
    <title>GOIT</title>
    <link href="${contextPath}/view/css/common.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <form:form method="POST" modelAttribute="entityForm" class="form-signin" action="/products">
            <h2 class="form-signin-heading">${action} product</h2>
            <form:input type="hidden" path="id" value="${entityForm.id}"/>

            <spring:bind path="name">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input class="form-control" type="text" path="name" name="name" placeholder="name" autofocus="true"></form:input>
                    <form:errors path="name"></form:errors>
                </div>
            </spring:bind>

        <span>${message}</span>
            <spring:bind path="price">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:input class="form-control" type="number" step="0.01" path="price" name="price" placeholder="price" autofocus="true"></form:input>
                    <form:errors path="price"></form:errors>
                </div>
            </spring:bind>

            <spring:bind path="manufacturers">
                <form:select class="form-control form-control-lg" path="manufacturers" name="manufacturers" items="${manufacturers}" itemLabel="name" itemValue="id" />
            </spring:bind>

          <button class="btn btn-outline-success btn-block" type="submit">Submit</button>
        </form:form>
    </div>

</body>
</html>