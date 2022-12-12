package kr.co.itwill.tickets;

public class TicketDetailDTO {
	private int tdno;
	private String tck_num;
	private int cseat;
	private int price;
	private String discount;
	private int f_pay;
	
	public TicketDetailDTO() {}

	public int getTdno() {
		return tdno;
	}

	public void setTdno(int tdno) {
		this.tdno = tdno;
	}

	public String getTck_num() {
		return tck_num;
	}

	public void setTck_num(String tck_num) {
		this.tck_num = tck_num;
	}

	public int getCseat() {
		return cseat;
	}

	public void setCseat(int cseat) {
		this.cseat = cseat;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public int getF_pay() {
		return f_pay;
	}

	public void setF_pay(int f_pay) {
		this.f_pay = f_pay;
	}

	@Override
	public String toString() {
		return "TicketDetailDTO [tdno=" + tdno + ", tck_num=" + tck_num + ", cseat=" + cseat + ", price=" + price
				+ ", discount=" + discount + ", f_pay=" + f_pay + "]";
	}
	
	

}//class end
