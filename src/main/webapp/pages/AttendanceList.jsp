<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@page isELIgnored="false"%>

<c:url var="addUrl" value="/ctl/Attendance" />

<c:url var="addSearch" value="/ctl/Attendance/Search" />

<c:url var="editUrl" value="/ctl/Attendance?id=" />

<div style="width: 100%;background-color: #04091e;height: 69px; padding: 19px ;margin-top: 68px" >
<h2 style="color: white; font-family:inherit;">Attendance List</h2></div>
<br><br>
<sf:form action="${addSearch}" method="post"
						 commandName="form">
<div class="container">
	<div class="col-lg-12 well">
	<div class="row">
					<div class="col-sm-12">
					<div class="row">
							<s:bind path="studentName">
							<div class="col-sm-3 form-group">
								<sf:input path="studentName" placeholder="Search By Student Name" class="form-control" />
							</div>
							</s:bind>
							
							<div class="col-sm-3 form-group">
								
								<input type="submit"
                       			 name="operation" class="btn btn-md btn-info" value="Search" >
                       			 <input type="submit"
                       			 name="operation" class="btn btn-md btn-info" value="Reset" >
							</div>
						</div>					
			</div>		
		</div>
	</div>
</div>
     
					

					<sf:input type="hidden" path="pageNo" />
					<sf:input type="hidden" path="pageSize" />

					<sf:input type="hidden" path="listsize" />
					<sf:input type="hidden" path="total" />
					<sf:input type="hidden" path="pagenosize" />
					<b><%@include file="BusinessMessage.jsp"%></b>
<table class="table">
			<thead class="thead-dark">
				<tr>
				<c:choose>
           			<c:when test="${sessionScope.roleLogin.id != 2}">
					<th><input type="checkbox" id="selectall">Select All</th>
					</c:when></c:choose>
					<th scope="col">Subject Name</th>
					<th scope="col">Student Name</th>
					<th scope="col">Lecture Name</th>
					<th scope="col">Date</th>
					<th scope="col">Description</th>
					
					<c:choose>
           			<c:when test="${sessionScope.roleLogin.id != 2}">
					<th scope="col">Edit</th>
					</c:when>
					</c:choose>
				</tr>
			</thead>
			 <c:forEach items="${list}" var="att" varStatus="ct">
			<tbody>
				<tr>
				<c:choose>
				<c:when test="${sessionScope.roleLogin.id != 2}">
					<td ><input type="checkbox" class="case"
						name="ids" value="${att.id}"></td>
					</c:when>
					</c:choose>
					<td><c:out value="${att.subjectName}"/></td>
					<td><c:out value="${att.studentName}"/></td>
					<td><c:out value="${att.lectureTitle}"/></td>
					<td><fmt:formatDate pattern="MM/dd/yyyy"
											value="${att.date}" /></td>
					<td><c:out value="${att.description}"/></td>
					<c:choose>
           			<c:when test="${sessionScope.roleLogin.id != 2}">
					<td align="center">
						<a class="btn btn-success" href="${editUrl}${att.id}">Edit</a> 
					</td>
					</c:when>
					</c:choose>
					</tr>
					</c:forEach>
				
				
			</tbody>
		</table>
		
		<table width="99%">
				<tr>
					<td><input type="submit" name="operation" <c:if test="${form.pageNo == 1}">disabled="disabled"</c:if>
								class="btn btn-primary" value="Previous"
								></td>
						
					<c:choose>
           			<c:when test="${sessionScope.roleLogin.id != 2}">
						<td><input type="submit" name="operation" <c:if test="${listsize== 0}">disabled="disabled"</c:if>
								class="btn btn-primary" value="Delete"
								></td>
			     </c:when>
			     </c:choose>
				
				
					<td align="right"><input type="submit" name="operation" <c:if test="${total == pagenosize  || listsize < pageSize   }">disabled="disabled"</c:if>
								class="btn btn-primary" value="Next"></td>

				</tr>
			</table>
		
	
	</sf:form>
<br><br>
	