package mm.mentoring.model.dto;


public class MentorCondition {
	private String universityType;
	private String wantTime;
	private String wantPlace;
	private String majorType;
	private String wantDate;
	
	public MentorCondition() {
		// TODO Auto-generated constructor stub
	}

	public String getUniversityType() {
		return universityType;
	}

	public void setUniversityType(String universityType) {
		if(universityType.equals("all")) {
			this.universityType = "university','college";
		} else {
			this.universityType = universityType;
		}
	}

	public String getWantTime() {
		return wantTime;
	}

	public void setWantTime(String wantTime) {
		if(wantTime.equals("all")) {
			this.wantTime = "all,am,pm,evening";
		} else {
			this.wantTime = wantTime;
		}
	}

	public String getWantPlace() {
		return wantPlace;
	}

	public void setWantPlace(String wantPlace) {
		if(wantPlace.equals("all")) {
			this.wantPlace = "videoChat', 'myTown', 'yourTown', 'rentalSpace";
		} else {
			this.wantPlace = wantPlace;
		}
	}

	public String getMajorType() {
		return majorType;
	}

	public void setMajorType(String majorType) {
		if(majorType.equals("all")) {
			this.majorType = "humanities', 'education', 'engineering', 'society', 'nature', 'anp', 'medicine";
		} else {
			this.majorType = majorType;
		}
	}

	public String getWantDate() {
		return wantDate;
	}

	public void setWantDate(String wantDate) {
		if(wantDate.equals("all")) {
			this.wantDate = "all', 'mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun";
		} else {
			this.wantDate = wantDate;
		}
	}

	@Override
	public String toString() {
		return "MentorCondition [universityType=" + universityType + ", wantTime=" + wantTime + ", wantPlace="
				+ wantPlace + ", majorType=" + majorType + ", wantDate=" + wantDate + "]";
	}




	
	
}
