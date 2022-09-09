package board;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDao {
	private PreparedStatement ps = null;
	private Connection conn = null;
	private ResultSet rs = null;
	
	private static BoardDao instance;
	
	private BoardDao() {
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
	
	public static BoardDao getInstance() {
		if(instance == null) {
			instance = new BoardDao();
		}
		return instance;
	}
	
	public int countlist() {
		int cnt=-1;
		
		String sql = "select count(*) from board";
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("count(*)");
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
		
		return cnt;
	}//countlist
	
	
	public ArrayList<BoardBean> getList(int startrow, int endrow){
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();
		/*
		bno number primary key,
		writer varchar2(20) not null,
		ip varchar2(15) not null,
		subject varchar2(50) not null,
		content varchar2(300) not null,
		readcount number default 0,
		reg_date date default sysdate
		*/
		String sql = "select * from "
				+ "(select rownum rank,bno,writer,subject,reg_date,readcount,content,ip from (select * from board order by bno desc)) "
				+ "where rank between ? and ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1,startrow);
			ps.setInt(2,endrow);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String writer = rs.getString("writer");
				String ip = rs.getString("ip");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				int readcount = rs.getInt("readcount");
				Date reg_date = rs.getDate("reg_date");
				
				BoardBean bb = new BoardBean(bno, writer, ip, subject, content, readcount, reg_date); 
				
				list.add(bb);
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
		
		return list;
	}
	
	public BoardBean getlistByBno(String _bno) {
		BoardBean bb = null;
				
		String sql = "select * from board where bno=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,_bno);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				int bno = rs.getInt("bno");
				String writer = rs.getString("writer");
				String ip = rs.getString("ip");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				int readcount = rs.getInt("readcount");
				Date reg_date = rs.getDate("reg_date");
				
				bb = new BoardBean(bno, writer, ip, subject, content, readcount, reg_date);
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
		
		return bb;		
	}//getlistByBno
	
	public int insertlist(BoardBean bb) {
		int cnt = -1;
		
		String sql = "insert into board values(boardseq.nextval,?,?,?,?,default,default)";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,bb.getWriter());
			ps.setString(2,bb.getIp());
			ps.setString(3,bb.getSubject());
			ps.setString(4,bb.getContent());
			
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
	}//insertlist
	
	public int insertReply(ReplyBean rb) {
		int cnt = -1;
		
		String sql = "insert into reply values(repseq.nextval,?,?,?,default,?)";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,rb.getBno());
			ps.setString(2,rb.getR_writer());
			ps.setString(3,rb.getR_content());
			ps.setString(4,rb.getR_ip());
			
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
	}//insertReply
	
	public ArrayList<ReplyBean> getAllReply(String _bno){
		ArrayList<ReplyBean> rlist = new ArrayList<ReplyBean>();
		
		String sql = "select * from (select * from reply where bno=?) order by rno asc";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,_bno);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				int rno = rs.getInt("rno");
				String bno = rs.getString("bno");
				String r_writer = rs.getString("r_writer");
				String r_content = rs.getString("r_content");
				Date r_reg_date = rs.getDate("r_reg_date");
				String ip = rs.getString("r_ip");
				
				ReplyBean rb = new ReplyBean(rno, bno, r_writer,r_content, r_reg_date, ip);
				
				rlist.add(rb);
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
		
		return rlist;
	}//getAllReply
	
	public int deletelist(String bno) {
		int cnt =-1;
		
		String sql = "delete board where bno=?";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1,bno);
			
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
	}//deletelist
	
	public int updatelist(BoardBean bb) {
		int cnt=-1;
		
		String sql = "update board set subject=?,content=? where bno=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,bb.getSubject());
			ps.setString(2,bb.getContent());
			ps.setInt(3,bb.getBno());
			
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
	}//updatelist
	
	public ArrayList<NotifyBean> getNotify(int startrow , int endrow){
		ArrayList<NotifyBean> nlist = new ArrayList<NotifyBean>();
		
		String sql = "select * from "
				+ "(select rownum rank,nno,spec,subject,content,reg_date from "
				+ "(select * from notify order by nno desc)) "
				+ "where rank between ? and ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1,startrow);
			ps.setInt(2,endrow);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				int nno = rs.getInt("nno");
				String spec = rs.getString("spec");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				Date reg_date = rs.getDate("reg_date");
				
				NotifyBean nb = new NotifyBean(nno, spec, subject, content, reg_date);
				
				nlist.add(nb);
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
		
		return nlist;
	}//getNotify
	
	public int countNotify() {
		int cnt =-1;
		
		String sql = "select count(*) from notify";
		
		try {
			ps = conn.prepareStatement(sql);

			rs = ps.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt("count(*)");				
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
		
		return cnt;
	}//countNotify
	
	
	public int deleteReply(String rno) {
		int cnt = -1;
		
		String sql = "delete reply where rno=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,rno);
			
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
	}//deleteReply
	
	
	public NotifyBean getNotifyByNno(String _nno) {
		NotifyBean nb = null;
		
		String sql = "select * from notify where nno=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,_nno);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				int nno = rs.getInt("nno");
				String spec = rs.getString("spec");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				Date reg_date = rs.getDate("reg_date");
				
				nb = new NotifyBean(nno, spec, subject, content, reg_date);
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
		
		return nb;
	}//getNotifyByNno
	
	
	public int insertNotify(NotifyBean nb) {
		int cnt = -1;
		
		String sql = "insert into notify values(notseq.nextval,?,?,?,default)";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,nb.getSpec());
			ps.setString(2,nb.getSubject());
			ps.setString(3,nb.getContent());
			
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
	}//insertNotify
	
	
	public int updateNotify(NotifyBean nb) {
		int cnt = -1;
		
		String sql = "update notify set spec=?,subject=?,content=? where nno=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,nb.getSpec());
			ps.setString(2,nb.getSubject());
			ps.setString(3,nb.getContent());
			ps.setInt(4,nb.getNno());
			
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
	}// updateNotify
	
	public int deleteNotify(String nno) {
		int cnt = -1;
		
		String sql = "delete notify where nno=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,nno);
			
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
	}//deleteNotify
	
}//end class
