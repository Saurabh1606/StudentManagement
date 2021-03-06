<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="crt"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@page isELIgnored="false"%>

<c:url var="addUrl" value="/ctl/Marksheet" />

<c:url var="addSearch" value="/ctl/Marksheet/Search" />

<c:url var="editUrl" value="/ctl/Marksheet?id=" />
<div style="width: 100%;background-color: #04091e;height: 69px; padding: 19px ;margin-top: 68px" >
<h2 style="color: white; font-family:inherit;">Marksheet List</h2></div>
<br><br>
<sf:form action="${addSearch}" method="post"
						 commandName="form">
<div class="container">
	<div class="col-lg-12 well">
	<div class="row">
					<div class="col-sm-12">
					<div class="row">
					<s:bind path="name">
							<div class="col-sm-3 form-group">
								<sf:input path="name" placeholder="Search By Student Name" class="form-control" />
							</div>
							</s:bind>
							<s:bind path="rollNo">
							<div class="col-sm-3 form-group">
								<sf:input path="rollNo" placeholder="Search By Roll No" class="form-control" />
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
					<th><input type="checkbox" id="selectall">Select All</th>
					<th scope="col">Roll No.</th>
					<th scope="col">Student Name</th>
					<th scope="col">Physics</th>
					<th scope="col">Chemistry</th>
					<th scope="col">Maths</th>
					<th scope="col">total</th>
					<th scope="col">Result</th>
					<th scope="col">Edit</th>
				
				</tr>
			</thead>
			<c:forEach items="${list}" var="marksheet" varStatus="ct">
			<tbody>
				<tr>
					<td><input type="checkbox" name="ids"  class="case" value="${marksheet.id}"></td>
									<td><c:out value="${marksheet.rollNo}" /></td>
									<td><c:out value="${marksheet.name}" /></td>
									<td><c:out value="${marksheet.physics}" /></td>
									<td><c:out value="${marksheet.chemistry}" /></td>
									<td><c:out value="${marksheet.maths}" /></td>
									<td><c:out value="${marksheet.physics + marksheet.chemistry +marksheet.maths}" /></td>
									<td><c:out value="${(marksheet.chemistry >35 && marksheet.maths>35 && marksheet.physics>35)?'Pass':'Fail'} " > </c:out> </td>
								
									<td><a class="btn btn-success" href="${editUrl}${marksheet.id}"> Edit</a></td>
					
					</tr>
					
				
				
			</tbody>
				</c:forEach>
		</table>
		
		<table width="99%">
				<tr>
					<td><input type="submit" name="operation" <c:if test="${form.pageNo == 1}">disabled="disabled"</c:if>
								class="btn btn-primary" value="Previous"
								></td>
						
				
						<td><input type="submit" name="operation" <c:if test="${listsize== 0}">disabled="disabled"</c:if>
								class="btn btn-primary" value="Delete"
								></td>
			     
				
				
					<td align="right"><input type="submit" name="operation" <c:if test="${total == pagenosize  || listsize < pageSize   }">disabled="disabled"</c:if>
								class="btn btn-primary" value="Next"></td>

				</tr>
			</table>
		
		
	</sf:form>
<br><br>
