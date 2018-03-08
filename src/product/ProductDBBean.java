package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import login.LoginDataBean;

public class ProductDBBean {
	private static ProductDBBean instance=new ProductDBBean();
	private ProductDBBean() {
	}
	public static ProductDBBean getInstance() {
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
	public void insertProduct(ProductDataBean product) {
		String sql="";
		Connection con=getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int number=0;
		try {
			pstmt=con.prepareStatement("select productboardser.nextval from dual");
			rs=pstmt.executeQuery();
			if(rs.next())
				number=rs.getInt(1);
			else 
				number=1;
			sql="insert into productboard(num,boardid,regdate,content,home,"
					+ "newpage,sale,writerid,ip,productname,price,"
					+ "shippingfee,thumbnail,filesize,salepercent,saleprice,exposure,filename1,filename2,filename3,filename4)"
					+ "values(?,?,sysdate,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, number);
			pstmt.setString(2, product.getBoardid());
			pstmt.setString(3, product.getContent());
			pstmt.setString(4, product.getHome());
			pstmt.setString(5, product.getNewpage());
			pstmt.setString(6, product.getSale());
			pstmt.setString(7, product.getWriterid());
			pstmt.setString(8, product.getIp());
			pstmt.setString(9, product.getProductname());
			pstmt.setString(10, product.getPrice());
			pstmt.setString(11, product.getShippingfee());
			pstmt.setString(12, product.getThumbnail());
			pstmt.setInt(13, product.getFilesize());
			pstmt.setString(14, product.getSalepercent());
			pstmt.setString(15, product.getSaleprice());
			pstmt.setString(16, product.getExposure());
			pstmt.setString(17, product.getFilename1());
			pstmt.setString(18, product.getFilename2());
			pstmt.setString(19, product.getFilename3());
			pstmt.setString(20, product.getFilename4());
			pstmt.executeUpdate();
			
			
			
		}catch(SQLException e1) {
			e1.printStackTrace();
		}finally {
			close(con,rs,pstmt);
		}

	}
	public int updateProduct(ProductDataBean product,String num,String filehave) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int chk=0;
		String sql;
		
		try {
			conn=getConnection();

			if(filehave.equals("false")) {
				sql="update productboard set "
						+ "regdate=sysdate,boardid=?,content=?,home=?,newpage=?,"
						+ "sale=?,writerid=?,ip=?,productname=?,"
						+ "shippingfee=?,salepercent=?,saleprice=?,exposure=? "
						+ " where num=?";
			}else {
				sql="update productboard set "
						+ "regdate=sysdate,boardid=?,content=?,home=?,newpage=?,"
						+ "sale=?,writerid=?,ip=?,productname=?,"
						+ "shippingfee=?,salepercent=?,saleprice=?,exposure=?,filename1=?,filename2=?,filename3=?,filename4=?,thumbnail=? "
						+ " where num=?";
			}
			
			pstmt=conn.prepareStatement(sql);
			System.out.println(product);
			pstmt.setString(1, product.getBoardid());
			pstmt.setString(2, product.getContent());
			pstmt.setString(3, product.getHome());
			pstmt.setString(4, product.getNewpage());
			pstmt.setString(5, product.getSale());
			pstmt.setString(6, product.getWriterid());
			pstmt.setString(7, product.getIp());
			pstmt.setString(8, product.getProductname());
			pstmt.setString(9, product.getShippingfee());
			pstmt.setString(10, product.getSalepercent());
			pstmt.setString(11, product.getSaleprice());
			pstmt.setString(12, product.getExposure());
			if(filehave.equals("false")) {
				pstmt.setInt(13, Integer.parseInt(num));
			}else {
				pstmt.setString(13, product.getFilename1());
				pstmt.setString(14, product.getFilename2());
				pstmt.setString(15, product.getFilename3());
				pstmt.setString(16, product.getFilename4());
				pstmt.setString(17, product.getThumbnail());
				pstmt.setInt(18, Integer.parseInt(num));
			}


		
			
			chk=pstmt.executeUpdate();
				//executeUpdate (몇개의 row가 저장이 되었는지 int를 리턴함). 1이면 된 것, 0이면 안된 것
				
		}catch(Exception e) {
			e.printStackTrace();
			
		}finally {
			close(conn,null,pstmt);
		}
		return chk;
	}
	
