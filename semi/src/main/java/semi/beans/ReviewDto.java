package semi.beans;

import java.sql.Date;


public class ReviewDto {
	private long reviewNo;
	private String reviewMemberId;
	private int reviewRoomNo;
	private String reviewTitle;
	private String reviewContent;
	private Date reviewWritedate;
	private long reviewReadcount;
	private int reviewStar;
	private int reviewReplycount;


	public ReviewDto() {
		super();
	}
	
	public int getReviewReplycount() {
		return reviewReplycount;
	}


	public void setReviewReplycount(int reviewReplycount) {
		this.reviewReplycount = reviewReplycount;
	}
	
	public long getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(long reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getReviewMemberId() {
		return reviewMemberId;
	}
	public void setReviewMemberId(String reviewMemberId) {
		this.reviewMemberId = reviewMemberId;
	}
	public int getReviewRoomNo() {
		return reviewRoomNo;
	}
	public void setReviewRoomNo(int reviewRoomNo) {
		this.reviewRoomNo = reviewRoomNo;
	}
	public String getReviewTitle() {
		return reviewTitle;
	}
	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public Date getReviewWritedate() {
		return reviewWritedate;
	}
	public void setReviewWritedate(Date reviewWritedate) {
		this.reviewWritedate = reviewWritedate;
	}
	public long getReviewReadcount() {
		return reviewReadcount;
	}
	public void setReviewReadcount(long reviewReadcount) {
		this.reviewReadcount = reviewReadcount;
	}
	public int getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}

	
	@Override
	public String toString() {
		return "ReviewDto [reviewNo=" + reviewNo + ", reviewMemberId=" + reviewMemberId + ", reviewRoomNo="
				+ reviewRoomNo + ", reviewTitle=" + reviewTitle + ", reviewContent=" + reviewContent
				+ ", reviewWritedate=" + reviewWritedate + ", reviewReadcount=" + reviewReadcount + ", reviewStar="
				+ reviewStar + "]";
	}


	
}
