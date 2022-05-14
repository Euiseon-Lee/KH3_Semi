package semi.beans;

import java.sql.Date;

public class SeasonDto {
	private int seasonNo;
	private String seasonType;
	private Date seasonStart;
	private Date seasonEnd;
	
	
	public int getSeasonNo() {
		return seasonNo;
	}
	public void setSeasonNo(int seasonNo) {
		this.seasonNo = seasonNo;
	}
	public String getSeasonType() {
		return seasonType;
	}
	public void setSeasonType(String seasonType) {
		this.seasonType = seasonType;
	}
	public Date getSeasonStart() {
		return seasonStart;
	}
	public void setSeasonStart(Date seasonStart) {
		this.seasonStart = seasonStart;
	}
	public Date getSeasonEnd() {
		return seasonEnd;
	}
	public void setSeasonEnd(Date seasonEnd) {
		this.seasonEnd = seasonEnd;
	}
	
	
}
