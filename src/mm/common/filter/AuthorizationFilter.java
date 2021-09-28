package mm.common.filter;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mm.common.code.ErrorCode;
import mm.common.exception.HandlableException;



/**
 * Servlet Filter implementation class AuthenticationFilter
 */
@WebFilter("/AuthenticationFilter")
public class AuthorizationFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public AuthorizationFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		String[] uriArr = httpRequest.getRequestURI().split("/");
		
		if (uriArr.length != 0) {
		
			switch (uriArr[1]) {
			case "member":
				memberAuthorize(httpRequest, httpResponse, uriArr);
				break;
			
			case "board":
				boardAuthorize(httpRequest, httpResponse, uriArr);
				break;
			case "todo":
				todoListAuthorize(httpRequest, httpResponse, uriArr);
				break;
			case "mentoring":
				mentoringAuthorize(httpRequest, httpResponse, uriArr);
				break;
			default:
				break;
			}

		}

		chain.doFilter(request, response);
	}

	private void mentoringAuthorize(HttpServletRequest httpRequest, HttpServletResponse httpResponse, String[] uriArr) throws IOException, ServletException{
		HttpSession session = httpRequest.getSession();
		if(session.getAttribute("authentication") == null){
			
			throw new HandlableException(ErrorCode.UNLOGINED_ERROR);
			
		}
		
	}

	private void todoListAuthorize(HttpServletRequest httpRequest, HttpServletResponse httpResponse, String[] uriArr) throws IOException, ServletException {
		HttpSession session = httpRequest.getSession();
		if(session.getAttribute("authentication") == null){
			throw new HandlableException(ErrorCode.UNLOGINED_ERROR);
		}
		
	}

	private void boardAuthorize(HttpServletRequest httpRequest, HttpServletResponse httpResponse, String[] uriArr) throws IOException, ServletException{
		HttpSession session = httpRequest.getSession();
		if(session.getAttribute("authentication") == null){
			throw new HandlableException(ErrorCode.UNLOGINED_ERROR);
		}
		
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */

	private void memberAuthorize(HttpServletRequest httpRequest, HttpServletResponse httpResponse, String[] uriArr)
			throws IOException, ServletException {
		HttpSession session = httpRequest.getSession();

		switch(uriArr[2]) {
		case "mypage": 
			if(session.getAttribute("authentication") == null){
				throw new HandlableException(ErrorCode.UNLOGINED_ERROR);
			}
		}

	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
