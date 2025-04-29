package com.islington.model;
import java.time.LocalDate;
public class ProgramModel {
	private int Id;
	private String First_Name;
	private String Last_Name;
	private String Username;
	private LocalDate Birthday;
	private String Gender;
	private String Email;
	private String Phone_Number;
	private String Password;
	private String ImageUrl;
	public ProgramModel() {
	}
	public ProgramModel(int id, String first_Name, String last_Name, String username, LocalDate birthday, String gender,
			String email, String phone_Number, String password, String imageUrl) {
		super();
		Id = id;
		First_Name = first_Name;
		Last_Name = last_Name;
		Username = username;
		Birthday = birthday;
		Gender = gender;
		Email = email;
		Phone_Number = phone_Number;
		Password = password;
		ImageUrl = imageUrl;
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getFirst_Name() {
		return First_Name;
	}
	public void setFirst_Name(String first_Name) {
		First_Name = first_Name;
	}
	public String getLast_Name() {
		return Last_Name;
	}
	public void setLast_Name(String last_Name) {
		Last_Name = last_Name;
	}
	public String getUsername() {
		return Username;
	}
	public void setUsername(String username) {
		Username = username;
	}
	public LocalDate getBirthday() {
		return Birthday;
	}
	public void setBirthday(LocalDate birthday) {
		Birthday = birthday;
	}
	public String getGender() {
		return Gender;
	}
	public void setGender(String gender) {
		Gender = gender;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPhone_Number() {
		return Phone_Number;
	}
	public void setPhone_Number(String phone_Number) {
		Phone_Number = phone_Number;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getImageUrl() {
		return ImageUrl;
	}
	public void setImageUrl(String imageUrl) {
		ImageUrl=imageUrl;
	}
}
