package login;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

public class AccountDao {
	private PreparedStatement ps = null;
	private Connection conn = null;
	private ResultSet rs = null;
	
	private static AccountDao instance;
	
	private AccountDao() {
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
			System.out.println("드라이버 로드 & DB 로그인 성공");
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static AccountDao getInstance() {
		if(instance == null) {
			instance = new AccountDao();
		}
		return instance;
	}
	
	public int insertAccount(AccountBean ab) {
		int cnt = -1;
		
		String sql = "insert into account values(accseq.nextval,?,?,?,?,?,?,?,?,?,default)";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,ab.getId());
			ps.setString(2,ab.getPw());
			ps.setString(3,ab.getEmail());
			ps.setString(4,ab.getName());
			ps.setInt(5,ab.getRrn1());
			ps.setInt(6,ab.getRrn2());
			ps.setInt(7,ab.getHp1());
			ps.setInt(8,ab.getHp2());
			ps.setInt(9,ab.getHp3());
			
			cnt = ps.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return cnt;
	}
	
	public boolean check_id_dup(String input_id) {
		boolean flag = false;
		
		String sql = "select * from account where id=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,input_id);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				flag = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)
					rs.close();
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return flag;
	}
	
	public String find_account(AccountBean ab) {
		String res = null;
		
		String sql = "select * from account where name=? and rrn1=? and rrn2=?";
		if(ab.getId() != null) {
			sql += " and id=?";
		}
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,ab.getName());
			ps.setInt(2,ab.getRrn1());
			ps.setInt(3,ab.getRrn2());
			
			if(ab.getId() != null) {
				ps.setString(4,ab.getId());
			}
			
			rs = ps.executeQuery();
			
			if(ab.getId() != null) {
				if(rs.next()) {
					res = rs.getString("pw");
				}
			}
			else {
				if(rs.next()) {
					res = rs.getString("id");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)
					rs.close();
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return res;
	}
	
	
	public AccountBean getMemberInfo(String _id, String _pw) {
		AccountBean ab = null;
		
		String sql = "select * from account where id=? and pw=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,_id);
			ps.setString(2,_pw);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				int no = rs.getInt("no");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String email = rs.getString("email");
				String name = rs.getString("name");
				int rrn1 = rs.getInt("rrn1");
				int rrn2 = rs.getInt("rrn2");
				int hp1 = rs.getInt("hp1");
				int hp2 = rs.getInt("hp2");
				int hp3 = rs.getInt("hp3");
				String joindate = rs.getString("joindate");
				
				ab= new AccountBean(no, id, pw, email, name, rrn1, rrn2, hp1, hp2, hp3, joindate);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)
					rs.close();
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return ab;
	}//login

	public int updateAccount(AccountBean ab) {
		int cnt=-1;
		
		String sql = "update account set email=?, hp1=?, hp2=?, hp3=? where id=? and pw=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,ab.getEmail());
			ps.setInt(2,ab.getHp1());
			ps.setInt(3,ab.getHp2());
			ps.setInt(4,ab.getHp3());
			ps.setString(5,ab.getId());
			ps.setString(6,ab.getPw());
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return cnt;
	}//updateAccount
	
	public int changePw(String id, String pre_pw, String pw ) {
		int cnt = -1;
		
		String sql = "update account set pw=? where id=? and pw=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,pw);
			ps.setString(2,id);
			ps.setString(3,pre_pw);
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return cnt;
	}

}//end class
