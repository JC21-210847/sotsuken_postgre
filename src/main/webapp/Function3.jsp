<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:useBean id="bean" class="query.Bean" scope="request" />
    
    <link href="style.css" rel="stylesheet">
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>機能3結果</title>
</head>
<body>

<h3>表示件数 <%=bean.getCountry_code_List().size() %>件</h3>
<h4>データベース処理時間 <%=bean.getTime() %>秒</h4>
	
	<table>	
	<tbody>
		<tr class = "under">
			<td>国名</td>
		</tr>

		<% for(int i = 0; i < bean.getCountry_code_List().size(); i++){ %>
	  		<tr>
	  			<td><%=bean.getCountry_code_List().get(i)  %></td>	  			
	  			
	  		</tr>
	  	<% } %>

	</tbody>
	</table>

</body>
</html>