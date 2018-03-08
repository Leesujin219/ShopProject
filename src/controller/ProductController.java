package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.msk.Action;

import login.LoginDataBean;
import product.OrderDBBean;
import product.OrderDataBean;
import product.ProductDBBean;
import product.ProductDataBean;
import product.WishListDBBean;
import product.WishListDataBean;
import product.productCart;

public class ProductController extends Action {
	public String list(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 

		String categoryid=request.getParameter("categoryid");
		System.out.println("카테고리아이디1:"+categoryid);
		if(categoryid==null||categoryid=="") {
			categoryid="ht";
		}
		System.out.println("카테고리아이디2:"+categoryid);

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
		List productList=null;
		ProductDBBean dbPro=ProductDBBean.getInstance(); 
		count=dbPro.getProductCount(categoryid); 
		System.out.println("count 값 : "+count);
		if(count>0){
			productList=dbPro.getProducts(startRow,endRow,categoryid);
		}
		
		number=count-(currentPage-1)*pageSize;
		
		request.setAttribute("categoryid", categoryid);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("count", count);
		request.setAttribute("number", number);
		request.setAttribute("productList", productList);
		
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
	
		return "/view/productView.jsp";
	} 
	
	public String detail(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		ProductDataBean product=new ProductDataBean();
		ProductDBBean dbPro=ProductDBBean.getInstance();
		System.out.println("productDetail 접근중===========================");
		String edit=request.getParameter("edit");
		request.setAttribute("edit", edit);
		product=dbPro.getProduct(Integer.parseInt(request.getParameter("num")));
		request.setAttribute("product", product);
		
		return  "/view/productDetail.jsp"; 
	} 

	public String cart(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		productCart cartPro=productCart.getInstance();
		String numParam=request.getParameter("num");
		String edit=request.getParameter("edit");	//수정버전
		if(numParam!=null&&numParam!="") {

		int num=Integer.parseInt(numParam);
		int count=Integer.parseInt(request.getParameter("count"));

		
		if(cartPro.cartReturn().containsKey(num)&&(!edit.equals("true"))) {
			//이미 장바구니에 상품이 담겨있을 때 값 처리
			request.setAttribute("already", "true");
			
		return "/back/cartPut.jsp";
		}
		
		cartPro.cartPut(num, count);
		
		request.setAttribute("edit", edit);
		//장바구니 상품 갯수 수정 위해 넣음
		return "/back/cartPut.jsp";
		}
		//바로 카테고리에서 접근할때
		LinkedHashMap cart=cartPro.cartReturn(); 
		request.setAttribute("cart", cart);
		ArrayList cartNumList=cartPro.getNumList();//product객체 가지고 있는 arraylist
		request.setAttribute("cartNumList", cartNumList);
		
		return  "/view/cart.jsp"; 
		
		
	} 

	
	public String buy(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		//장바구니에서 넘어올 데이터
		ProductDBBean dbPro=ProductDBBean.getInstance();

		String[] buyNumList=request.getParameterValues("numList");	//구매할 제품 리스트
		ArrayList buyList=new ArrayList();
		
		for(int i=0;i<buyNumList.length;i++) {
			buyList.add(dbPro.getProduct(Integer.parseInt(buyNumList[i])));
		}
		request.setAttribute("buyList", buyList);
		
		String totalPrice=request.getParameter("totalPrice");
		request.setAttribute("totalPrice", totalPrice);
		
		productCart cartPro=productCart.getInstance();
		LinkedHashMap cart=cartPro.cartReturn();	//구매번호-구매수량. 구매수량 가져오기 위해 request로 보냄
		request.setAttribute("cart", cart);
		
		//주문정보받기위한 member데이터 받기
		HttpSession session=request.getSession();
		session=request.getSession();
		LoginDataBean member=(LoginDataBean)session.getAttribute("member");
		request.setAttribute("member", member);
		
		return  "/view/buy.jsp"; 
	}
	public String buyOnly(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		//buy버튼에서 넘어올 데이터
		ProductDBBean dbPro=ProductDBBean.getInstance();
		int num=Integer.parseInt(request.getParameter("num"));
		ProductDataBean product=dbPro.getProduct(num);
		int count=Integer.parseInt(request.getParameter("count"));
		
		request.setAttribute("product", product);
		request.setAttribute("count", count);
	
		HttpSession session=request.getSession();
		session=request.getSession();
		LoginDataBean member=(LoginDataBean)session.getAttribute("member");
		request.setAttribute("member", member);
		
		return  "/view/buyOnly.jsp"; 
	} 
	
