package query;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Bean implements Serializable{
	private List<String> trade_date_List;
	private List<String> import_export_code_List;
	private List<String> country_code_List;
	private List<String> customs_code_List;
	private List<String> hs_code_List;
	private List<String> unit1_List;
	private List<String> unit2_List;
	private List<String> transaction_price_List;
	
	private List<String> country_name_List;
	private List<String> area_name_List;
	
	private List<String> round_List;
	
	private List<String> cases_List;
	
	private String time;
	
	public Bean() {
		this.trade_date_List = new ArrayList<>();
		this.import_export_code_List = new ArrayList<>();
		this.country_code_List = new ArrayList<>();
		this.customs_code_List = new ArrayList<>();
		this.hs_code_List = new ArrayList<>();
		this.unit1_List = new ArrayList<>();
		this.unit2_List = new ArrayList<>();
		this.transaction_price_List = new ArrayList<>();
		this.country_name_List = new ArrayList<>();
		this.area_name_List = new ArrayList<>();
		
		this.round_List = new ArrayList<>();
		
		this.cases_List = new ArrayList<>();
		
		this.time = "";
		
	}
	
	final private String query1 = "SELECT trade_date, transaction_price "
			+ "FROM trade_data_test "
			+ "WHERE trade_date "
			+ "between CAST(? AS INTEGER) and CAST(? AS INTEGER)"
			+ "limit 150000;";
	
	final private String query2 = "WITH p AS (SELECT country_code, transaction_price, hs_code FROM trade_data_test "
			+ "ORDER BY transaction_price DESC LIMIT 100000) "
			+ "SELECT c.country_name, p.transaction_price, p.hs_code FROM p LEFT OUTER JOIN country AS c USING(country_code);";
	
	final private String query3 = "WITH CountryCounts AS ("
			+ "	SELECT country_code, COUNT(*) AS cnt"
			+ "	FROM trade_data_test"
			+ "	GROUP BY country_code"
			+ "	)"
			+ "SELECT country_code"
			+ " FROM CountryCounts"
			+ " WHERE cnt = (SELECT MAX(cnt) FROM CountryCounts);";
	
	final private String query4 = "SELECT c.area_name, SUM(t_cnt.cnt) FROM "
			+ "(SELECT country_code, SUM(transaction_price) AS cnt FROM trade_data_test GROUP BY country_code) AS t_cnt "
			+ "INNER JOIN country c USING(country_code) "
			+ "GROUP BY c.area_name;";
	
	final private String query5 = "SELECT trade_date, import_export_code, country_code, customs_code, hs_code, unit1, unit2, transaction_price "
			+ "FROM trade_data_test ORDER BY transaction_price LIMIT 1000;";
	
	final private String query6 = "WITH sum_trs AS ("
			+ "	SELECT country_code, import_export_code, SUM(transaction_price) AS sum_price"
			+ "	FROM trade_data_test"
			+ "	GROUP BY country_code, import_export_code"
			+ ")"
			+ "SELECT country_name,"
			+ "	CASE"
			+ "		WHEN import_export_code = 1 THEN '輸入額割合(%)'"
			+ "		WHEN import_export_code = 2 THEN '輸出額割合(%)'"
			+ "	END,"
			+ "round(sum_price / (SELECT SUM(sum_price) FROM sum_trs c GROUP BY country_code HAVING m.country_code = c.country_code) * 100, 2) "
			+ "FROM sum_trs m JOIN country USING (country_code);";
	
	final private String query7Asc = "SELECT * FROM trade_data_test "
			+ "WHERE trade_date = CAST(? AS INTEGER) and country_code = CAST(? AS INTEGER) "
			+ "ORDER BY transaction_price;";
	
	final private String query7Desc = "SELECT * FROM trade_data_test "
			+ "WHERE trade_date = CAST(? AS INTEGER) and country_code = CAST(? AS INTEGER) "
			+ "ORDER BY transaction_price DESC;";
	
	final private String query8 = "select * from trade_data_test where 列名 != 'hs_code'";
	
	final private String query9Minus = "WITH sum_trs AS ("
			+ "	SELECT trade_date, import_export_code, SUM(transaction_price) AS sum_price"
			+ "	FROM trade_data_test"
			+ "	GROUP BY trade_date, import_export_code"
			+ ")"
			+ "SELECT trade_date AS \"貿易赤字年月\""
			+ " FROM sum_trs m"
			+ " WHERE import_export_code = 1 AND sum_price >= (SELECT sum_price FROM sum_trs c WHERE m.trade_date = c.trade_date AND import_export_code = 2);";

	final private String query9Plus = "WITH sum_trs AS ("
			+ "	SELECT trade_date, import_export_code, SUM(transaction_price) AS sum_price"
			+ "	FROM trade_data_test"
			+ "	GROUP BY trade_date, import_export_code"
			+ ")"
			+ "SELECT trade_date AS \"貿易赤字年月\""
			+ " FROM sum_trs m"
			+ " WHERE import_export_code = 1 AND sum_price <= (SELECT sum_price FROM sum_trs c WHERE m.trade_date = c.trade_date AND import_export_code = 2);";
	
	final private String query10 = "SELECT c.area_name, SUM(t_cnt.cnt) AS 取引金額 "
			+ "FROM (SELECT country_code, COUNT(*) AS cnt FROM trade_data_test GROUP BY country_code) AS t_cnt "
			+ "INNER JOIN country c USING(country_code) GROUP BY c.area_name;";
	
	
	public String getQuery1() {
		return query1;
	}

	public String getQuery2() {
		return query2;
	}

	public String getQuery3() {
		return query3;
	}

	public String getQuery4() {
		return query4;
	}

	public String getQuery5() {
		return query5;
	}

	public String getQuery6() {
		return query6;
	}

	public String getQuery7Asc() {
		return query7Asc;
	}

	public String getQuery7Desc() {
		return query7Desc;
	}

	public String getQuery8() {
		return query8;
	}

	public String getQuery9Minus() {
		return query9Minus;
	}
	
	public String getQuery9Plus() {
		return query9Plus;
	}

	public String getQuery10() {
		return query10;
	}



	public List<String> getTrade_date_List() {
		return trade_date_List;
	}

	public void setTrade_date_List(List<String> trade_date_List) {
		this.trade_date_List = trade_date_List;
	}
	
	public void addTrade_date_List(String trade_date_List) {
		this.trade_date_List.add(trade_date_List);
	}
	

	public List<String> getImport_export_code_List() {
		return import_export_code_List;
	}

	public void setImport_export_code_List(List<String> import_export_code_List) {
		this.import_export_code_List = import_export_code_List;
	}
	
	public void addImport_export_code_List(String import_export_code_List) {
		this.import_export_code_List.add(import_export_code_List);
	}
	

	public List<String> getCountry_code_List() {
		return country_code_List;
	}

	public void setCountry_code_List(List<String> country_code_List) {
		this.country_code_List = country_code_List;
	}
	
	public void addCountry_code_List(String country_code_List) {
		this.country_code_List.add(country_code_List);
	}
	

	public List<String> getCustoms_code_List() {
		return customs_code_List;
	}

	public void setCustoms_code_List(List<String> customs_code_List) {
		this.customs_code_List = customs_code_List;
	}
	
	public void addCustoms_code_List(String customs_code_List) {
		this.customs_code_List.add(customs_code_List);
	}
	

	public List<String> getHs_code_List() {
		return hs_code_List;
	}

	public void setHs_code_List(List<String> hs_code_List) {
		this.hs_code_List = hs_code_List;
	}
	
	public void addHs_code_List(String hs_code_List) {
		this.hs_code_List.add(hs_code_List);
	}
	

	public List<String> getUnit1_List() {
		return unit1_List;
	}

	public void setUnit1_List(List<String> unit1_List) {
		this.unit1_List = unit1_List;
	}
	
	public void addUnit1_List(String unit1_List) {
		this.unit1_List.add(unit1_List);
	}
	

	public List<String> getUnit2_List() {
		return unit2_List;
	}

	public void setUnit2_List(List<String> unit2_List) {
		this.unit2_List = unit2_List;
	}
	
	public void addUnit2_List(String unit2_List) {
		this.unit2_List.add(unit2_List);
	}
	

	public List<String> getTransaction_price_List() {
		return transaction_price_List;
	}

	public void setTransaction_price_List(List<String> transaction_price_List) {
		this.transaction_price_List = transaction_price_List;
	}
	
	public void addTransaction_price_List(String transaction_price_List) {
		this.transaction_price_List.add(transaction_price_List);
	}
	
	
	public List<String> getcountry_Name_List() {
		return country_name_List;
	}

	public void setCountry_Name_List(List<String> country_name_List) {
		this.country_name_List = country_name_List;
	}
	
	public void addCountry_Name_List(String country_name_List) {
		this.country_name_List.add(country_name_List);
	}
	
	
	public List<String> getArea_Name_List(){
		return area_name_List;
	}
	
	public void setArea_Name_List(List<String> area_name){
		this.area_name_List = area_name;
	}
	
	public void addArea_Name_List(String area_name) {
		this.area_name_List.add(area_name);
	}
	
	
	public List<String> getRound_List(){
		return round_List;
	}
	
	public void setRound_List(List<String> round_List) {
		this.round_List = round_List;
	}
	
	public void addRound_List(String round) {
		this.round_List.add(round);
	}
	
	
	public List<String> getCases_List(){
		return cases_List;
	}
	
	public void setCases_List(List<String> cases_List) {
		this.cases_List = cases_List;
	}
	
	public void addCases_List(String cases) {
		this.cases_List.add(cases);
	}

	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
}
