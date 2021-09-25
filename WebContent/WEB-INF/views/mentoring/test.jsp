<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="mentoring/test-submit">
	<label><input type="checkbox" name="rating">1</label>
	<label><input type="checkbox" name="rating">2</label>
	<label><input type="checkbox" name="rating">3</label>
	<label><input type="checkbox" name="rating">4</label>
	<label><input type="checkbox" name="rating">5</label>
	
	<div class="switch-holder m-3">
				                        <table style="width:100%;">
										    <tr>
												<th style="vertical-align: middle; text-align: center;">글자수 제한<br/>
										            <sup>(<span id="nowByte">0</span>/100bytes)</sup>
										        </th>
										        <td>
										           	<textarea rows="4" class="form-control" id="textArea_byteLimit" name="rating_comment"></textarea>
										        </td>
										    </tr>
										</table>
				                    </div>
				                    				                    <div class="d-flex mt-5" style="justify-content: center;">
										<button>완료</button>
				                    </div>
</form>
</body>
</html>