	public String cartDelete(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		int numdel=Integer.parseInt(request.getParameter("numdel"));
		productCart cartPro=productCart.getInstance();
		cartPro.cartDelete(numdel);
		
		
		return "/product/cart"; 
	} 
	
	//주문기록
	public String orderPut(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		HttpSession session=request.getSession();
		LoginDataBean member=(LoginDataBean)session.getAttribute("member");
		productCart cartPro=productCart.getInstance();
		OrderDataBean order=new OrderDataBean();
		String type=request.getParameter("type");
		if(type==null||type=="") {
			type="cart";
		}
		System.out.println("type==============="+type);
		
		String[] numList=request.getParameterValues("numList");	//buy에서 가져온 numList 파라미터들(구매제품num)
		System.out.println("numList길이:"+numList.length);
		ArrayList productList=new ArrayList();
		ArrayList countList=new ArrayList();
		
		ProductDBBean dbPro=ProductDBBean.getInstance();
		OrderDBBean dbProOrder=OrderDBBean.getInstance();
		
		
		for(int i=0;i<numList.length;i++) {
			ProductDataBean product=dbPro.getProduct(Integer.parseInt(numList[i]));
			productList.add(product);	//구매할 제품 리스트 추가
			System.out.println("넘어옴");
			if(type.equals("only")){
				//buy에서 넘어온 값일 때
				countList.add(Integer.parseInt(request.getParameter("count")));
			}else{
				System.out.println("else문!~~~~~~~~~~~~~~~~~~~~~~");
				countList.add(cartPro.getCount(Integer.parseInt(numList[i])));// 제품의 구매수량 추가	
			}
			
		}
		
		order.setTotalprice(request.getParameter("totalPrice"));
		order.setName(request.getParameter("name"));

		if(member!=null) {
			order.setId(member.getId());
		}else {
			order.setId("null");
		}
		order.setGetname(request.getParameter("getname"));
		order.setPhone(request.getParameter("phone"));
		order.setAddrnum(request.getParameter("addrnum"));
		order.setAddress1(request.getParameter("address1"));
		order.setAddress2(request.getParameter("address2"));
		//주문자 정보 값 order세팅
		
		int orderNum=dbProOrder.insertOrder(order,productList,countList);//주문번호 넘겨받음
		request.setAttribute("orderNum", orderNum);
				
		return  "/view/orderPut.jsp"; 
	} 
	public String orderUpdate(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		String login=request.getParameter("login");
		int ordernum=Integer.parseInt(request.getParameter("ordernum"));
		String type=request.getParameter("type");
		int result;
		OrderDBBean orderPro=OrderDBBean.getInstance();
		result=orderPro.updateOrder(type, ordernum);
		request.setAttribute("type", type);
		request.setAttribute("result", result);
		request.setAttribute("ordernum", ordernum);
		request.setAttribute("login", login);
		
		return  "/back/orderUpdate.jsp"; 
	}
	public String wish(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		HttpSession session=request.getSession();
		LoginDataBean member=(LoginDataBean)session.getAttribute("member");
		
		WishListDBBean wishPro=WishListDBBean.getInstance();
		WishListDataBean wish=new WishListDataBean();

		int num=Integer.parseInt(request.getParameter("num"));
		wish.setId(member.getId());
		wish.setNum(num);
		wishPro.insertWish(wish);

		return  "/back/wish.jsp"; 
	} 

}
