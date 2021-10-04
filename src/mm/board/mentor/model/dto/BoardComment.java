package mm.board.mentor.model.dto;

import java.sql.Date;

public class BoardComment {
	private int coIdx;
	private String userId;
	private String coContent;
	private Date regDate;
	private int recCount;
	private int bdIdx;
	private String detailDate;
	
	public BoardComment() {
		// TODO Auto-generated constructor stub
	}

	public int getCoIdx() {
		return coIdx;
	}

	public void setCoIdx(int coIdx) {
		this.coIdx = coIdx;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCoContent() {
		return coContent;
	}

	public void setCoContent(String coContent) {
		this.coContent = coContent;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getRecCount() {
		return recCount;
	}

	public void setRecCount(int recCount) {
		this.recCount = recCount;
	}

	public int getBdIdx() {
		return bdIdx;
	}

	public void setBdIdx(int bdIdx) {
		this.bdIdx = bdIdx;
	}
	
	public String getDetailDate() {
		return detailDate;
	}

	public void setDetailDate(String detailDate) {
		this.detailDate = detailDate;
	}

	@Override
	public String toString() {
		return "BoardComment [coIdx=" + coIdx + ", userId=" + userId + ", coContent=" + coContent + ", regDate="
				+ regDate + ", recCount=" + recCount + ", bdIdx=" + bdIdx + ", detailDate=" + detailDate + "]";
	}

	
	
}