	public int getProductCount(String boardidfilter) {
		//총 회원 수 count
		int x=0;
		String sql;
		Connection con=getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
			
		try {
			if(boardidfilter.equals("ht")) {//home화면 필터
				sql="select nvl(count(*),0) from productboard where home='t'";
				pstmt=con.prepareStatement(sql);

			}else if(boardidfilter.equals("nt")){//new화면 필터
				sql="select nvl(count(*),0) from productboard where newpage='t'";
				pstmt=con.prepareStatement(sql);
			}else if(boardidfilter.equals("st")){//sale화면 필터
				sql="select nvl(count(*),0) from productboard where sale='t'";
				pstmt=con.prepareStatement(sql);
			}else if(boardidfilter.equals("0")) {//전체회원 조회
				sql="select nvl(count(*),0) from productboard";
				pstmt=con.prepareStatement(sql);
			}else {//boardidfilter에 들어온 값의 회원 조회
				sql="select nvl(count(*),0) from productboard where boardid=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, boardidfilter);
			} 
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
	public List getProducts(int startRow,int endRow,String boardidfilter) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List productList=null;
		String sql="";
		conn=getConnection();
		System.out.println("boardidfilter============="+boardidfilter);
		
		try {
			if(boardidfilter.equals("ht")) {//home화면
				sql="select*from"
						+ "(select rownum rnum,a.* from"
						+ "(select num,boardid,productname,price,shippingfee,home,newpage,sale,saleprice,exposure,regdate,thumbnail "
						+ "from productboard where home='t' and exposure='t')"
						+ "a) where rnum between ? and ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs=pstmt.executeQuery();
				
			}else if(boardidfilter.equals("nt")) {//new화면
				sql="select*from"
						+ "(select rownum rnum,a.* from"
						+ "(select num,boardid,productname,price,shippingfee,home,newpage,sale,saleprice,exposure,regdate,thumbnail "
						+ "from productboard where newpage='t' and exposure='t')"
						+ "a) where rnum between ? and ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs=pstmt.executeQuery();
				
				
			}else if(boardidfilter.equals("st")) {//sale화면
				sql="select*from"
						+ "(select rownum rnum,a.* from"
						+ "(select num,boardid,productname,price,shippingfee,home,newpage,sale,saleprice,exposure,regdate,thumbnail "
						+ "from productboard where sale='t' and exposure='t')"
						+ "a) where rnum between ? and ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs=pstmt.executeQuery();
			
				
			}else if(boardidfilter.equals("0")) { //전체 출력
				sql="select*from"
						+ "(select rownum rnum,a.* from"
						+ "(select num,boardid,productname,price,shippingfee,home,newpage,sale,saleprice,exposure,regdate,thumbnail "
						+ "from productboard where exposure='t')a) where rnum between ? and ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs=pstmt.executeQuery();
				
			}else{	//카테고리 출력
				sql="select*from"
						+ "(select rownum rnum,a.* from"
						+ "(select num,boardid,productname,price,shippingfee,home,newpage,sale,saleprice,exposure,regdate,thumbnail "
						+ "from productboard where boardid=? and exposure='t')"
						+ "a) where rnum between ? and ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, boardidfilter);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				rs=pstmt.executeQuery();
			}
			if(rs.next()) {
				productList=new ArrayList();
				do {
					ProductDataBean product=new ProductDataBean();
					//while문 반복 될 때마다 객체 생성
					product.setNum(rs.getInt("num"));
					product.setBoardid(rs.getString("boardid"));
					product.setProductname(rs.getString("productname"));
					product.setPrice(rs.getString("price"));
					product.setShippingfee(rs.getString("shippingfee"));
					product.setHome(rs.getString("home"));
					product.setNewpage(rs.getString("newpage"));
					product.setSale(rs.getString("sale"));
					product.setSaleprice(rs.getString("saleprice"));
					product.setExposure(rs.getString("exposure"));
					product.setRegdate(rs.getDate("regdate"));
					product.setThumbnail(rs.getString("thumbnail"));
					productList.add(product);
				}while(rs.next());
			}
			Collections.reverse(productList);

			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			close(conn,rs,pstmt);
		}return productList;
		
	}
	
	public List getProductsAdmin(int startRow,int endRow,String boardidfilter) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List productList=null;
		String sql="";
		conn=getConnection();

		
		try {
			if(boardidfilter.equals("ht")) {//home화면
				sql="select*from"
						+ "(select rownum rnum,a.* from"
						+ "(select num,boardid,productname,price,shippingfee,home,newpage,sale,saleprice,exposure,regdate,thumbnail "
						+ "from productboard where home='t')"
						+ "a) where rnum between ? and ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs=pstmt.executeQuery();
				
			}else if(boardidfilter.equals("nt")) {//new화면
				sql="select*from"
						+ "(select rownum rnum,a.* from"
						+ "(select num,boardid,productname,price,shippingfee,home,newpage,sale,saleprice,exposure,regdate,thumbnail "
						+ "from productboard where newpage='t')"
						+ "a) where rnum between ? and ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs=pstmt.executeQuery();
				
				
			}else if(boardidfilter.equals("st")) {//sale화면
				sql="select*from"
						+ "(select rownum rnum,a.* from"
						+ "(select num,boardid,productname,price,shippingfee,home,newpage,sale,saleprice,exposure,regdate,thumbnail "
						+ "from productboard where sale='t')"
						+ "a) where rnum between ? and ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs=pstmt.executeQuery();
			
				
			}else if(boardidfilter.equals("0")) { //전체 출력
				sql="select*from"
						+ "(select rownum rnum,a.* from"
						+ "(select num,boardid,productname,price,shippingfee,home,newpage,sale,saleprice,exposure,regdate,thumbnail "
						+ "from productboard)a) where rnum between ? and ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rs=pstmt.executeQuery();
				
			}else{	//카테고리 출력
				sql="select*from"
						+ "(select rownum rnum,a.* from"
						+ "(select num,boardid,productname,price,shippingfee,home,newpage,sale,saleprice,exposure,regdate,thumbnail "
						+ "from productboard where boardid=?)"
						+ "a) where rnum between ? and ?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, boardidfilter);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				rs=pstmt.executeQuery();
			}
			if(rs.next()) {
				productList=new ArrayList();
				do {
					ProductDataBean product=new ProductDataBean();
					//while문 반복 될 때마다 객체 생성
					product.setNum(rs.getInt("num"));
					product.setBoardid(rs.getString("boardid"));
					product.setProductname(rs.getString("productname"));
					product.setPrice(rs.getString("price"));
					product.setShippingfee(rs.getString("shippingfee"));
					product.setHome(rs.getString("home"));
					product.setNewpage(rs.getString("newpage"));
					product.setSale(rs.getString("sale"));
					product.setSaleprice(rs.getString("saleprice"));
					product.setExposure(rs.getString("exposure"));
					product.setRegdate(rs.getDate("regdate"));
					product.setThumbnail(rs.getString("thumbnail"));
					productList.add(product);
				}while(rs.next());
			}
			Collections.reverse(productList);

			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			close(conn,rs,pstmt);
		}return productList;
		
	}
	
