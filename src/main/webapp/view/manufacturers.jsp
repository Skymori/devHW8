<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>GOIT</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
        integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
        integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous">
    </script>
</head>
<body>
  <c:import url="/view/navibar.jsp"/>
  <table class="table table-hover" >
      <thead>
        <tr>
          <th scope="col">Name</th>
          <th scope="col">Amount of Products</th>
          <th scope="col">Products</th>
          <security:authorize access="hasRole('ROLE_ADMIN')">
            <th scope="col" colspan="2"></th>
          </security:authorize>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="entity" items="${entities}">
          <tr>
            <th scope="row">${entity.name}</th>
            <td>${entity.products.size()}</td>
              <td>
                <table>
                  <c:forEach var="product" items="${entity.products}">
                    <tr>[${product.name}], </tr>
                  </c:forEach>
                </table>
              </td>
            <!-- Access to update\delete operation -->
            <security:authorize access="hasRole('ROLE_ADMIN')">
              <td align="center">
                <a href="/manufacturers/form/update?id=${entity.id}">
                  <button class="btn btn-outline-info my-2 my-sm-0">Update</button>
                </a>
              </td>
              <td align="center">
                <a class="btn btn-outline-danger my-2 my-sm-0" href="#myModal" data-toggle="modal" data-id="${entity.id}">Delete</a>
              </td>
            </security:authorize>
          </tr>
        </c:forEach>
      </tbody>
    </table>

    <!-- Modal window with warning for delete operation -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="myModalLabel">Attention</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            If you want to delete manufacturer all related products will be deleted as well.
            Are you sure you want to continue?
          </div>
          <div class="modal-footer">
            <a class="btn btn-danger" href="#">Delete anyway</a>
          </div>
        </div>
      </div>
    </div>

    <!-- script for sending entity.id in modal "Delete anyway" button --!>
    <script>
        $('#myModal').on('show.bs.modal', function (e) {
          var id = $(e.relatedTarget).data('id')
          var href = '/manufacturers/delete?id=' + id
          $('.btn-danger', this).attr('href', href)
        })
    </script>
</body>
</html>