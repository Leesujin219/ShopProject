package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import login.LoginDataBean;

public class WishListDBBean {
	private static WishListDBBean instance=new WishListDBBean();
	private WishListDBBean() {
		
	}
	public static WishListDBBean getInstance() {
		return instance;
	}
	public static Connection getConnection() {
		Connection con=null;
		try {
			String jdbcUrl="jdbc:oracle:thin:@localhost:1521:orcl";
			String dbID="scott";
			String dbPass="tiger";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection(jdbcUrl,dbID,dbPass);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	public void insertWish(WishListDataBean wish) {
		String sql="";
		Connection con=getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int number=0;
		try {
			pstmt=con.prepareStatement("select wishtableser.nextval from dual");
			rs=pstmt.executeQuery();
			if(rs.next())
				number=rs.getInt(1);
			else
				number=1;		
			sql="insert into wishtable(wishnum,id,num) values(?,?,?)";
						
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, wish.getId());
			pstmt.setInt(3, wish.getNum());
			pstmt.executeUpdate();
		
		}catch(SQLException e) {e.printStackTrace();}
		finally {
			close(con,rs,pstmt);
		}
	}
	public List getWishs(int startRow,int endRow) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List wishList=null;
		String sql="";
		conn=getConnection();

		try {
				sql="select*from"
						+ "(select rownum rnum,a.* from"
						+ "(select wishnum,id,num "
						+ "from wishtable)"
						+ "a) where rnum between ? and ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs=pstmt.executeQuery();
			
			if(rs.next()) {
				wishList=new ArrayList();
				do {
					WishListDataBean wish=new WishListDataBean();
					wish.setWishnum(rs.getInt("wishnum"));
					wish.setId(rs.getString("id"));
					wish.setNum(rs.getInt("num"));
					
					wishList.add(wish);
				}while(rs.next());
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			close(conn,rs,pstmt);
		}return wishList;
		
	}
	public int deleteWish(int wishnum){
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="delete from wishtable where wishnum=?";

		int x=-1;
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, wishnum);
	
			x=pstmt.executeUpdate();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			close(conn,rs,pstmt);
		}
				
		return x;
	}
	
	public int getWishCount(String id) {
		int x=0;
		String sql;
		Connection con=getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
			
		try {
				sql="select nvl(count(*),0) from wishtable where id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					x=rs.getInt(1);
				}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(con,rs,pstmt);
		}
		return x;
	}
	public void close(Connection con,ResultSet rs,PreparedStatement pstmt) {
		//Ä¿³Ø¼Ç ´Ý´Â ¸Þ¼­µå
		if(rs!=null)
			try {
				rs.close();
			}catch(SQLException ex) {}
		if(pstmt!=null)
			try {
				pstmt.close();
			}catch(SQLException ex) {}
		if(con!=null)
			try {
				con.close();
			}catch(SQLException ex) {}
	}
}
