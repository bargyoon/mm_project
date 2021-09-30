package mm.common.code;

public enum ErrorCode {

	DATABASE_ACCESS_ERROR("데이터 오류가 발생했습니다."),
	UNLOGINED_ERROR("로그인이 필요합니다.","/member/login-form"),
	ALREADY_REGISTERED_COMMENT("이미 이 멘토에 대한 평가를 등록 하셨습니다.","/mentoring/manage-page"),
	HTTP_CONNECT_ERROR("HTTP통신 중 에러가 발생하였습니다."),
	FAILED_FILE_UPLOAD_ERROR("파일업로드에 실패했습니다.");

	
	
	
	

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
