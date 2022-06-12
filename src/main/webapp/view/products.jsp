<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>GOIT</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
  <c:import url="/view/navibar.jsp"/>
  <table class="table table-hover" >
    <thead>
      <tr>
        <th scope="col">Name</th>
        <th scope="col">Price</th>
        <th scope="col">Manufacturer</th>
        <security:authorize access="hasRole('ROLE_ADMIN')">
          <th scope="col" colspan="2"></th>
        </security:authorize>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="entity" items="${entities}">
        <tr>
          <th scope="row">${entity.name}</th>
          <td>${entity.price}</td>
          <td>${entity.manufacturers.name}</td>
          <security:authorize access="hasRole('ROLE_ADMIN')">
            <td align="center">
              <a href="/products/form/update?id=${entity.id}">
                <button class="btn btn-outline-info my-2 my-sm-0">Update</button>
              </a>
            </td>
            <td align="center">
              <a href="/products/delete?id=${entity.id}">
                <button class="btn btn-outline-danger my-2 my-sm-0">Delete</button>
              </a>
            </td>
          </security:authorize>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</body>
</html>