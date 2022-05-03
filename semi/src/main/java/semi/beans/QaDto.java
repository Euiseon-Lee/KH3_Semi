package semi.beans;

import java.sql.Date;

public class QaDto {
	private int qaNo;
	private String qaTitle;
	private String qaContent;
	private Date qaWritedate;
	private String qaWriter;
	private int qaReadcount;
	private String qaPublic;
	
	//답글에 필요한 컬럼
	private int groupNo;
	private int superNo;
	private int depth;
	
	public QaDto() {
		super();
	}
	public int getQaNo() {
		return qaNo;
	}
	public void setQaNo(int qaNo) {
		this.qaNo = qaNo;
	}
	public String getQaTitle() {
		return qaTitle;
	}
	public void setQaTitle(String qaTitle) {
		this.qaTitle = qaTitle;
	}
	public String getQaContent() {
		return qaContent;
	}
	public void setQaContent(String qaContent) {
		this.qaContent = qaContent;
	}
	public Date getQaWritedate() {
		return qaWritedate;
	}
	public void setQaWritedate(Date qaWritedate) {
		this.qaWritedate = qaWritedate;
	}
	public String getQaWriter() {
		return qaWriter;
	}
	public void setQaWriter(String qaWriter) {
		this.qaWriter = qaWriter;
	}
	public int getQaReadcount() {
		return qaReadcount;
	}
	public void setQaReadcount(int qaReadcount) {
		this.qaReadcount = qaReadcount;
	}
	public String getQaPublic() {
		return qaPublic;
	}
	public void setQaPublic(String qaPublic) {
		this.qaPublic = qaPublic;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public int getSuperNo() {
		return superNo;
	}
	public void setSuperNo(int superNo) {
		this.superNo = superNo;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
}
