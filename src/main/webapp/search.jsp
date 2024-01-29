<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>検索結果</title>
</head>
<body>
    <h1>検索結果</h1>

    <%-- 検索キーワード取得 --%>
    <% String searchTerm = request.getParameter("searchTerm"); %>

    <%-- データベース接続情報 --%>
    <% String jdbcUrl = "jdbc:mysql://localhost:3306/your_database";
       String jdbcUser = "210520";
       String jdbcPassword = "225588";
       try {
           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection connection = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);

           // データベース検索クエリ
           String sql = "SELECT * FROM your_table WHERE column_name LIKE ?";
           try (PreparedStatement statement = connection.prepareStatement(sql)) {
               statement.setString(1, "%" + searchTerm + "%");
               ResultSet resultSet = statement.executeQuery();

               // 検索結果表示
               while (resultSet.next()) {
                   // データベースから取得した結果を表示
                   out.println("ID: " + resultSet.getInt("id") + "<br>");
                   out.println("Name: " + resultSet.getString("name") + "<br>");
                   // 他のカラムも同様に表示
                   out.println("<hr>");
               }
           }

           connection.close();
       } catch (Exception e) {
           out.println("エラー: " + e.getMessage());
       }
    %>
</body>
</html>
