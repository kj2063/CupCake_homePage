package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

public class ProductDao {
	private PreparedStatement ps = null;
	private Connection conn = null;
	private ResultSet rs = null;
	
	private static ProductDao instance;
	
	private ProductDao() {
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
	
	public static ProductDao getInstance() {
		if(instance == null) {
			instance = new ProductDao();
		}
		return instance;
	}
	
	public int insertCategory(String cname) {
		int cnt = -1;
		
		String sql = "insert into category values(catseq.nextval,?)";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,cname);
			
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
	}// insertCategory
	
	public Vector<CategoryBean> getAllCategory() {
		Vector<CategoryBean> cat_arr = new Vector<CategoryBean>();
		
		String sql = "select * from category order by cno";
		
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				int cno = rs.getInt("cno");
				String cname = rs.getString("cname");
				
				CategoryBean cb = new CategoryBean(cno,cname);
				
				cat_arr.add(cb);
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
		
		return cat_arr;
	}//getAllCategory
	
	public int insertProduct(MultipartRequest mr) {
		int cnt=-1;
		/*
		pno number not null primary key,
		pcat varchar2(40) not null,
		pname varchar2(40) not null unique,
		pimage varchar2(20) not null,
		price number(6) not null,
		pspec varchar2(20) not null,
		pcontents varchar2(150) not null
		*/
		String sql = "insert into product values(prodseq.nextval,?,?,?,?,?,?)";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,mr.getParameter("pcat"));
			ps.setString(2,mr.getParameter("pname"));
			ps.setString(3,mr.getFilesystemName("pimage"));
			ps.setInt(4,Integer.parseInt(mr.getParameter("price")));
			ps.setString(5,mr.getParameter("pspec"));
			ps.setString(6,mr.getParameter("pcontents"));
			
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
	}//insertProduct
	
	
	public Vector<ProductBean> getAllProduct(){
		Vector<ProductBean> prod_arr = new Vector<ProductBean>();
		
		String sql = "select * from product order by pno";
		
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				int pno = rs.getInt("pno");
				String pcat = rs.getString("pcat");	
				String pname = rs.getString("pname");	
				String pimage = rs.getString("pimage");	
				int price = rs.getInt("price");
				String pspec = rs.getString("pspec");
				String pcontents = rs.getString("pcontents");
				
				ProductBean pb = new ProductBean(pno,pcat,pname,pimage,price,pspec,pcontents);
				
				prod_arr.add(pb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return prod_arr;
	}//getAllProduct
	
	public Vector<ProductBean> getAllProduct_Menu(){
		Vector<ProductBean> prod_arr = new Vector<ProductBean>();
		
		String sql = "select * from product order by (case pspec when 'NEW' then 0 when 'BEST' then 1 else 2 end),"
				+ " pno desc";
		
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				int pno = rs.getInt("pno");
				String pcat = rs.getString("pcat");	
				String pname = rs.getString("pname");	
				String pimage = rs.getString("pimage");	
				int price = rs.getInt("price");
				String pspec = rs.getString("pspec");
				String pcontents = rs.getString("pcontents");
				
				ProductBean pb = new ProductBean(pno,pcat,pname,pimage,price,pspec,pcontents);
				
				prod_arr.add(pb);
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
		
		return prod_arr;
	}//getAllProduct_Menu
	
	
	public Vector<ProductBean> getAllProduct_MenuCat(String cat){
		Vector<ProductBean> prod_arr = new Vector<ProductBean>();
		
		String sql = "select * from product where pcat=?"
				+ " order by (case pspec when 'NEW' then 0 when 'BEST' then 1 else 2 end),"
				+ " pno desc";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,cat);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				int pno = rs.getInt("pno");
				String pcat = rs.getString("pcat");	
				String pname = rs.getString("pname");	
				String pimage = rs.getString("pimage");	
				int price = rs.getInt("price");
				String pspec = rs.getString("pspec");
				String pcontents = rs.getString("pcontents");
				
				ProductBean pb = new ProductBean(pno,pcat,pname,pimage,price,pspec,pcontents);
				
				prod_arr.add(pb);
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
		
		return prod_arr;
	}//getAllProduct_MenuCat
	
	
	
	
	public int deleteCategory(String cno) {
		int cnt=-1;
		
		String sql = "delete category where cno=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,cno);
			
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
	}//deleteCategory
	
	public ProductBean productByPno(String _pno) {
		ProductBean pb = null;
		
		String sql = "select * from product where pno=?";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1,_pno);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				int pno = rs.getInt("pno");
				String pcat = rs.getString("pcat");	
				String pname = rs.getString("pname");	
				String pimage = rs.getString("pimage");	
				int price = rs.getInt("price");
				String pspec = rs.getString("pspec");
				String pcontents = rs.getString("pcontents");
				
				pb = new ProductBean(pno,pcat,pname,pimage,price,pspec,pcontents);
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
		
		return pb;
	}
	
	public int updateProduct(MultipartRequest mr) {
		int cnt=-1;
		
		String sql = "update product set pcat=?,pname=?,pimage=?,price=?,pspec=?,pcontents=? where pno=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,mr.getParameter("pcat"));
			ps.setString(2,mr.getParameter("pname"));
			
			String pre_pimage = mr.getParameter("pre_pimage");
			String pimage = mr.getFilesystemName("pimage");
			
			if(pimage == null) {
				pimage = pre_pimage;
			}
			
			ps.setString(3,pimage);
			ps.setInt(4,Integer.parseInt(mr.getParameter("price")));
			ps.setString(5,mr.getParameter("pspec"));
			ps.setString(6,mr.getParameter("pcontents"));
			ps.setInt(7,Integer.parseInt(mr.getParameter("pno")));
			
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
	}//updateProduct
	
	public int deleteProduct(String pno) {
		int cnt = -1;
		
		String sql = "delete product where pno=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,pno);
			
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
	}//deleteProduct
	
	
	public int addOrder(Vector<ProductBean> clist, int userNo, String takeout_date) {
		int cnt = -1;
		
		
		String sql = "insert into orders values(ordseq.nextval,?,?,?,?,default,?)";
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1,userNo);
			
			String pno, p_num;
			int tot_price;
			
			if(clist.size() == 1) {
				pno = String.valueOf(clist.get(0).getPno());
				p_num = String.valueOf(clist.get(0).getP_num());
				tot_price = clist.get(0).getTot_price();
			}
			else {
				pno = String.valueOf(clist.get(0).getPno());
				p_num = String.valueOf(clist.get(0).getP_num());
				tot_price = clist.get(0).getTot_price();
				
				for(int i=1; i<clist.size(); i++) {
					pno += "/"+String.valueOf(clist.get(i).getPno());
					p_num += "/"+String.valueOf(clist.get(i).getP_num());
					tot_price += clist.get(i).getTot_price();
				}
			}	
			ps.setString(2,pno);
			ps.setString(3,p_num);
			ps.setInt(4,tot_price);
			ps.setString(5,takeout_date);
			
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
	}//addorder
	
	
	public Vector<OrderBean> getOrderByMemno(int userNo) {
		Vector<OrderBean> olist = new Vector<OrderBean>();
		
		String sql = "select * from orders where memno=? order by ono desc";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1,userNo);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				/*
				ono number primary key, -- 주문번호(ordseq)
				memno number not null, -- 회원번호
				pno varchar2(20) not null, -- 상품번호
				p_num varchar2(20) not null, -- 상품갯수
				tot_price number not null, -- 전체가격
				ord_date date default sysdate, --주문일
				takeout_date varchar2(10) not null --수취일 
				*/
				int ono = rs.getInt("ono");
				int memno = rs.getInt("memno");
				String pno = rs.getString("pno");
				String p_num = rs.getString("p_num");
				int tot_price = rs.getInt("tot_price");
				String ord_date = rs.getString("ord_date");
				String takeout_date = rs.getString("takeout_date");
				
				OrderBean ob = new OrderBean(ono, memno, pno, p_num, tot_price, ord_date, takeout_date);
				
				olist.add(ob);
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
		
		return olist;
	}//getOrderByMemno
	
	
	public String getPnameByPno(String pno){
		String pname = null;
		
		String sql = "select pname from product where pno=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,pno);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				pname = rs.getString("pname");
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
		
		return pname;
	}//getPnameByPno
	
	public Vector<OrderBean> getAllOrder(){
		Vector<OrderBean> olist = new Vector<OrderBean>();
		
		String sql = "select "
				+ "id,name,hp1,hp2,hp3,pno,p_num,tot_price,ord_date,takeout_date,ono,memno "
				+ "from account,orders "
				+ "where no=memno "
				+ "order by takeout_date";
		
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				int hp1 = rs.getInt("hp1");
				int hp2 = rs.getInt("hp2");
				int hp3 = rs.getInt("hp3");
				String pno = rs.getString("pno");
				String p_num = rs.getString("p_num");
				int tot_price = rs.getInt("tot_price");
				String ord_date = rs.getString("ord_date");
				String takeout_date = rs.getString("takeout_date");
				int ono = rs.getInt("ono");
				int memno = rs.getInt("memno");
				
				OrderBean ob = new OrderBean(ono, memno, pno, p_num, tot_price, ord_date, takeout_date,
						 id, name, hp1, hp2, hp3);
				
				olist.add(ob);
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
		
		return olist;
	}//getAllOrder
	
	
	public int deleteOrder(String ono) {
		int cnt = -1;
		
		String sql = "delete orders where ono=?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,ono);
			
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
	}//deleteOrder
	
	
	public Vector<ProductBean> getNewProduct(){
		Vector<ProductBean> new_list = new Vector<ProductBean>();
		
		String sql = "select * from product where pspec='NEW' order by pno desc";
		
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int pno = rs.getInt("pno");
				String pcat = rs.getString("pcat");	
				String pname = rs.getString("pname");	
				String pimage = rs.getString("pimage");	
				int price = rs.getInt("price");
				String pspec = rs.getString("pspec");
				String pcontents = rs.getString("pcontents");
				
				ProductBean pb = new ProductBean(pno,pcat,pname,pimage,price,pspec,pcontents);
				
				new_list.add(pb);
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
		
		return new_list;
	}
	
}//end class
