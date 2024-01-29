<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:useBean id="bean" class="query.Bean" scope="request" />
    <link href="style.css" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>機能9結果</title>
</head>
<body>
<a href="./index.jsp">機能選択に戻る</a>

<h3>表示件数 <%=bean.getTrade_date_List().size() %>件</h3>
	
	<table>	
	<tbody>
	<tr class = "under">
			<td>年月</td>
		</tr>

		<% for(int i = 0; i < bean.getTrade_date_List().size(); i++){ %>
	  		<tr>
	  			<td>年月</td>
	  			<td><%=bean.getTrade_date_List().get(i)  %></td>
	  		</tr>
	  	<% } %>

	</tbody>
	</table>

</body>
</html>