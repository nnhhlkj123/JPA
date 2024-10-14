package vn.iostar.entity;

import java.io.Serializable;
import java.util.Date;

import jakarta.persistence.*;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "users")
@NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")
public class User implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "email", columnDefinition = "VARCHAR(255) NOT NULL")
	private String email;

	@Column(name = "username", columnDefinition = "VARCHAR(255) NOT NULL")
	private String userName;

	@Column(name = "fullname", columnDefinition = "NVARCHAR(255) NULL")
	private String fullName;

	@Column(name = "password", columnDefinition = "VARCHAR(255) NOT NULL")
	private String passWord;

	@Column(name = "avatar", columnDefinition = "NVARCHAR(255) NULL")
	private String avatar;

	@Column(name = "roleid")
	private int roleid;

	@Column(name = "phone", columnDefinition = "VARCHAR(20) NULL")
	private String phone;

	@Column(name = "created_date")
	@Temporal(TemporalType.TIMESTAMP)
	private Date createdDate;

	// Add any necessary relationships here (e.g., with other entities)

	// Getters and setters (if not using Lombok)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public int getRoleid() {
		return roleid;
	}

	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
}
