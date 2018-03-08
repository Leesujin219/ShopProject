package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class OrderDBBean {
	private static OrderDBBean instance=new OrderDBBean();
	private OrderDBBean() {
		
	}
	
	public static OrderDBBean getInstance() {
		return instance;
	}
	
	public static Connection getConnection() {
		Connection con=null;
		try {
			String jdbcUrl="jdbc:oracle:thin:@localhost:1521:orcl";
			String dbID="scott";
			String dbPass="tiger";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection(jdbcUrl, dbID, dbPass);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public int insertOrder(OrderDataBean order,ArrayList productList,ArrayList countList) {
		
		String sql="";
		Connection con=getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int orderNum=0;//주문번호
		int keyNum=0;
		try {
			pstmt=con.prepareStatement("select ordertableser.nextval from dual");
			rs=pstmt.executeQuery();
			if(rs.next())
				orderNum=rs.getInt(1);
			else 
				orderNum=1;
			
			for(int i=0;i<productList.size();i++) {
				//키값
				pstmt=con.prepareStatement("select ordertablekeyser.nextval from dual");
				rs=pstmt.executeQuery();
				if(rs.next())
					keyNum=rs.getInt(1);
				else 
					keyNum=1;
				
				ProductDataBean product=(ProductDataBean)productList.get(i);
				
				sql="insert into ordertable(ordernumkey,ordernum,num,productname,count,originalprice,saleprice,"
						+ "price,totalprice,name,id,getname,phone,addrnum,address1,address2,regdate,status,statususer,moneycheck) "
						+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,sysdate,?,?,?)";
				//moneyregdate는 입금완료 시점에서 기입
				int originalprice=Integer.parseInt(product.getPrice());
				int saleprice;

				if(product.getSaleprice()==null||product.getSaleprice()=="") {
					saleprice=0;
				}else {
					saleprice=Integer.parseInt(product.getSaleprice());
				}
				pstmt=con.prepareStatement(sql);		
				pstmt.setInt(1, keyNum);
				pstmt.setInt(2, orderNum);
				pstmt.setInt(3, product.getNum());
				pstmt.setString(4, product.getProductname());
				pstmt.setInt(5, (int)countList.get(i));
				pstmt.setString(6, product.getPrice());
				pstmt.setString(7, saleprice+"");
				pstmt.setString(8, (originalprice-saleprice)*(int)countList.get(i)+"");
				pstmt.setString(9, order.getTotalprice());
				pstmt.setString(10, order.getName());
				pstmt.setString(11, order.getId());
				pstmt.setString(12, order.getGetname());
				pstmt.setString(13, order.getPhone());
				pstmt.setString(14, order.getAddrnum());
				pstmt.setString(15, order.getAddress1());
				pstmt.setString(16, order.getAddress2());
				pstmt.setString(17, "배송준비중");
				pstmt.setString(18, "주문완료");
				pstmt.setString(19, "입금확인중");
				pstmt.executeUpdate();

			}
			return orderNum;	//주문번호 리턴해줌

		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			close(con,rs,pstmt);	
		}
		return 0;

	}
	public int updateOrder(String type,int ordernum) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int chk=0;
		String sql;
		
		System.out.println("update "+type);
		try {
			conn=getConnection();
			if(type.equals("user")) {
				sql="update ordertable set statususer=? where ordernum=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "주문취소");
				pstmt.setInt(2, ordernum);

			}else if(type.equals("send")) {
				sql="update ordertable set status=? where ordernum=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "발송완료");
				pstmt.setInt(2, ordernum);
			}else if(type.equals("cancel")) {
				sql="update ordertable set statususer=? where ordernum=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, "관리자취소");
				pstmt.setInt(2, ordernum);
			}else if(type.equals("moneycheck")) {
				sql="update ordertable set moneycheck=?, moneyregdate=sysdate where ordernum=?";
				pstmt=conn.prepareStatement(sql);
				System.out.println(sql);
				pstmt.setString(1, "입금완료");
				pstmt.setInt(2, ordernum);
			}
			chk=pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn,null,pstmt);
		}
		System.out.println("chk============="+chk);
		return chk;
		
	}
	public int getOrderCount(String id) {//중복제거 값 count(주문번호기준)
	
		
		int x=0;
		String sql;
		Connection con=getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			if(id.equals("admin")) {
				sql="select count(distinct ordernum) from ordertable";
				pstmt=con.prepareStatement(sql);
				}else {
				sql="select count(distinct ordernum) from ordertable where id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);	
			}
			rs=pstmt.executeQuery();
			if(rs.next()) {
				x=rs.getInt(1);
			}
			
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(con, rs, pstmt);
		}
		return x;
			
	}

	public int checkOrder(String name,String phone) {
		int x=0;
		String sql;
		Connection con=getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			sql="select count(distinct ordernum) from ordertable where name=? and phone=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				x=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(con, rs, pstmt);
		}
		System.out.println("x==================="+x);
		return x;
		
	}
	public int checkOrderNum(int ordernum) {
		int x=0;
		String sql;
		Connection con=getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			sql="select count(distinct ordernum) from ordertable where ordernum=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, ordernum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				x=rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(con, rs, pstmt);
		}
		return x;
		
	}
	
	public List getOrders(int startRow,int endRow,String orderfilter,String id) {
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List orderList=null;
		String sql="";
		conn=getConnection();
		try {
			if(id!=null &&id!="") {
				sql="select*from (select rownum rnum,a.* from "
						+ "(select ordernum,ordernumkey,productname,totalprice,name,status,statususer,moneycheck,regdate,moneyregdate "
						+ "from ordertable where(ordernum,ordernumkey)in(select ordernum,max(ordernumkey) "
						+ "from ordertable group by ordernum) and id=?)a)";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				
			}else if(orderfilter.equals("0")) {
				sql="select*from (select rownum rnum,a.* from "
						+ "(select ordernum,ordernumkey,productname,totalprice,name,status,statususer,moneycheck,regdate,moneyregdate "
						+ "from ordertable where(ordernum,ordernumkey)in(select ordernum,max(ordernumkey) "
						+ "from ordertable group by ordernum))a)";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();


			}else if(orderfilter.equals("배송준비중")||orderfilter.equals("발송완료")){
				sql="select*from (select rownum rnum,a.* from "
						+ "(select ordernum,ordernumkey,productname,totalprice,name,status,statususer,moneycheck,regdate,moneyregdate "
						+ "from ordertable where(ordernum,ordernumkey)in(select ordernum,max(ordernumkey) "
						+ "from ordertable group by ordernum) and status=?)a)";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, orderfilter);
				rs=pstmt.executeQuery();
				
			}else if(orderfilter.equals("주문완료")||orderfilter.equals("주문취소")||orderfilter.equals("관리자취소")){
				sql="select*from (select rownum rnum,a.* from "
						+ "(select ordernum,ordernumkey,productname,totalprice,name,status,statususer,moneycheck,regdate,moneyregdate "
						+ "from ordertable where(ordernum,ordernumkey)in(select ordernum,max(ordernumkey) "
						+ "from ordertable group by ordernum) and statususer=?)a)";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, orderfilter);
				rs=pstmt.executeQuery();
			}else if(orderfilter.equals("입금확인중")||orderfilter.equals("입금완료")){
				sql="select*from (select rownum rnum,a.* from "
						+ "(select ordernum,ordernumkey,productname,totalprice,name,status,statususer,moneycheck,regdate,moneyregdate "
						+ "from ordertable where(ordernum,ordernumkey)in(select ordernum,max(ordernumkey) "
						+ "from ordertable group by ordernum) and moneycheck=?)a)";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, orderfilter);
				rs=pstmt.executeQuery();
			}
			if(rs.next()) {
				orderList=new ArrayList();
				do {
					OrderDataBean order=new OrderDataBean();
					order.setOrdernum(rs.getInt("ordernum"));
					order.setOrdernumkey(rs.getInt("ordernumkey"));
					order.setProductname(rs.getString("productname"));
					order.setTotalprice(rs.getString("totalprice"));
					order.setName(rs.getString("name"));
					order.setStatus(rs.getString("status"));
					order.setStatususer(rs.getString("statususer"));
					order.setMoneycheck(rs.getString("moneycheck"));
					order.setRegdate(rs.getDate("regdate"));
					order.setMoneyregdate(rs.getDate("moneyregdate"));
					
					orderList.add(order);
				}while(rs.next());
			}
			Collections.reverse(orderList);

			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn,rs,pstmt);
		}
		
		return orderList;
	}
	public List getOrder(int num) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="";
		List orderDetailList=null;
		
		try {
			conn=getConnection();

			sql="select * from ordertable where ordernum=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();	
			
			if(rs.next()) {
				orderDetailList=new ArrayList();
				do {
					
					OrderDataBean orderDetail=new OrderDataBean();
					orderDetail.setOrdernumkey(rs.getInt("ordernumkey"));
					orderDetail.setOrdernum(rs.getInt("ordernum"));
					orderDetail.setNum(rs.getInt("num"));
					orderDetail.setProductname(rs.getString("productname"));
					orderDetail.setCount(rs.getInt("count"));
					orderDetail.setOriginalprice(rs.getString("originalprice"));
					orderDetail.setSaleprice(rs.getString("saleprice"));
					orderDetail.setPrice(rs.getString("price"));
					orderDetail.setTotalprice(rs.getString("totalprice"));
					orderDetail.setName(rs.getString("name"));
					orderDetail.setId(rs.getString("id"));
					orderDetail.setGetname(rs.getString("getname"));
					orderDetail.setPhone(rs.getString("phone"));
					orderDetail.setAddrnum(rs.getString("addrnum"));
					orderDetail.setAddress1(rs.getString("address1"));
					orderDetail.setAddress2(rs.getString("address2"));
					orderDetail.setRegdate(rs.getDate("regdate"));
					orderDetail.setMoneyregdate(rs.getDate("moneyregdate"));
					orderDetail.setStatus(rs.getString("status"));
					orderDetail.setStatususer(rs.getString("statususer"));
					orderDetail.setMoneycheck(rs.getString("moneycheck"));
					
					
					
					orderDetailList.add(orderDetail);
				}while(rs.next());
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn,rs,pstmt);
		}return orderDetailList;
	}

	public void close(Connection con,ResultSet rs,PreparedStatement pstmt) {
		//커넥션 닫는 메서드
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
