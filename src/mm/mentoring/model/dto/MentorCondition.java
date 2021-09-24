package mm.mentoring.model.dto;

import java.util.ArrayList;

public class MentorCondition {
	private String universityType;
	private String wantTime;
	private String wantPlace;
	private ArrayList<String> majorType;
	private ArrayList<String> wantDate;
	
	public MentorCondition() {
		// TODO Auto-generated constructor stub
	}

	public String getUniversityType() {
		return universityType;
	}

	public void setUniversityType(String universityType) {
		this.universityType = universityType;
	}

	public String getWantTime() {
		return wantTime;
	}

	public void setWantTime(String wantTime) {
		this.wantTime = wantTime;
	}

	public String getWantPlace() {
		return wantPlace;
	}

	public void setWantPlace(String wantPlace) {
		this.wantPlace = wantPlace;
	}

	public ArrayList<String> getMajorType() {
		return majorType;
	}

	public void setMajorType(ArrayList<String> majorType) {
		this.majorType = majorType;
	}

	public ArrayList<String> getWantDate() {
		return wantDate;
	}

	public void setWantDate(ArrayList<String> wantDate) {
		this.wantDate = wantDate;
	}

	@Override
	public String toString() {
		return "MentorList [universityType=" + universityType + ", wantTime=" + wantTime + ", wantPlace=" + wantPlace
				+ ", majorType=" + majorType + ", wantDate=" + wantDate + "]";
	}


	
	
}
