package semi.beans;

import java.util.Date;

public class ReviewReplyDto {
	private int replyNo;
	private String replyWriter;
	private int replyTarget;
	private String replyContent;
	private Date replyTime;
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public String getReplyWriter() {
		return replyWriter;
	}
	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	public int getReplyTarget() {
		return replyTarget;
	}
	public void setReplyTarget(int replyTarget) {
		this.replyTarget = replyTarget;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Date getReplyTime() {
		return replyTime;
	}
	public void setReplyTime(Date replyTime) {
		this.replyTime = replyTime;
	}
	public ReviewReplyDto() {
		super();
	}
	
	
	
}
