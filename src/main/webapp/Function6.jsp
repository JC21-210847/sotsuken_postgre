<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:useBean id="bean" class="query.Bean" scope="request" />
    <link href="style.css" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>機能6結果</title>
</head>
<body>
<a href="./index.jsp">機能選択に戻る</a>

<h3>表示件数 <%=bean.getcountry_Name_List().size() %>件</h3>
	
	<table>	
	<tbody>
		<tr class = "under">
			<td>国名</td>
			<td></td>
			<td>割合</td>
		</tr>

		<% for(int i = 0; i < bean.getcountry_Name_List().size(); i++){ %>
	  		<tr>
	  			<td><%=bean.getcountry_Name_List().get(i)  %></td>
	  			
	  			<td><%=bean.getCases_List().get(i) %></td>
	  			
	  			<td><%=bean.getRound_List().get(i) %>%</td>
	  			
	  		</tr>
	  	<% } %>

	</tbody>
	</table>

</body>
</html>