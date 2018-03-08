package controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.msk.Action;

import login.LoginDBBean;
import login.LoginDataBean;
import product.OrderDBBean;
import product.ProductDBBean;
import product.ProductDataBean;

public class AdminController extends Action{
	public String memberList(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		/*HttpSession session=request.getSession();
		LoginDataBean memberTest=(LoginDataBean)session.getAttribute("member");
*/
		int pageSize=20;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String pageNum=request.getParameter("pageNum");
		String memberfilter=request.getParameter("memberfilter");
		String searchfilter=request.getParameter("searchfilter");
		String searchtext=request.getParameter("searchtext");
		
		if(pageNum==null||pageNum==""){
			pageNum="1";
		}
		if(memberfilter==null||memberfilter==""){
			memberfilter="0";
		}
		if(searchfilter==null||searchfilter==""){
			searchfilter="0";
		}
		if(searchtext==null||searchtext==""){
			searchtext="0";
		}
		
		int currentPage=Integer.parseInt(pageNum);
		int startRow=(currentPage-1)*pageSize+1;
		int endRow=currentPage*pageSize;
		int count=0;
		int number=0;
		
		List memberList=null;
		LoginDBBean dbPro=LoginDBBean.getInstance();
		count=dbPro.getMemberCount(memberfilter);
		if(count>0){
			memberList=dbPro.getMembers(startRow,endRow,memberfilter);
		}
		number=count-(currentPage-1)*pageSize;
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("count", count);
		request.setAttribute("number", number);
		request.setAttribute("memberList", memberList);
		request.setAttribute("currentPage", currentPage);
		
		int bottomLine=5;
		request.setAttribute("bottomLine", bottomLine);
	
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		int startPage=1+(currentPage-1)/bottomLine*bottomLine;
		int endPage=startPage+bottomLine-1;
		if(endPage>pageCount)
			endPage=pageCount;
		
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		

		
		
		return  "/admin/memberList.jsp"; 
	} 
	
	public String memberDetail(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		HttpSession session=request.getSession();
		String adminpwd=((LoginDataBean)session.getAttribute("member")).getPassword();
		
		String pageNum=request.getParameter("pageNum");
		
		if(pageNum==null||pageNum==""){
			pageNum="1";
		}
		String id=request.getParameter("id");
		
		LoginDBBean dbPro=LoginDBBean.getInstance();
		LoginDataBean member=dbPro.getMember(id);
		
		request.setAttribute("member", member);
		request.setAttribute("adminpwd", adminpwd);
		request.setAttribute("pageNum", pageNum);
		return  "/admin/memberDetail.jsp"; 
		} 

	public String productList(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 

		int pageSize=20;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");	
		String pageNum=request.getParameter("pageNum");
		String boardidfilter=request.getParameter("boardidfilter");
		String showfilter=request.getParameter("showfilter");
		String exposurefilter=request.getParameter("exposurefilter");
		
		if(pageNum==null||pageNum==""){
			pageNum="1";
		}
		if(boardidfilter==null||boardidfilter==""){
			boardidfilter="0";
		}
		if(showfilter==null||showfilter==""){
			showfilter="0";
		}
		if(exposurefilter==null||exposurefilter==""){
			exposurefilter="0";
		}
		
		int currentPage=Integer.parseInt(pageNum);
		int startRow=(currentPage-1)*pageSize+1;
		int endRow=currentPage*pageSize;
		int count=0;
		int number=0;
		List productList=null;
		
		ProductDBBean dbPro=ProductDBBean.getInstance();
		count=dbPro.getProductCount(boardidfilter);//파라미터 더 들어가야하나 확인할것
		System.out.println(count);
		if(count>0){
			productList=dbPro.getProductsAdmin(startRow,endRow,boardidfilter);
		}
		number=count-(currentPage-1)*pageSize;
		
		request.setAttribute("count", count);
		request.setAttribute("productList", productList);
		request.setAttribute("number", number);
		request.setAttribute("currentPage", currentPage);
		
		int bottomLine=5;
		request.setAttribute("bottomLine", bottomLine);
		
		int pageCount=count/pageSize+(count%pageSize==0?0:1);

		int startPage=1+(currentPage-1)/bottomLine*bottomLine;
		int endPage=startPage+bottomLine-1;
		if(endPage>pageCount)
			endPage=pageCount;
		
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("ip", request.getRemoteAddr());		
		//ip 정보 productDetail에 넘겨주기 위해 넣음 
		
		return  "/admin/productList.jsp"; 
	} 
	
