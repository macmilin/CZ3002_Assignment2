package LoginDemo;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	private String msg;
	private String username, pass;
	DBConnector db = new DBConnector();

	@Override
	public String execute() throws Exception {
		msg = db.getUser(username, pass); //change name to the sql function
		if (msg.startsWith("Sorry")) {
			return "FAILURE";
		} else {
			return "SUCCESS";
		}
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}