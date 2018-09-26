package journey.diary.test.VO;

public class User {
	private int userno;
	private String useremail;
	private String username;
	private String userpassword;
	private String regdate;
	private String logdate;
	private String approvalstatus;
	private int approvalkey;
	private String userimg;
	private String gender;
	private String stamp;

	public User() {
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getUseremail() {
		return useremail;
	}

	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpassword() {
		return userpassword;
	}

	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getLogdate() {
		return logdate;
	}

	public void setLogdate(String logdate) {
		this.logdate = logdate;
	}

	public String getApprovalstatus() {
		return approvalstatus;
	}

	public void setApprovalstatus(String approvalstatus) {
		this.approvalstatus = approvalstatus;
	}

	public int getApprovalkey() {
		return approvalkey;
	}

	public void setApprovalkey(int approvalkey) {
		this.approvalkey = approvalkey;
	}

	public String getUserimg() {
		return userimg;
	}

	public void setUserimg(String userimg) {
		this.userimg = userimg;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getStamp() {
		return stamp;
	}

	public void setStamp(String stamp) {
		this.stamp = stamp;
	}

	@Override
	public String toString() {
		return "User [userno=" + userno + ", useremail=" + useremail + ", username=" + username + ", userpassword="
				+ userpassword + ", regdate=" + regdate + ", logdate=" + logdate + ", approvalstatus=" + approvalstatus
				+ ", approvalkey=" + approvalkey + ", userimg=" + userimg + ", gender=" + gender + ", stamp=" + stamp
				+ "]";
	}

	
}