	public String productForm(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		HttpSession session=request.getSession();
		LoginDataBean member=(LoginDataBean)session.getAttribute("member");
		String writerid=member.getId();
		request.setAttribute("writerid", writerid);
		request.setAttribute("ip", request.getRemoteAddr());		
		
		return  "/admin/productForm.jsp"; 
	} 

	public String productInput(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		
		String realFolder="";
		String encType="euc-kr";
		int maxSize=5*1024*1024;
		ServletContext context =request.getServletContext();
		realFolder=context.getRealPath("filesave");
		MultipartRequest multi=null;
		System.out.println(realFolder);
		multi=new MultipartRequest(request, realFolder,maxSize,encType,new DefaultFileRenamePolicy());
		Enumeration files=multi.getFileNames();
		ArrayList filename=new ArrayList();
		File file=null;
		//filename[] array로 만들기 filename db에도 여러개 만들어야함
		while(files.hasMoreElements()) {
			String name=(String) files.nextElement();
			filename.add(multi.getFilesystemName(name));
			//filename4 3 2 1 thumbnail 식으로 저장됨
			file=multi.getFile(name);
		}	
		
		ProductDataBean product=new ProductDataBean();
		
		product.setBoardid(multi.getParameter("boardid"));
		product.setContent(multi.getParameter("content"));
		product.setHome(multi.getParameter("home"));
		product.setNewpage(multi.getParameter("newpage"));
		product.setSale(multi.getParameter("sale"));
		product.setWriterid(multi.getParameter("writerid"));
		product.setIp(request.getRemoteAddr());
		product.setProductname(multi.getParameter("productname"));
		product.setPrice(multi.getParameter("price"));
		product.setShippingfee(multi.getParameter("shippingfee"));
		product.setSaleprice(multi.getParameter("saleprice"));
		product.setExposure(multi.getParameter("exposure"));
		
		if(file!=null) {
			//파일이 있을 경우만 업데이트
			product.setThumbnail((String)filename.get(filename.size()-1));
			String[] filename2=new String[4];
			for(int i=filename.size()-2;i>=0;i--) {
				
				filename2[filename.size()-2-i]=(String)filename.get(i);
			}
			
			product.setFilename1(filename2[0]);
			product.setFilename2(filename2[1]);
			product.setFilename3(filename2[2]);
			product.setFilename4(filename2[3]);
			product.setFilesize((int)file.length());
		}
		else {
			product.setThumbnail(" ");
			product.setFilename1(" ");
			product.setFilename2(" ");
			product.setFilename3(" ");
			product.setFilename4(" ");
			product.setFilesize(0);
		}
		System.out.println(product);
		
		ProductDBBean dbPro=ProductDBBean.getInstance();
		dbPro.insertProduct(product);
		response.sendRedirect("productList");
		
	
		return  null; 
	}
	
	public String productDetail(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		HttpSession session=request.getSession();
		String pageNum=request.getParameter("pageNum");
		LoginDataBean member=(LoginDataBean)session.getAttribute("member");
		String writerid=member.getId();
		
		if(pageNum==null||pageNum==""){
			pageNum="1";
		}
		int num=Integer.parseInt(request.getParameter("num"));
		
		ProductDBBean dbPro=ProductDBBean.getInstance();
		ProductDataBean product=dbPro.getProduct(num);
		
		request.setAttribute("ip", request.getRemoteAddr());
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("writerid", writerid);
		request.setAttribute("product", product);
		
	
		return  "/admin/productDetail.jsp"; 
	} 

