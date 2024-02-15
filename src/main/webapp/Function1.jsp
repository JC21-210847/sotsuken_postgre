<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:useBean id="bean" class="query.Bean" scope="request" />
    
    <link href="style.css" rel="stylesheet">
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>機能1結果</title>
</head>
<body>
	
	<h3>表示件数 <%=bean.getTrade_date_List().size() %>件</h3>
	<h4>データベース処理時間 <%=bean.getTime() %>秒</h4>
	
	<table>	
	<tbody>
		<tr class = "under">
			<td>年月</td>
			<td>金額</td>
		</tr>

		<% for(int i = 0; i < bean.getTrade_date_List().size(); i++){ %>
	  		<tr>
	  			
	  			<td><%=bean.getTrade_date_List().get(i)  %></td>
	  			
	  			
	  			<td><%=bean.getTransaction_price_List().get(i) %> 千円</td>
	  			
	  		</tr>
	  	<% } %>

	</tbody>
	</table>

</body>
</html>