<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:useBean id="bean" class="query.Bean" scope="request" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>結果出力画面</title>
</head>
<body>
	
	<table>	
	<tbody>

		<% for(int i = 0; i < bean.getArea_Name_List().size(); i++){ %>
	  		<tr>
	  			<td>地域</td>
	  			<td><%=bean.getArea_Name_List().get(i)  %></td>
	  			<td>取引金額</td>
	  			<td><%=bean.getTransaction_price_List().get(i)  %></td>
	  		</tr>
	  	<% } %>

	</tbody>
	</table>

</body>
</html>