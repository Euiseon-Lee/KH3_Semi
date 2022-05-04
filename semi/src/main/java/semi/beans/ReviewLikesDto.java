package semi.beans;

import java.sql.Date;

public class ReviewLikesDto {
	private String likesWho;
	private long targetReviewNo;
	private String targetMemberId;
	private Date likesTime;
	private long likescount;
	
	public long getLikescount() {
		return likescount;
	}
	public void setLikescount(long likescount) {
		this.likescount = likescount;
	}
	public String getLikesWho() {
		return likesWho;
	}
	public void setLikesWho(String likesWho) {
		this.likesWho = likesWho;
	}
	public long getTargetReviewNo() {
		return targetReviewNo;
	}
	public void setTargetReviewNo(long targetReviewNo) {
		this.targetReviewNo = targetReviewNo;
	}
	public String getTargetMemberId() {
		return targetMemberId;
	}
	public void setTargetMemberId(String targetMemberId) {
		this.targetMemberId = targetMemberId;
	}
	public Date getLikesTime() {
		return likesTime;
	}
	public void setLikesTime(Date likesTime) {
		this.likesTime = likesTime;
	}
	
	
}
