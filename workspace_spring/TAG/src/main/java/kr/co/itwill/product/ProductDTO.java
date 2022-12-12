package kr.co.itwill.product;

public class ProductDTO {

	private int pro_no;
    private char category;
    private int c_no; 
    private String p_id;
    private String pro_name;
    private int stock;
    private String color;
    private char size;
    private int price;
    private String regdate;
    private String edit;
    private char status;
    private int likecnt;
    private String postername;
    
    public ProductDTO() {}

	public int getPro_no() {
		return pro_no;
	}

	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}

	public char getCategory() {
		return category;
	}

	public void setCategory(char category) {
		this.category = category;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public char getSize() {
		return size;
	}

	public void setSize(char size) {
		this.size = size;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getEdit() {
		return edit;
	}

	public void setEdit(String edit) {
		this.edit = edit;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}

	public int getLikecnt() {
		return likecnt;
	}

	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}

	public String getPostername() {
		return postername;
	}

	public void setPostername(String postername) {
		this.postername = postername;
	}

	@Override
	public String toString() {
		return "ProductDTO [pro_no=" + pro_no + ", category=" + category + ", c_no=" + c_no + ", p_id=" + p_id
				+ ", pro_name=" + pro_name + ", stock=" + stock + ", color=" + color + ", size=" + size + ", price="
				+ price + ", regdate=" + regdate + ", edit=" + edit + ", status=" + status + ", likecnt=" + likecnt
				+ ", postername=" + postername + "]";
	}
    
}//class end
