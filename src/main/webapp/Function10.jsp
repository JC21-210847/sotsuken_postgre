<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:useBean id="bean" class="query.Bean" scope="request" />
    
    <link href="style.css" rel="stylesheet">
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>機能10結果</title>
</head>
<body>

<h3>表示件数 <%=bean.getArea_Name_List().size() %>件</h3>
	
	<table>	
	<tbody>
		<tr class = "under">
			<td>地域</td>
			<td>取引回数</td>
		</tr>

		<% for(int i = 0; i < bean.getArea_Name_List().size(); i++){ %>
	  		<tr>
	  			<td><%=bean.getArea_Name_List().get(i)  %></td>
	  			<td><%=bean.getTransaction_price_List().get(i)  %> 回</td>
	  		</tr>
	  	<% } %>

	</tbody>
	</table>

</body>
</html>