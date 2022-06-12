<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="endpoint" value="${requestScope['javax.servlet.forward.servlet_path']}"/>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="${pageContext.request.contextPath}/">Home</a>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="nav nav-tabs" >
      <li class="nav-item">
        <a class="nav-link active" href="${pageContext.request.contextPath}/manufacturers">Manufacturers</a>
      </li>
      <li class="nav-item">
        <a class="nav-link active" href="${pageContext.request.contextPath}/products">Products</a>
      </li>
      <security:authorize access="hasRole('ROLE_ADMIN')">
        <li class="nav-item">
          <a class="nav-link disabled" href="${pageContext.request.contextPath}/users">Users</a>
      </security:authorize>
    </ul>
    <security:authorize access="hasRole('ROLE_ADMIN')">
      <c:if test="${endpoint != '/'}">
         <form class="form-inline my-2 my-lg-0" action="${endpoint}/form/add">
           <button class="btn btn-warning my-2 my-sm-0" type="submit">New</button>
         </form>
      </c:if>
    </security:authorize>
    <ul class="navbar-nav mr-auto"></ul>
    <form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/logout">
      <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">Logout</button>
    </form>
  </div>
</nav>




