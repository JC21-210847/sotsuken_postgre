<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:useBean id="bean" class="query.Bean" scope="request" />
    
    <link href="style.css" rel="stylesheet">
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>機能7結果</title>
</head>
<body>

<h3>表示件数 <%=bean.getTrade_date_List().size() %>件</h3>
<h4>データベース処理時間 <%=bean.getTime() %>秒</h4>
	
	<table>	
	<tbody>
		<tr class = "under">
			<td>年月</td>
			<td>輸出 0 /輸入 1</td>
			<td>国コード</td>
			<td>関税</td>
			<td>HSコード</td>
			<td>第1単位</td>
			<td>第2単位</td>
			<td>金額</td>
		</tr>

		<% for(int i = 0; i < bean.getTrade_date_List().size(); i++){ %>
	  		<tr>
	  			
	  			<td><%=bean.getTrade_date_List().get(i)  %></td>
	  			
	  			
	  			<td><%=bean.getImport_export_code_List().get(i)  %></td>
	  			
	  			
	  			<td><%=bean.getCountry_code_List().get(i)  %></td>
	  			
	  			
	  			<td><%=bean.getCustoms_code_List().get(i)  %></td>
	  			
	  			
	  			<td><%=bean.getHs_code_List().get(i)  %></td>
	  			
	  			
	  			<td><%=bean.getUnit1_List().get(i)  %></td>
	  			
	  			
	  			<td><%=bean.getUnit2_List().get(i)  %></td>
	  			
	  			
	  			<td><%=bean.getTransaction_price_List().get(i)  %></td>
	  		</tr>
	  	<% } %>

	</tbody>
	</table>

</body>
</html>