package dao;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import entity.Account;
import myUtil.DBHelper;

public class AccountDAO{
	public ArrayList<Account> getAllAccount(){
		Connection conn = null;
		PreparedStatement p_stmt = null;
		ResultSet rs = null;

		ArrayList<Account> list = new ArrayList<Account>();
		try{
			DBHelper db = new DBHelper();
			conn = db.getMysqlConnection();
			String sql = "select * from account;";
			p_stmt = conn.prepareStatement(sql);
			rs = p_stmt.executeQuery();

			while( rs.next() ){
				Account a = new Account();
				a.setIdAccount( rs.getInt("id_account") );
				a.setIdUser( rs.getInt("id_user") );
				a.setFirstName( rs.getString("first_name") );
				a.setLastName( rs.getString("last_name") );
				list.add(a);
			}

			return list;
		} 
		catch (Exception e) {
			e.printStackTrace();
			return null;
		} 
		finally  {
			if (rs != null) {
				try{
					rs.close();
					rs = null;
				}
				catch (Exception e) {
					e.printStackTrace();
				}
			}

			if (p_stmt != null) {
				try{
					p_stmt.close();
					p_stmt = null;
				}
				catch (Exception e) {
					e.printStackTrace();
				}
			}

		}
	}

}