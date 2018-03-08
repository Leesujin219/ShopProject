package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.msk.Action;

import login.LoginDBBean;
import login.LoginDataBean;
import product.OrderDBBean;
import product.ProductDBBean;
import product.ProductDataBean;
import product.WishListDBBean;
import product.WishListDataBean;
import product.productCart;

public class LoginController extends Action {
	public String enter(HttpServletRequest request,	 HttpServletResponse response)  throws Throwable { 
			return  "/view/login.jsp"; 
			} 
	public String loginPro(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		
		HttpSession session=request.getSession();
		String id=request.getParameter("id");
		String pw=request.getParameter("password");
		
		LoginDBBean logbean=LoginDBBean.getInstance();
		int check=logbean.loginCheck(id, pw);
		System.out.println("check=================="+check);
		String msg="";
		if(check==1){
			System.out.println("check 1 로 들어옴");
			LoginDataBean member=logbean.getMember(id);
			session.setAttribute("member",member);
			return "/back/loginPro.jsp";
		}else if(check==0){
			msg="0";

		}else{
			msg="-1";

		}
		request.setAttribute("msg", msg);
		return  "/view/login.jsp"; 
		
	
	} 
	public String out(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		
		HttpSession session=request.getSession();
		session.invalidate();
		response.sendRedirect("enter");	
		
		return  null; 
			} 
	public String join(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
			 return  "/view/memberJoin.jsp"; 
	} 
	public String joinPro(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		LoginDBBean dbPro=LoginDBBean.getInstance();
		int idChk=dbPro.joinIdCheck(request.getParameter("id"));
		request.setAttribute("idChk", idChk);
		
		//password값 비교
		String pwd=request.getParameter("password");
		String pwd2=request.getParameter("password2");
		if(pwd.equals(pwd2)) {	
			request.setAttribute("pwdChk", "true");

			if(idChk==0) {
				LoginDataBean member=new LoginDataBean();
				member.setId(request.getParameter("id"));
				member.setPassword(request.getParameter("password"));
				member.setName(request.getParameter("name"));
				member.setEmail(request.getParameter("email"));
				member.setPhone(request.getParameter("phone"));
				member.setGender(request.getParameter("gender"));
				member.setBirthday(request.getParameter("birthday"));
				member.setAddrnum(request.getParameter("addrnum"));
				member.setAddress1(request.getParameter("address1"));
				member.setAddress2(request.getParameter("address2"));
				
				System.out.println(member);
				dbPro.insertMember(member);		
				
			}
		}else {
			request.setAttribute("pwdChk", "false");
		}
		
		return  "/back/memberJoinPro.jsp"; 
			} 
	
	public String mypage(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		
		HttpSession session=request.getSession();
		LoginDataBean member=(LoginDataBean)session.getAttribute("member");
		
		request.setAttribute("member",member);
		System.out.println(member.getGender());
		
		return  "/view/memberMypage.jsp"; 
			} 
	
	public String updatePro(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		HttpSession session=request.getSession();
		
		String newPw=request.getParameter("password2");
		if(newPw==null||newPw==""){
			newPw="n";
		}
		LoginDataBean member=new LoginDataBean();
		member.setId(request.getParameter("id"));
		member.setPassword(request.getParameter("password"));
		member.setName(request.getParameter("name"));
		member.setEmail(request.getParameter("email"));
		member.setPhone(request.getParameter("phone"));
		member.setGender(request.getParameter("gender"));
		member.setBirthday(request.getParameter("birthday"));
		member.setAddrnum(request.getParameter("addrnum"));
		member.setAddress1(request.getParameter("address1"));
		member.setAddress2(request.getParameter("address2"));		
		
		System.out.println(member);
		LoginDBBean dbPro=LoginDBBean.getInstance();
		int chk=dbPro.updateMember(member,newPw);
		if(chk==1) {
		//session.invalidate() <- 하면 세션이 죽어버림.
			session.setAttribute("member", member);
		}
		
		request.setAttribute("chk",chk);
		
		return  "/back/updatePro.jsp"; 
			} 
	
	
	public String delete(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
			 return  "/view/memberDelete.jsp"; 
			} 
	public String deletePro(HttpServletRequest request,	 HttpServletResponse response)  throws Throwable { 
		String type=request.getParameter("type");	//관리자 계정인지 체크
		String inputPw;
		String id;
		HttpSession session=request.getSession();

		if(type.equals("admin")){
			id=request.getParameter("id");
			inputPw=request.getParameter("adminPw");
			System.out.println(type+"\n"+id+"\n"+inputPw);

		}else{
			System.out.println("타입: "+type+"\n");

			LoginDataBean member=(LoginDataBean)session.getAttribute("member");
			id=member.getId();
			inputPw=request.getParameter("password");
			
		}
		
		
		LoginDBBean dbPro=LoginDBBean.getInstance();
		int check=dbPro.deleteMember(id,inputPw,type);
		request.setAttribute("check",check);
		request.setAttribute("type", type);
		if(check==1) {
			if(type.equals("guest")) {
				session.invalidate();
			}

		}
		
		return  "/back/memberDeletePro.jsp"; 
	} 
	
