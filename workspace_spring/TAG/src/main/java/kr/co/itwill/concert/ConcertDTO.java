package kr.co.itwill.concert;

public class ConcertDTO {

	 	private int	   c_no; 		
		private String title;	
		private String date; 		
		private String start_time;        
		private String end_time; 	
		private String open_eb;
		private String close_eb; 	
		private String open_tck; 	
		private String close_tck; 	
		private String genre; 		
		private String j_id; 		
		private String com_name; 
		private String dlv_date; 
		private String edit; 	
		
		//Default Constructor	
	    public ConcertDTO() {}
	    
	    //getter·setter
		public int getC_no() {
			return c_no;
		}

		public void setC_no(int c_no) {
			this.c_no = c_no;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getDate() {
			return date;
		}

		public void setDate(String date) {
			this.date = date;
		}

		public String getStart_time() {
			return start_time;
		}

		public void setStart_time(String start_time) {
			this.start_time = start_time;
		}

		public String getEnd_time() {
			return end_time;
		}

		public void setEnd_time(String end_time) {
			this.end_time = end_time;
		}

		public String getOpen_eb() {
			return open_eb;
		}

		public void setOpen_eb(String open_eb) {
			this.open_eb = open_eb;
		}

		public String getClose_eb() {
			return close_eb;
		}

		public void setClose_eb(String close_eb) {
			this.close_eb = close_eb;
		}

		public String getOpen_tck() {
			return open_tck;
		}

		public void setOpen_tck(String open_tck) {
			this.open_tck = open_tck;
		}

		public String getClose_tck() {
			return close_tck;
		}

		public void setClose_tck(String close_tck) {
			this.close_tck = close_tck;
		}

		public String getGenre() {
			return genre;
		}

		public void setGenre(String genre) {
			this.genre = genre;
		}

		public String getJ_id() {
			return j_id;
		}

		public void setJ_id(String j_id) {
			this.j_id = j_id;
		}

		public String getCom_name() {
			return com_name;
		}

		public void setCom_name(String com_name) {
			this.com_name = com_name;
		}

		public String getDlv_date() {
			return dlv_date;
		}

		public void setDlv_date(String dlv_date) {
			this.dlv_date = dlv_date;
		}

		public String getEdit() {
			return edit;
		}

		public void setEdit(String edit) {
			this.edit = edit;
		}
		
		
		//toString
		@Override
		public String toString() {
			return "ConcertDTO [c_no=" + c_no + ", title=" + title + ", date=" + date + ", start_time=" + start_time
					+ ", end_time=" + end_time + ", open_eb=" + open_eb + ", close_eb=" + close_eb + ", open_tck="
					+ open_tck + ", close_tck=" + close_tck + ", genre=" + genre + ", j_id=" + j_id + ", com_name="
					+ com_name + ", dlv_date=" + dlv_date + ", edit=" + edit + "]";
		} 
	    
	    

}//DTO end
