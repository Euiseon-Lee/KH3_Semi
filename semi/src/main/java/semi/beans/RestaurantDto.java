package semi.beans;

import java.sql.Date;

public class RestaurantDto {
	
	 private int rest_tableno; // 레스토랑 테이블 번호
	 private int rest_peoplenum; // 레스토랑 테이블 이용인원
	 private long rest_mealtype; // 레스토랑 식사유형
	 private Date rest_mealprice; // 레스토랑 식사금액

	public int getRest_tableno() {
		return rest_tableno;
	}
	public void setRest_tableno(int rest_tableno) {
		this.rest_tableno = rest_tableno;
	}
	public int getRest_peoplenum() {
		return rest_peoplenum;
	}
	public void setRest_peoplenum(int rest_peoplenum) {
		this.rest_peoplenum = rest_peoplenum;
	}
	public long getRest_mealtype() {
		return rest_mealtype;
	}
	public void setRest_mealtype(long rest_mealtype) {
		this.rest_mealtype = rest_mealtype;
	}
	public Date getRest_mealprice() {
		return rest_mealprice;
	}
	public void setRest_mealprice(Date rest_mealprice) {
		this.rest_mealprice = rest_mealprice;
	}
	
	@Override
	public String toString() {
		return "RestaurantDto [rest_tableno=" + rest_tableno + ", rest_peoplenum=" + rest_peoplenum + ", rest_mealtype="
				+ rest_mealtype + ", rest_mealprice=" + rest_mealprice + "]";
	}

}
