package mm.mentoring.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.core.Response;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import javax.ws.rs.core.MediaType;

import mm.common.code.Config;
import mm.common.code.ErrorCode;
import mm.common.exception.HandlableException;
import mm.common.file.FileDTO;
import mm.member.model.dto.Member;
import mm.member.model.dto.Mentor;
import mm.mentoring.model.dto.ApplyHistory;
import mm.mentoring.model.dto.MentorCondition;
import mm.mentoring.model.dto.MentoringHistory;
import mm.mentoring.model.dto.Rating;
import mm.mentoring.model.service.MentoringService;

@WebServlet("/mentoring/*")
public class MentoringController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MentoringService mService = new MentoringService();

	public MentoringController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] uriArr = request.getRequestURI().split("/");

		switch (uriArr[uriArr.length - 1]) {
		case "apply-page":
			applyPage(request, response);
			break;
		case "apply-complete":
			applyComplete(request, response);
			break;
		case "reapply-complete":
			reapplyComplete(request, response);
			break;
		case "regist-apply":
			registApply(request, response);
			break;
		case "mentor-list":
			mentorList(request, response);
			break;
		case "manage-page":
			managePage(request, response);
			break;
		case "rating-page":
			ratingPage(request, response);
			break;
		case "regist-rating":
			registRating(request, response);
			break;
		case "comment-check":
			commentCheck(request, response);
			break;
		case "mentoring-accept":
			mentoringAccept(request, response);
			break;
		case "regist-mentoring":
			registMentoring(request, response);
			break;
		case "payment":
			payment(request, response);
			break;
		default:
			break;
		}

	}

	private void payment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mentorIdx = Integer.parseInt(request.getParameter("mentor_idx"));
		Mentor mentor = mService.getMentorByMentorIdx(mentorIdx);
		//toss api
		Client client = ClientBuilder.newClient();
		Entity payload = Entity.json("{  \"apiKey\": \"dcf102a946024eafb1c3d61cbdba3c47\",  \"bankName\": \"" + mentor.getBank()
								+ "\",  \"bankAccountNo\":\"" + mentor.getAccountNum() + "\",  \"amount\": 15000,  \"message\": \"??????????????????\"}");
		Response paymentResponse = client.target("https://toss.im/transfer-web/linkgen-api/link")
		  .request(MediaType.APPLICATION_JSON_TYPE)
		  .post(payload);

		
		String[] bodyValues = paymentResponse.readEntity(String.class).split(",");
		int firstIdx = bodyValues[2].indexOf('h');
		int lastIdx = bodyValues[2].lastIndexOf('"');
		String link = bodyValues[2].substring(firstIdx, lastIdx);
		
		createQRImage(mentorIdx, link, parseRGBStringToInt("#343a40"), 0xFFFFFFFF);
		
		request.setAttribute("mentorIdx", mentorIdx);
		
		request.getRequestDispatcher("/mentoring/payment-page").forward(request, response);;
	}

	private void createQRImage(int mentorIdx, String link, int qrColor, int qrBgColor) {
		QRCodeWriter qrCodeWriter = new QRCodeWriter();
		try {
			//qr ??????
			BitMatrix bitMatrix = qrCodeWriter.encode(link, BarcodeFormat.QR_CODE, 300, 300); 
			MatrixToImageConfig config = new MatrixToImageConfig(qrColor, qrBgColor); //qr?????? ?????????
			
	        BufferedImage qrimage = MatrixToImageWriter.toBufferedImage(bitMatrix, config);
	        
	        File file = new File(getSavePath() + mentorIdx + ".png");
	        
	        //????????? ????????? ??????
			ImageIO.write(qrimage, "png", file);
		} catch (WriterException | IOException e) {
			e.printStackTrace();
		}
	}
	
	private String getSavePath() {

		String savePath = Config.UPLOAD_PATH.DESC +"qr_img\\";

		File dir = new File(savePath);
		if (!dir.exists()) {
			dir.mkdirs();
		}

		return savePath;
	}
	
	 private int parseRGBStringToInt(String color) {
	      color = color.substring(1);
	      color = "ff" + color;
	      long l = Long.parseLong(color, 16);   
	      return (int)l;
	 }

	//mentoringHistory??? ????????? ?????? ??????
	private void registMentoring(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int res = 0;
		Member mentorInfo = (Member) request.getSession().getAttribute("authentication");
		Mentor mentor = mService.getMentorByUserIdx(mentorInfo.getUserIdx()); //????????? useridx??? Mentor ????????? ?????? ?????????
		
		int menteeIdx = Integer.parseInt(request.getParameter("mentee_idx"));
		Member menteeInfo = mService.getMemberByIdx(menteeIdx); //????????? userIdx??? member?????? ?????????
		
		String startDate = request.getParameter("start_date");
		String endDate = request.getParameter("end_date");
		
		//format??? ????????????
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date parsedStartDate = null;
		Date parsedEndDate = null;
		Date epDate = new Date();
		
		//String ???????????? Date ???????????? ??????
		try {
			parsedStartDate = dateFormat.parse(startDate);
			parsedEndDate = dateFormat.parse(endDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		//startDate 1????????? epDate ??????
		epDate.setDate(parsedStartDate.getDate()+365);
		
		//price??? ???????????? ?????? ?????????
		int price = 0;
		if(!request.getParameter("price").equals("")) {
			price = Integer.parseInt(request.getParameter("price"));
		}
		
		//mh ?????? ????????? set?????????
		MentoringHistory mh = new MentoringHistory();
		mh.setUserIdx(menteeIdx);
		mh.setStartDate(parsedStartDate);
		mh.setEndDate(parsedEndDate);
		mh.setPrice(price);
		mh.setState("P");
		mh.setMentorIdx(mentor.getMentorIdx());
		mh.setMenteeName(menteeInfo.getUserName());
		mh.setMentorName(mentorInfo.getUserName());
		mh.setEpDate(epDate);
		
		for (int i = 0; i < 3; i++) {
			if(i==0) {
				//????????? ??????????????? ??????
				res = mService.insertMH(mh);
			} else if(i==1) {
				//????????? ????????? ?????? 1??? ??????
				res = mService.increaseMentoringCnt(mentor.getMentorIdx());
			} else {
				//???????????? ?????????????????? ??????
				res = mService.deleteAH(menteeIdx, mentor.getMentorIdx());
			}
			if(res == 0) {
				request.setAttribute("msg", "????????? ????????? ?????????????????????.");
				request.setAttribute("url", "/mentoring/manage-page");
				request.getRequestDispatcher("common/result").forward(request, response);
				return;
			}
		}
		
		request.setAttribute("msg", "????????? ????????????????????? !");
		request.setAttribute("url", "/mentoring/manage-page");
		request.getRequestDispatcher("common/result").forward(request, response);

	}

	//????????? ?????? ?????? ?????? ????????? ???????????? ?????????
	private void mentoringAccept(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int menteeIdx = Integer.parseInt(request.getParameter("mentee_user_idx"));
		
		request.setAttribute("menteeIdx", menteeIdx);
		
		request.getRequestDispatcher("mentoring/accept-page").forward(request, response);
	}

	private void commentCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mIdx = Integer.parseInt(request.getParameter("m_idx"));
		
		boolean isRegistered = mService.commentCheck(mIdx);
		
		if(isRegistered) {
			response.getWriter().print("registered");
		} else {
			response.getWriter().print("not-registered");
		}
		
	}

	//????????? ?????? ??????????????? ???????????? ???
	private void applyComplete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = (Member) request.getSession().getAttribute("authentication");
		int userIdx = member.getUserIdx();
		int mentorIdx = Integer.parseInt(request.getParameter("mentor_idx"));
		int mentorMemberIdx = Integer.parseInt(request.getParameter("mentor_user_idx"));
		ApplyHistory ah = new ApplyHistory();
		
		//?????? applyhistory??? ????????? ?????? ??????(????????????)
		boolean isExist = mService.isExistInApply(mentorIdx, userIdx);
		if(isExist) {
			request.setAttribute("msg", "?????? ????????? ???????????????.");
			request.setAttribute("back", "back");
			request.getRequestDispatcher("common/result").forward(request, response);
			return;
		}
		
		//????????? userIdx??? ?????? ????????? ?????????
		Member mentorInfo = mService.getMemberByIdx(mentorMemberIdx);
		ah.setUserIdx(userIdx);
		ah.setMentorIdx(mentorIdx);
		ah.setMentorName(mentorInfo.getUserName());
		ah.setMenteeName(member.getUserName());
		int res = mService.registApply(ah);
		
		if(res == 0) {
			request.setAttribute("msg", "????????? ????????? ?????????????????????.");
			request.setAttribute("back", "back");
			request.getRequestDispatcher("common/result").forward(request, response);
		} else {
			mService.sendEmailToMentor(mentorInfo);
			request.getRequestDispatcher("/mentoring/apply-complete").forward(request,response); 
		}
	}

	//????????? ??????????????? ????????? ?????? ???
	private void registApply(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = (Member) request.getSession().getAttribute("authentication");
		int mentorIdx = Integer.parseInt(request.getParameter("mentor_idx"));
		Member mentorInfo = mService.getMemberByIdx(mService.getMentorByMentorIdx(mentorIdx).getUserIdx());
		String mentorName = request.getParameter("mentor_name");
		ApplyHistory ah = new ApplyHistory();
		
		boolean isExist = mService.isExistInApply(mentorIdx, member.getUserIdx());
		if(isExist) {
			request.setAttribute("msg", "?????? ????????? ???????????????.");
			request.setAttribute("back", "back");
			request.getRequestDispatcher("common/result").forward(request, response);
			return;
		}
		
		ah.setUserIdx(member.getUserIdx());
		ah.setMentorIdx(mentorIdx);
		ah.setMentorName(mentorName);
		ah.setMenteeName(member.getUserName());
		
		int res = mService.registApply(ah);
		
		if(res == 0) { 
			request.setAttribute("msg", "????????? ???????????? ?????????????????????.");
			request.setAttribute("back", "back");
			request.getRequestDispatcher("common/result").forward(request, response); 
		} else {
			mService.sendEmailToMentor(mentorInfo);
			request.getRequestDispatcher("/mentoring/apply-complete").forward(request,response); 
		}
	}

	//????????? ??????????????? ????????? ????????? ?????? ???
	private void reapplyComplete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int ahIdx = Integer.parseInt(request.getParameter("a_idx"));
		
		int res = mService.increaseReapplyCnt(ahIdx);
		if (res == 0) {
			request.setAttribute("msg", "????????? ???????????? ?????????????????????.");
			request.setAttribute("back", "back");
			request.getRequestDispatcher("common/result").forward(request, response);
		} else {
			request.getRequestDispatcher("/mentoring/apply-complete").forward(request, response);
		}

	}

	private void registRating(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = (Member) request.getSession().getAttribute("authentication");
		String[] ratings = request.getParameterValues("rating");
		String comment = request.getParameter("rating_comment");
		int mIdx = Integer.parseInt(request.getParameter("m_idx"));
		
		int mentorIdx = mService.getMhByMIdx(mIdx).getMentorIdx();
		int userIdx = member.getUserIdx();
		
		boolean isRegistered = mService.commentCheck(mIdx);
		
		if(isRegistered) {
			throw new HandlableException(ErrorCode.ALREADY_REGISTERED_COMMENT);
		}
		
		Rating rating = createRatingDTO(ratings);
		rating.setMentorIdx(mentorIdx);
		rating.setUserIdx(userIdx);
		rating.setComment(comment);
		
		int res = mService.registRating(rating, mIdx);
		
		System.out.println(rating);
		
		if (res == 0) {
			request.setAttribute("msg", "?????? ????????? ??????????????????.");
			request.setAttribute("back", "back");
			request.getRequestDispatcher("common/result").forward(request, response);
		} else {
			request.setAttribute("msg", "????????? ?????????????????????.");
			request.setAttribute("url", "/mentoring/manage-page");
			request.getRequestDispatcher("common/result").forward(request, response);
		}
		
	}
	
	private Rating createRatingDTO(String[] ratings) {
		Rating rating = new Rating();
		
		for (int i = 0; i < ratings.length; i++) {
			if(ratings[i].equals("kindness")) {
				rating.setKindness("Y");
			} else if(ratings[i].equals("communication")) {
				rating.setCommunication("Y");
			} else if(ratings[i].equals("professional")) {
				rating.setProfessional("Y");
			} else if(ratings[i].equals("process")) {
				rating.setProcess("Y");
			} else if(ratings[i].equals("timeAppointment")) {
				rating.setAppointment("Y");
			} else if(ratings[i].equals("explain")) {
				rating.setExplain("Y");
			}
		}
		
		return rating;
	}

	private void ratingPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mIdx = Integer.parseInt(request.getParameter("m_idx"));
		MentoringHistory mh = mService.getMhByMIdx(mIdx);
		
		boolean isRegistered = mService.commentCheck(mIdx);
		
		if(isRegistered) {
			throw new HandlableException(ErrorCode.ALREADY_REGISTERED_COMMENT);
		}
		
		
		request.setAttribute("mh", mh);
		
		request.getRequestDispatcher("/mentoring/mentor-rating").forward(request, response);
	}

	private void managePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ???????????? ???????????? ?????????
		Member member = (Member) request.getSession().getAttribute("authentication");
		int mentorUserIdx = member.getUserIdx();
		Mentor mentor = mService.getMentorByUserIdx(mentorUserIdx);
		String role = member.getRole();
		FileDTO mentorImg = new FileDTO();
		if(member.getRole().equals("MO00")) {
			mentorImg = mService.getFileByMentorIdx(mService.getMentorByUserIdx(mentorUserIdx).getMentorIdx());
			request.setAttribute("mentorImg", mentorImg);
		}
		
		
		// role??? ?????? idx??? MentoringHistory, ApplyHistory DTO ??????
		List<MentoringHistory> mhList = new ArrayList<MentoringHistory>();
		List<ApplyHistory> ahList = new ArrayList<ApplyHistory>();
		
		if(role.equals("ME00")) {
			mhList = mService.getMtHistoryByUserIdx(member.getUserIdx(), role);
			ahList = mService.getApHistoryByUserIdx(member.getUserIdx(), role);
		} else if(role.equals("MO00")) {
			mhList = mService.getMtHistoryByUserIdx(mentor.getMentorIdx(), role);
			ahList = mService.getApHistoryByUserIdx(mentor.getMentorIdx(), role);
		}

		// ????????? mhList??? ???????????? ?????? ????????? ??????
		List<MentoringHistory> finishMhList = new ArrayList<MentoringHistory>();
		List<MentoringHistory> processMhList = new ArrayList<MentoringHistory>();
		
		for (int i = 0; i < mhList.size(); i++) {
			if (mhList.get(i).getState().equals("P")) {
				processMhList.add(mhList.get(i));
			} else {
				finishMhList.add(mhList.get(i));
			}
		}
		
		request.setAttribute("applyHistory", ahList);
		request.setAttribute("processHistory", processMhList);
		request.setAttribute("finishHistory", finishMhList);

		request.getRequestDispatcher("/mentoring/mentor-manage").forward(request, response);

	}

	private void mentorList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MentorCondition mentorCondition = new MentorCondition();
		Member member = (Member) request.getSession().getAttribute("authentication");
		mentorCondition.setUniversityType(request.getParameter("school_type").split(","));
		mentorCondition.setWantTime(request.getParameter("want_time").split(","));
		mentorCondition.setWantPlace(request.getParameter("want_place").split(","));
		mentorCondition.setMajorType(request.getParameter("major_type").split(","));
		mentorCondition.setWantDate(request.getParameter("want_date").split(","));
		int userIdx = member.getUserIdx();

		// mentorCondition??? ?????? ??????????????? ?????????
		List<Mentor> mentorList = mService.getMentorByCondition(mentorCondition);
		// ????????? ?????? ???????????? applyhistory ???????????? ?????? ???????????? ????????? ???????????? ??? ???????????? ??????
		List<Mentor> nonExistMentorList = mService.isExistInApply(mentorList, userIdx);
		
		
		//????????? ????????? ????????? ??????????????? ???????????? ??????
		List<Mentor> excellentMentorList = new ArrayList<Mentor>();
		List<Member> excellentMentorInfo = new ArrayList<Member>();
		List<FileDTO> excellentMentorImg = new ArrayList<FileDTO>();
		List<Mentor> normalMentorList = new ArrayList<Mentor>();
		List<Member> normalMentorInfo = new ArrayList<Member>();
		List<FileDTO> normalMentorImg = new ArrayList<FileDTO>();
		
		System.out.println("size : " + nonExistMentorList.size());
		for (int i = 0; i < nonExistMentorList.size(); i++) {
			int mentoringCnt = nonExistMentorList.get(i).getMentoringCnt();
			int gradePoint = 0;
			int totalPoint = 0;
			//?????? idx??? ????????? ?????? gradeCnt++ ??????
			if(mentoringCnt != 0) {
				gradePoint = increaseGradeCnt(nonExistMentorList.get(i));
			}
			
			if(gradePoint != 0) {
				totalPoint = gradePoint/mentoringCnt;
			}
			
			System.out.println("mentoringCnt : " + mentoringCnt);
			System.out.println("gradePointOut : " + gradePoint);
			System.out.println("totalPoint : " + totalPoint);
			// ????????????/??????????????? ?????? ??????????????? ??????????????? ????????? List??? ????????????
			if(gradePoint >= 3) {
				//????????? idx??? ????????? ???????????? ?????????
				excellentMentorList.add(nonExistMentorList.get(i));
				excellentMentorInfo.add(mService.getMemberByIdx(nonExistMentorList.get(i).getUserIdx()));
				excellentMentorImg.add(mService.getFileByMentorIdx(nonExistMentorList.get(i).getMentorIdx()));
			} else {
				normalMentorList.add(nonExistMentorList.get(i));
				normalMentorInfo.add(mService.getMemberByIdx(nonExistMentorList.get(i).getUserIdx()));
				normalMentorImg.add(mService.getFileByMentorIdx(nonExistMentorList.get(i).getMentorIdx()));
			}
		}
		
		for (FileDTO fileDTO : normalMentorImg) {
			System.out.println(fileDTO);
		}
		
		// ?????? ??????????????? history??? ?????? ???????????? ??????
		List<List<String>> excellentHistoryList = getHistoryList(excellentMentorList);
		List<List<String>> normalHistoryList = getHistoryList(normalMentorList);
		
		request.setAttribute("excellentMentors", excellentMentorList);
		request.setAttribute("excellentMentorsInfo", excellentMentorInfo);
		request.setAttribute("excellentHistoryList", excellentHistoryList);
		request.setAttribute("excellentMentorImg", excellentMentorImg);
		request.setAttribute("normalMentors", normalMentorList);
		request.setAttribute("normalMentorsInfo", normalMentorInfo);
		request.setAttribute("normalHistoryList", normalHistoryList);
		request.setAttribute("normalMentorImg", normalMentorImg);

		request.getRequestDispatcher("/mentoring/mentor-list").forward(request, response);
	}

	
	private List<List<String>> getHistoryList(List<Mentor> normalMentorList) {
		List<List<String>> historyList = new ArrayList<List<String>>();
		for (Mentor mentor : normalMentorList) {
			List<String> revisedList = new ArrayList<String>();
			if(mentor.getHistory() != null) {
				String[] historyArr = mentor.getHistory().split(",");
				if(historyArr.length >= 2) {
					for (int i = 0; i < 2; i++) {
						revisedList.add(historyArr[i]);
					}
				} else {
					revisedList.add(historyArr[0]);
				}
				historyList.add(revisedList);
			} else {
				historyList.add(null);
			}
		}
		return historyList;
	}

	private int increaseGradeCnt(Mentor mentor) {
		int gradePoint = 0;
		List<Rating> mentorRating = mService.getRatingByMentorIdx(mentor.getMentorIdx());
		for (Rating rating : mentorRating) {
			for (int i = 0; i < 6; i++) {
				if(rating.getKindness().equals("Y")) {
					gradePoint++;
				} else if(rating.getCommunication().equals("Y")) {
					gradePoint++;
				} else if(rating.getProfessional().equals("Y")) {
					gradePoint++;
				} else if(rating.getProcess().equals("Y")) {
					gradePoint++;
				} else if(rating.getAppointment().equals("Y")) {
					gradePoint++;
				} else if(rating.getExplain().equals("Y")) {
					gradePoint++;
				}
			}
		}
		return gradePoint;
	}


	private void applyPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/mentoring/mentor-apply").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
