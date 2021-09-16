package mm.common.code;

public enum ErrorCode {

	DATABASE_ACCESS_ERROR("데이터 오류가 발생했습니다."),
	UNLOGINED_ERROR("로그인이 필요합니다.","/member/login-form");
	
	
	
	

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
