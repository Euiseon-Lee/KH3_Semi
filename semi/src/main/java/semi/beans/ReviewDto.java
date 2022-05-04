package semi.beans;

import java.sql.Date;


public class ReviewDto {
	private int reviewNo;
	private int reviewOrderNo;
	private String reviewMemberId;
	private String reviewTitle;
	private String reviewContent;
	private Date reviewWritedate;
	private int reviewReadcount;
	private int reviewStar;
	private int reviewReplycount;
	
	
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getReviewOrderNo() {
		return reviewOrderNo;
	}
	public void setReviewOrderNo(int reviewOrderNo) {
		this.reviewOrderNo = reviewOrderNo;
	}
	public String getReviewMemberId() {
		return reviewMemberId;
	}
	public void setReviewMemberId(String reviewMemberId) {
		this.reviewMemberId = reviewMemberId;
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
	public int getReviewReadcount() {
		return reviewReadcount;
	}
	public void setReviewReadcount(int reviewReadcount) {
		this.reviewReadcount = reviewReadcount;
	}
	public int getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}
	public int getReviewReplycount() {
		return reviewReplycount;
	}
	public void setReviewReplycount(int reviewReplycount) {
		this.reviewReplycount = reviewReplycount;
	}


	


	
}
