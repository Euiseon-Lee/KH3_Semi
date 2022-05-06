package semi.beans;

import java.sql.Date;

public class PrivatePoolDto {
	
	 private int pool_no; // 개인풀 방 번호
	 private int pool_useprice; // 개인풀 이용금액
	 
	public int getPool_no() {
		return pool_no;
	}
	public void setPool_no(int pool_no) {
		this.pool_no = pool_no;
	}
	public int getPool_useprice() {
		return pool_useprice;
	}
	public void setPool_useprice(int pool_useprice) {
		this.pool_useprice = pool_useprice;
	}
	
	@Override
	public String toString() {
		return "PrivatePoolDto [pool_no=" + pool_no + ", pool_useprice=" + pool_useprice + "]";
	}

}
