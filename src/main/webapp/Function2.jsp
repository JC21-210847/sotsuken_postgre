<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:useBean id="bean" class="query.Bean" scope="request" />
    
    <link href="style.css" rel="stylesheet">
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>機能2結果</title>
</head>
<body>
<a href="./index.jsp">機能選択に戻る</a>

<h3>表示件数 <%=bean.getcountry_Name_List().size() %>件</h3>
	
	<table>	
	<tbody>
		<tr class = "under">
			<td>国名</td>
			<td>金額</td>
			<td>HSコード</td>
		</tr>

		<% for(int i = 0; i < bean.getcountry_Name_List().size(); i++){ %>
	  		<tr>
	  			
	  			<td><%=bean.getcountry_Name_List().get(i)  %></td>
	  			
	  			<td><%=bean.getTransaction_price_List().get(i) %> 百万</td>
	  			
	  			<td><%=bean.getHs_code_List().get(i) %></td>
	  			
	  		</tr>
	  	<% } %>

	</tbody>
	</table>

</body>
</html>