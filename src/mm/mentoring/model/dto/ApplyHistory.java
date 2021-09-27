package mm.mentoring.model.dto;

import java.util.Date;

public class ApplyHistory {

	private int aIdx;
	private int userIdx;
	private int mentorIdx;
	private String mentorName;
	private Date epDate;
	
	public ApplyHistory() {
		// TODO Auto-generated constructor stub
	}
	
	public int getaIdx() {
		return aIdx;
	}
	public void setaIdx(int aIdx) {
		this.aIdx = aIdx;
	}
	public int getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}
	public int getMentorIdx() {
		return mentorIdx;
	}
	public void setMentorIdx(int mentorIdx) {
		this.mentorIdx = mentorIdx;
	}
	public String getMentorName() {
		return mentorName;
	}
	public void setMentorName(String mentorName) {
		this.mentorName = mentorName;
	}
	public Date getEpDate() {
		return epDate;
	}
	public void setEpDate(Date epDate) {
		this.epDate = epDate;
	}
	@Override
	public String toString() {
		return "ApplyHistory [aIdx=" + aIdx + ", userIdx=" + userIdx + ", mentorIdx=" + mentorIdx + ", mentorName="
				+ mentorName + ", epDate=" + epDate + "]";
	}
	
	
	
	
}
