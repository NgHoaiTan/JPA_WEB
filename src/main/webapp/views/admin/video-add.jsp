<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/commons/taglib.jsp"%>
<form action="<c:url value = "/admin/video/insert"/>" method="post" enctype="multipart/form-data">
  <label for="title">Title:</label><br>
  <input type="text" id="title" name="title"><br>

  <label for="poster">Poster</label><br>

  <c:if test="${video.poster.substring(0,5) =='https'}">
    <c:url value="${video.poster}" var="imgUrl"></c:url>
  </c:if>
  <c:if test="${video.postersubstring(0,5) !='https'}">
    <c:url value="/image?fname=${video.poster}" var="imgUrl"></c:url>
  </c:if>

  <td><img height="150" width="200" src="${imgUrl}" id="imagess"/></td>
  <td>${video.poster}</td><br>

  <label for="poster">Upload file:</label><br>
  <input type="file" onchange="chooseFile(this) " id="poster" name="poster"> <br>

  <label for="poster">Choose Category:</label><br>
  <select name="categoryid" id="categoryid">
    <c:forEach items= "${listCate}" var="cate">
      <option value = ${cate.categoryid}>${cate.categoryname}</option>
    </c:forEach>
  </select><br>

  <label for="status">Status:</label><br>

  <input type="radio" id="statuson" name="active" value="1">
  <label for="fname">Hoạt động</label><br>
  <input type="radio" id="statusoff" name="active" value="0">
  <label for="fname">Không Hoạt động</label><br>

  <label for="description">Description:</label><br>
  <input type="text" id="description" name="description"><br>

  <hr>
  <input type="submit" value="Insert">
</form>