	public String orderList(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		HttpSession session=request.getSession();
		LoginDataBean member=(LoginDataBean)session.getAttribute("member");
		String id=member.getId();
		String orderfilter="0";
		
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
		count=orderPro.getOrderCount(id);
		System.out.println("--------------count값--"+count);
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
		
		return  "/view/orderListUser.jsp"; 
	} 
	
	public String orderDetail(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		int ordernum=Integer.parseInt(request.getParameter("ordernum"));
		OrderDBBean orderPro=OrderDBBean.getInstance();
		List orderDetailList=orderPro.getOrder(ordernum);
		request.setAttribute("orderDetailList", orderDetailList);
		
		return  "/view/orderDetailUser.jsp"; 
	} 
	
	public String noLoginDetail(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		int ordernum=Integer.parseInt(request.getParameter("ordernum"));
		System.out.println("noLoginDetail에서 ordernum======"+ordernum);
		String orderCheck=request.getParameter("orderCheck");
		request.setAttribute("orderCheck", orderCheck);
		System.out.println("noLoginDetail에서 orderCheck======"+orderCheck);
		OrderDBBean orderPro=OrderDBBean.getInstance();
		String type="";
		int orderNumChk=orderPro.checkOrderNum(ordernum);
		System.out.println("noLoginDetail에서 orderNumChk========="+orderNumChk);
		
		if(orderNumChk==0) {
			type="noOrder";
			System.out.println("type========="+type);
			request.setAttribute("type", type);
			return  "/back/noLoginCheck.jsp";
			
		}else {
			
			List orderDetailList=orderPro.getOrder(ordernum);
			request.setAttribute("orderDetailList", orderDetailList);
			request.setAttribute("ordernum", ordernum);
			return  "/view/noLoginDetail.jsp"; 
		}
	} 
	
	public String noLoginCheck(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		int ordernum=Integer.parseInt(request.getParameter("ordernum"));
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		OrderDBBean orderPro=OrderDBBean.getInstance();
		int chk=orderPro.checkOrder(name, phone);
		request.setAttribute("ordernum", ordernum);
		System.out.println("noLoginCheck:ordernum============="+ordernum);
		
		request.setAttribute("chk", chk);
		request.setAttribute("orderCheck", "0");
		request.setAttribute("type", "0");
		return  "/back/noLoginCheck.jsp"; 

	} 
	
	public String wishList(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		int pageSize=20;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null||pageNum==""){
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);
		int startRow=(currentPage-1)*pageSize+1;
		int endRow=currentPage*pageSize;
		int count=0;
		int number=0;
		List wishList=null;
		List productList=new ArrayList();;
		HttpSession session=request.getSession();
		LoginDataBean member=(LoginDataBean)session.getAttribute("member");
		String id=member.getId();
		WishListDBBean wishPro=WishListDBBean.getInstance();
		ProductDBBean productPro=ProductDBBean.getInstance();
		
		count=wishPro.getWishCount(id);
		request.setAttribute("count", count);

		if(count>0){
			//wishList뽑음
			wishList=wishPro.getWishs(startRow, endRow);
			System.out.println(wishList.size()+"<<<<wishList size");
			for(int i=0;i<wishList.size();i++) {
				int num=((WishListDataBean)wishList.get(i)).getNum();//제품번호
				System.out.println("=====wishlist에 들어간 num번호===="+num);
				ProductDataBean product=productPro.getProduct(num);
				System.out.println(product);
				productList.add(product);
			}
		}
		number=count-(currentPage-1)*pageSize;
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("count", count);
		request.setAttribute("number", number);
		request.setAttribute("wishList", wishList);
		request.setAttribute("productList", productList);
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
		
		
		return  "/view/wishList.jsp"; 
	} 
	
	public String wishDelete(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		int wishnum=Integer.parseInt(request.getParameter("wishnum"));
		WishListDBBean wishPro=WishListDBBean.getInstance();
		int x=wishPro.deleteWish(wishnum);
		request.setAttribute("x", x);		
		
		return  "/back/wishDelete.jsp"; 
	} 
	
	
	
	
	
	
}
