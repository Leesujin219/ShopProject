package product;

import java.util.Date;

public class ProductDataBean {
	private int num;
	private String boardid;
	private Date regdate;
	private String content;
	private String home;
	private String newpage;
	private String sale;
	private String writerid;
	private String ip;
	private String productname;
	private String price;
	private String shippingfee;
	private String thumbnail;
	private String filename1;
	private String filename2;
	private String filename3;
	private String filename4;
	private String salepercent;
	private String saleprice;//할인할 금액
	private String exposure;
	private int filesize;
	private String[] boardtype= {"인테리어소품","가구","주방용품","침구류"};
	private String[] openhome= {"O","X"};
	private String[] opennewpage= {"O","X"};
	private String[] opensale= {"O","X"};
	private String[] openexposure= {"O","X"};

	
	public String getBoardtype() {
		int board=Integer.parseInt(boardid)-1;
		return boardtype[board];
		
	}
	public String getOpenhome() {
		if(home.equals("t")) {
			return openhome[0];
		}else
			return openhome[1];
	}
	public String getOpennewpage() {
		if(newpage.equals("t")) {
			return openhome[0];
		}else
			return openhome[1];
	}
	public String getOpensale() {
		if(sale.equals("t")) {
			return openhome[0];
		}else
			return openhome[1];
	}
	public String getOpenexposure() {
		if(exposure.equals("t")) {
			return openhome[0];
		}else
			return openhome[1];
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getBoardid() {
		return boardid;
	}
	public void setBoardid(String boardid) {
		this.boardid = boardid;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getHome() {
		return home;
	}
	public void setHome(String home) {
		this.home = home;
	}
	public String getNewpage() {
		return newpage;
	}
	public void setNewpage(String newpage) {
		this.newpage = newpage;
	}
	public String getSale() {
		return sale;
	}
	public void setSale(String sale) {
		this.sale = sale;
	}
	public String getWriterid() {
		return writerid;
	}
	public void setWriterid(String writerid) {
		this.writerid = writerid;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getShippingfee() {
		return shippingfee;
	}
	public void setShippingfee(String shippingfee) {
		this.shippingfee = shippingfee;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getFilename1() {
		return filename1;
	}
	public void setFilename1(String filename1) {
		this.filename1 = filename1;
	}
	public String getFilename2() {
		return filename2;
	}
	public void setFilename2(String filename2) {
		this.filename2 = filename2;
	}
	public String getFilename3() {
		return filename3;
	}
	public void setFilename3(String filename3) {
		this.filename3 = filename3;
	}
	public String getFilename4() {
		return filename4;
	}
	public void setFilename4(String filename4) {
		this.filename4 = filename4;
	}
	public String getSalepercent() {
		return salepercent;
	}
	public void setSalepercent(String salepercent) {
		this.salepercent = salepercent;
	}
	public String getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(String saleprice) {
		this.saleprice = saleprice;
	}
	public String getExposure() {
		return exposure;
	}
	public void setExposure(String exposure) {
		this.exposure = exposure;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	@Override
	public String toString() {
		return "ProductDataBean [num=" + num + ", boardid=" + boardid + ", regdate=" + regdate + ", content=" + content
				+ ", home=" + home + ", newpage=" + newpage + ", sale=" + sale + ", writerid=" + writerid + ", ip=" + ip
				+ ", productname=" + productname + ", price=" + price + ", shippingfee=" + shippingfee + ", thumbnail="
				+ thumbnail + ", filename1=" + filename1 + ", filename2=" + filename2 + ", filename3=" + filename3
				+ ", filename4=" + filename4 + ", salepercent=" + salepercent + ", saleprice=" + saleprice
				+ ", exposure=" + exposure + ", filesize=" + filesize + "]";
	}
	
	
}
