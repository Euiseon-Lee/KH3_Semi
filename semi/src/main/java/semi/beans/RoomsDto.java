package semi.beans;

public class RoomsDto {
	private int roomNo;
	private String roomType;
	private int roomPeople;
	private long peakSeason;
	private long offSeason;
	public int getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(int roomNo) {
		this.roomNo = roomNo;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public int getRoomPeople() {
		return roomPeople;
	}
	public void setRoomPeople(int roomPeople) {
		this.roomPeople = roomPeople;
	}
	public long getPeakSeason() {
		return peakSeason;
	}
	public void setPeakSeason(long peakSeason) {
		this.peakSeason = peakSeason;
	}
	public long getOffSeason() {
		return offSeason;
	}
	public void setOffSeason(long offSeason) {
		this.offSeason = offSeason;
	}
	public RoomsDto() {
		super();
	}
	
}