	public String productUpdate(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		HttpSession session=request.getSession();
		LoginDataBean member=(LoginDataBean)session.getAttribute("member");
		
		String realFolder="";
		String encType="euc-kr";
		int maxSize=5*1024*1024;
		ServletContext context =request.getServletContext();
		realFolder=context.getRealPath("filesave");
		MultipartRequest multi=null;
		System.out.println(realFolder);
		multi=new MultipartRequest(request, realFolder,maxSize,encType,new DefaultFileRenamePolicy());
		Enumeration files=multi.getFileNames();
		String[] filename=new String[5];
		File file=null;
		//filename[] array로 만들기 filename db에도 여러개 만들어야함
		int i=0;
		while(files.hasMoreElements()) {
			
			String name=(String) files.nextElement();
			file=multi.getFile(name);
			filename[i]=multi.getFilesystemName(name);
			i++;

			//filename4 3 2 1 thumbnail 식으로 저장됨
		}		
		
		ProductDataBean product=new ProductDataBean();
		String filehave="true";
		String num=multi.getParameter("num");
		System.out.println("=======num값======="+num);
		request.setAttribute("num", num);
		
		product.setWriterid(member.getId());
		product.setIp(request.getRemoteAddr());
		product.setBoardid(multi.getParameter("boardid"));
		product.setContent(multi.getParameter("content"));
		product.setHome(multi.getParameter("home"));
		product.setNewpage(multi.getParameter("newpage"));
		product.setSale(multi.getParameter("sale"));
		product.setIp(request.getRemoteAddr());
		product.setProductname(multi.getParameter("productname"));
		product.setPrice(multi.getParameter("price"));
		product.setShippingfee(multi.getParameter("shippingfee"));
		product.setSaleprice(multi.getParameter("saleprice"));
		product.setExposure(multi.getParameter("exposure"));
		
		if(file!=null)  {
			System.out.println("파일이 있음");
			//파일이 있을 경우만 업데이트
			product.setThumbnail((String)filename[4]);
			String[] filename2=new String[4];
			for(int k=3;k>=0;k--) {				
				filename2[3-k]=filename[k];
			}
			
			product.setFilename1(filename2[0]);
			product.setFilename2(filename2[1]);
			product.setFilename3(filename2[2]);
			product.setFilename4(filename2[3]);
			product.setFilesize((int)file.length());
		}
		else {
			System.out.println("파일이 없음");

			filehave="false";
		}
		
		
		System.out.println(product);
		
		ProductDBBean dbPro=ProductDBBean.getInstance();
		int chk=dbPro.updateProduct(product,num,filehave);
		System.out.println("chk"+chk);
		request.setAttribute("chk", chk);
		String pageNum=multi.getParameter("pageNum");
		request.setAttribute("pageNum", pageNum);
		return  "/back/productUpdatePro.jsp"; 
	} 
	
	public String orderList(HttpServletRequest request,	 HttpServletResponse response)  throws Throwable { 
		String orderfilter=request.getParameter("orderfilter");
		if(orderfilter==null||orderfilter=="") {
			orderfilter="0";
		}
		String id="";
		System.out.println("orderfilter"+orderfilter);
		int pageSize=20;
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null||pageNum==""){
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);
		int startRow=(currentPage-1)*pageSize+1;
		int endRow=currentPage*pageSize;
		int count=0;
		int number=0;
		List orderList=null;
		OrderDBBean orderPro=OrderDBBean.getInstance();
		count=orderPro.getOrderCount("admin");
		if(count>0){
			orderList=orderPro.getOrders(startRow, endRow, orderfilter,id);
		}
		number=count-(currentPage-1)*pageSize;
		
		request.setAttribute("orderfilter", orderfilter);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("count", count);
		request.setAttribute("number", number);
		request.setAttribute("orderList", orderList);
		
		int bottomLine=5;
		request.setAttribute("bottomLine", bottomLine);
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		int startPage=1+(currentPage-1)/bottomLine*bottomLine;
		int endPage=startPage+bottomLine-1;
		if(endPage>pageCount)
			endPage=pageCount;
		
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
			return  "/admin/orderList.jsp"; 
		}
	public String orderDetail(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		int ordernum=Integer.parseInt(request.getParameter("ordernum"));
		OrderDBBean orderPro=OrderDBBean.getInstance();
		List orderDetailList=orderPro.getOrder(ordernum);
		request.setAttribute("orderDetailList", orderDetailList);
		
		
		return  "/admin/orderDetail.jsp"; 
	} 
	
}