	public ProductDataBean getProduct(int num) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ProductDataBean product=null;
		String sql="";
		try {
			conn=getConnection();

			sql="select * from productboard where num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();	
		

			if(rs.next()) {
				//true일 때 BoardDataBean에 넣어야함
				product=new ProductDataBean();
				product.setNum(rs.getInt("num"));
				product.setBoardid(rs.getString("boardid"));
				product.setRegdate(rs.getDate("regdate"));
				product.setContent(rs.getString("content"));
				product.setHome(rs.getString("home"));
				product.setNewpage(rs.getString("newpage"));
				product.setSale(rs.getString("sale"));
				product.setWriterid(rs.getString("writerid"));
				product.setIp(rs.getString("ip"));
				product.setProductname(rs.getString("productname"));
				product.setPrice(rs.getString("price"));
				product.setShippingfee(rs.getString("shippingfee"));
				product.setThumbnail(rs.getString("thumbnail"));
				product.setFilename1(rs.getString("filename1"));
				product.setFilename2(rs.getString("filename2"));
				product.setFilename3(rs.getString("filename3"));
				product.setFilename4(rs.getString("filename4"));
				product.setSalepercent(rs.getString("salepercent"));
				product.setSaleprice(rs.getString("saleprice"));
				product.setExposure(rs.getString("exposure"));
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(conn,rs,pstmt);

		}		
		return product;
		
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
