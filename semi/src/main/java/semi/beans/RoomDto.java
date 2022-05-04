package semi.beans;

public class RoomDto {
	private int roomNo;
	private String roomType;
	private String roomBedType;
	private int roomBasicPeople;
	private int roomMaxPeople;
	private long roomRates;
	private long roomSeasonExtra;
	
	public RoomDto() {
		super();
	}
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
	public String getRoomBedType() {
		return roomBedType;
	}
	public void setRoomBedType(String roomBedType) {
		this.roomBedType = roomBedType;
	}
	public int getRoomBasicPeople() {
		return roomBasicPeople;
	}
	public void setRoomBasicPeople(int roomBasicPeople) {
		this.roomBasicPeople = roomBasicPeople;
	}
	public int getRoomMaxPeople() {
		return roomMaxPeople;
	}
	public void setRoomMaxPeople(int roomMaxPeople) {
		this.roomMaxPeople = roomMaxPeople;
	}
	public long getRoomRates() {
		return roomRates;
	}
	public void setRoomRates(long roomRates) {
		this.roomRates = roomRates;
	}
	public long getRoomSeasonExtra() {
		return roomSeasonExtra;
	}
	public void setRoomSeasonExtra(long roomSeasonExtra) {
		this.roomSeasonExtra = roomSeasonExtra;
	}
	
	
	
}
