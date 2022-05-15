package semi.beans;

import java.sql.Date;

public class SeasonDto {
	private int seasonNo;
	private String seasonType;
	private Date seasonStart;
	private String seasonStartString;
	private Date seasonEnd;
	private String seasonEndString;
	public SeasonDto() {
		super();
	}
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
	public String getSeasonStartString() {
		return seasonStartString;
	}
	public void setSeasonStartString(String seasonStartString) {
		this.seasonStartString = seasonStartString;
	}
	public Date getSeasonEnd() {
		return seasonEnd;
	}
	public void setSeasonEnd(Date seasonEnd) {
		this.seasonEnd = seasonEnd;
	}
	public String getSeasonEndString() {
		return seasonEndString;
	}
	public void setSeasonEndString(String seasonEndString) {
		this.seasonEndString = seasonEndString;
	}
	
}