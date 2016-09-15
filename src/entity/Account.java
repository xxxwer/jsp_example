package entity;
	
// import 

public class Account{
	private int id_account;
	private int id_user;
	private String first_name;
	private String last_name;

	public void setIdAccount(int id){
		this.id_account = id;
	}

	public void setIdUser(int id){
		this.id_user = id;
	}

	public void setFirstName(String name){
		this.first_name = name;
	}

	public void setLastName(String name){
		this.last_name = name;
	}	

	public int getIdAccount(){
		return this.id_account;
	}

	public int getIdUser(){
		return this.id_user;
	}

	public String getFirstName(){
		return this.first_name;
	}

	public String getLastName(){
		return this.last_name;
	}
}

