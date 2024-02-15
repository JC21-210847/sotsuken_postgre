package query;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ConnectionTest")
public class ConnectionTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
		final String dbServer = "192.168.54.215";
		final String dbPort = "5432";
		final String dbName = "sotsuken";
		final String user = "postgres";
		final String pass = "postgres";

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Bean bean = new Bean();
		
		String dterm = request.getParameter("dterm");
		String query;
		PreparedStatement stmt;
		ResultSet rs;
		String func = "";
		
		String url = "jdbc:postgresql://"+dbServer+":" + dbPort + "/" +dbName;
		response.setContentType("text/html;charset=UTF-8");
		
		double start = System.currentTimeMillis();
		
		try {
			
			System.out.println("接続");
			Class.forName("org.postgresql.Driver");
			Connection conn = DriverManager.getConnection(url, user, pass);
			
			
			switch (dterm) {
			case "1":
				func = "/Function1.jsp";
				String from = request.getParameter("from");
				String to = request.getParameter("to");
				
				query = bean.getQuery1();
				stmt = conn.prepareStatement(query);
				stmt.setString(1, from);
				stmt.setString(2, to);
				
				rs = stmt.executeQuery();
				while(rs.next()) {
					bean.addTrade_date_List(rs.getString("trade_date"));
					bean.addTransaction_price_List(rs.getString("transaction_price"));
				}
				break;
			case "2":
				func = "/Function2.jsp";
				query = bean.getQuery2();
				stmt = conn.prepareStatement(query);
				
				rs = stmt.executeQuery();
				while(rs.next()) {
					bean.addCountry_Name_List(rs.getString("country_name"));
					bean.addTransaction_price_List(rs.getString("transaction_price"));
					bean.addHs_code_List(rs.getString("hs_code"));
				}
				break;
			case "3":
				func = "/Function3.jsp";
				query = bean.getQuery3();
				stmt = conn.prepareStatement(query);
				
				rs = stmt.executeQuery();
				while(rs.next()) {
					bean.addCountry_code_List(rs.getString("country_code"));
				}
				break;
			case "4":
				func = "/Function4.jsp";
				query = bean.getQuery4();
				stmt = conn.prepareStatement(query);
				
				rs = stmt.executeQuery();
				while(rs.next()) {
					bean.addArea_Name_List(rs.getString("area_name"));
					AmountFormatter formatter = new AmountFormatter((rs.getString("sum")));
					String formattedAmount = formatter.formatAmount();
					bean.addTransaction_price_List(formattedAmount);
				}
				break;
			case "5":
				func = "/Function5.jsp";
				query = bean.getQuery5();
				stmt = conn.prepareStatement(query);
				
				rs = stmt.executeQuery();
				while(rs.next()) {
					bean.addTrade_date_List(rs.getString("trade_date"));
					bean.addImport_export_code_List(rs.getString("import_export_code"));
					bean.addCountry_code_List(rs.getString("country_code"));
					bean.addCustoms_code_List(rs.getString("customs_code"));
					bean.addHs_code_List(rs.getString("hs_code"));
					bean.addUnit1_List(rs.getString("unit1"));
					bean.addUnit2_List(rs.getString("unit2"));
					bean.addTransaction_price_List(rs.getString("transaction_price"));
				}
				break;
			case "6":
				func = "/Function6.jsp";
				query = bean.getQuery6();
				stmt = conn.prepareStatement(query);
				
				rs = stmt.executeQuery();
				while(rs.next()) {
					bean.addCountry_Name_List(rs.getString("country_name"));
					bean.addCases_List(rs.getString("case"));
					bean.addRound_List(rs.getString("round"));
				}
				break;
			case "7":
				func = "/Function7.jsp";
				String ad = request.getParameter("ad");
				
				String searchDate = request.getParameter("searchDate");
				String c_name7 = request.getParameter("country_Name7");
				c_name7 = ChangeCountry.Change(c_name7);
				
				if(ad.equals("ASC")) {
					query = bean.getQuery7Asc();
				}else {
					query = bean.getQuery7Desc();
				}
				stmt = conn.prepareStatement(query);
				stmt.setString(1, searchDate);
				stmt.setString(2, c_name7);
				
				rs = stmt.executeQuery();
				
				while(rs.next()) {
					bean.addTrade_date_List(rs.getString("trade_date"));
					bean.addImport_export_code_List(rs.getString("import_export_code"));
					bean.addCountry_code_List(rs.getString("country_code"));
					bean.addCustoms_code_List(rs.getString("customs_code"));
					bean.addHs_code_List(rs.getString("hs_code"));
					bean.addUnit1_List(rs.getString("unit1"));
					bean.addUnit2_List(rs.getString("unit2"));
					bean.addTransaction_price_List(rs.getString("transaction_price"));
				}
				break;
			case "8":
				func = "/index.jsp";
				
				break;
			case "9":
				func = "/Function9.jsp";
				String io = request.getParameter("io");
				
				if(io.equals("minus")) {
					query = bean.getQuery9Minus();
				}else {
					query = bean.getQuery9Plus();
				}
				stmt = conn.prepareStatement(query);
				
				rs = stmt.executeQuery();
				while(rs.next()) {
					bean.addTrade_date_List(rs.getString("貿易赤字年月"));
				}
				break;
			case "10":
				func = "/Function10.jsp";
				query = bean.getQuery10();
				stmt = conn.prepareStatement(query);
				
				rs = stmt.executeQuery();
				while(rs.next()) {
					bean.addArea_Name_List(rs.getString("area_name"));
					AmountFormatter formatter = new AmountFormatter((rs.getString("取引金額")));
					String formattedAmount = formatter.formatAmount();
					bean.addTransaction_price_List(formattedAmount);
				}
				break;
			default:
				System.out.println("デフォルト");
				break;
			}
			
			System.out.println("切断");
			conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		double end = System.currentTimeMillis();
		
		double time = end - start;
		
		double timer = time / 1000.0;
		
		String strStart = String.valueOf(timer);
		
		bean.setTime(strStart);
		
		request.setAttribute("bean", bean);
		request.getRequestDispatcher(func).forward(request, response);
	}

}
