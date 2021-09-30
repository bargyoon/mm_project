package mm.common.code;

public enum ErrorCode {

	DATABASE_ACCESS_ERROR("데이터 오류가 발생했습니다."),
	UNLOGINED_ERROR("로그인이 필요합니다.","/member/login-form"),
	ALREADY_REGISTERED_COMMENT("이미 이 멘토에 대한 평가를 등록 하셨습니다.","/mentoring/manage-page");
	
	
	
	

	public final String MESSAGE;
	public final String URL;
	
	ErrorCode(String msg){
		this.MESSAGE = msg;
		this.URL = "/index";
	}
	
	ErrorCode(String msg, String url){
		this.MESSAGE = msg;
		this.URL = url;
	}
	

}
