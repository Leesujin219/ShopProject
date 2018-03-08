package product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;

public class productCart {
	private static productCart instance=new productCart();
	LinkedHashMap cart;
	private productCart() {
		cart=new LinkedHashMap();
		
	}
	public static productCart getInstance(){
		return instance;
	}
	public void cartPut(int num,int count){
		cart.put(num, count);
	}
	public void cartDelete(int num) {
		cart.remove(num);
	}
	public int getSize() {
		return cart.size();
	}
	public ArrayList getNumList() {
		ArrayList cartNumList=new ArrayList();
		ProductDataBean product=new ProductDataBean();
		ProductDBBean dbPro=ProductDBBean.getInstance();
	
		Iterator iterator = cart.keySet().iterator();
		while (iterator.hasNext()) {
			int num= (int) iterator.next();
		    product=dbPro.getProduct(num);    
			cartNumList.add(product);
		 }
		
		return cartNumList;
	}
	public int getCount(int num) {
		return (int)cart.get(num);
	}
	public LinkedHashMap cartReturn() {
		return cart;
	}
	
	
	
}
