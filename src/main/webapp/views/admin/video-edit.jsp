<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/commons/taglib.jsp" %>

<form action="<c:url value="/admin/video/update"/>" method="get" enctype="multipart/form-data">
  <input type="text" id="videoId" name="videoId" value="${video.videoId}" hidden="hidden" >

  <label for="title">Title:</label><br>
  <input type="text" id="title" name="title" value="${video.title}"><br>

  <label for="images">Poster</label><br>

  <c:if test="${video.poster.substring(0,5) =='https'}">
    <c:url value="${video.poster}" var="imgUrl"></c:url>
  </c:if>
  <c:if test="${video.poster.substring(0,5) !='https'}">
    <c:url value="/image?fname=${video.poster}" var="imgUrl"></c:url>
  </c:if>

  <td><img height="150" width="200" src="${imgUrl}" id="imagess"/></td><br>

  <label for="images">Upload file:</label>
  <input type="file" onchange="chooseFile(this) " id="images" name="poster"> <br>

  <label for="categoryid">Choose Category:</label><br>
  <select name="categoryid" id="categoryid" >
    <c:forEach items= "${listCate}" var="cate">
      <option value = ${cate.categoryid}>${cate.categoryname}</option>
    </c:forEach>
  </select><br>

  <label for="status">Status:</label><br>
  <input type="radio" id=statuson" name="active" value="1" ${video.active==1?'checked':''}>
  <label for="status">Hoạt động</label><br>
  <input type="radio" id=statusoff" name="active" value="0" ${video.active==0?'checked':''}>
  <label for="status">Khóa</label><br>

  <label for="description">Description:</label><br>
  <input type="text" id="description" name="description" value="${video.description}"><br>

  <input type="submit" value="Insert">
</form>