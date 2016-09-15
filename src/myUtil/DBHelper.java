package myUtil;

import java.lang.ClassNotFoundException;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;


public class DBHelper{
	private String url = "jdbc:mysql://localhost:3306/v2_shrinkstack?useUnicode=true&characterEncoding=utf-8&useSSL=false" ;    
	private	String username = "root" ;   
	private	String password = "mevb" ;

	private Connection conn = null;

	// for test
	public static void main(String[] args) {
		try{
			DBHelper t = new DBHelper();
			Connection con = t.getMysqlConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from account");

			while( rs.next() ){
				System.out.println(rs.getString("email"));
			}

		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public Connection getMysqlConnection(){
		try{   
	    	//加载MySql的驱动类   
	    	//下载了（mysql-connector-java-5.1.39-bin.jar） jdbc for mysql 的jar包, 再把它放到“/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/ext/” jre lib的目录下
	    	Class.forName("com.mysql.jdbc.Driver") ;   
	    }catch(ClassNotFoundException e){   
		    System.out.println("link mysql DB failed, 1");   
		    e.printStackTrace() ;   
	    }

		   
		try{
			if (this.conn == null) {
				this.conn = DriverManager.getConnection(this.url , this.username , this.password ) ; 
			}   
		}catch(SQLException se){   
			System.out.println("link mysql DB failed, 2");   
			se.printStackTrace() ;   
		}

		return this.conn;


	}

}
