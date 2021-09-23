package mm.member.model.service;

import java.sql.Connection;

import mm.common.db.JDBCTemplate;
import mm.member.model.dao.MemberDao;
import mm.member.model.dto.Member;
import mm.member.model.dto.Mentee;
import mm.member.model.dto.Mentor;

public class MemberService {

	private MemberDao memberDao = new MemberDao();
	private JDBCTemplate template = JDBCTemplate.getInstance();
	
	
	public int insertMentee(Member member, Mentee mentee) {
		Connection conn = template.getConnection();
		int res = 0;
		try {
			// user에 정보 기입
			
			
			if(memberDao.insertMember(member, conn) != 0) {
				res = memberDao.insertMentee(mentee, conn);
			}
			
			
			// 회원가입 이후 자동 로그인 처리
			// 방금 가입한 회원의 정보를 다시 조회
			//Member m = memberDao.selectMemberById(member.getUserId(), conn);
			// 다오를 통해 사용자 정보를 받아서 해당 정보로 로그인 처리 진행
			System.out.println(member.getUserId() + "의 로그인처리 로직이 동작했습니다.");
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			// 예전처럼 예외처리
			throw e;
		} finally {
			template.close(conn);
		}
		
		System.out.println(res);
		return res;
		
	}


	public int insertMentor(Member member, Mentor mentor) {
		Connection conn = template.getConnection();
		int res = 0;
		try {
			// user에 정보 기입
			
			
			if(memberDao.insertMember(member, conn) != 0) {
				res = memberDao.insertMentor(mentor, conn);
			}
			
			
			
			//Member m = memberDao.selectMemberById(member.getUserId(), conn);
			// 다오를 통해 사용자 정보를 받아서 해당 정보로 로그인 처리 진행
			System.out.println(member.getUserId() + "의 로그인처리 로직이 동작했습니다.");
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			// 예전처럼 예외처리
			throw e;
		} finally {
			template.close(conn);
		}
		
		System.out.println(res);
		return res;
	}


	public Member memberAuthenticate(String userId, String password) {
		Member member = null;
		Connection conn = template.getConnection();

		try {
			member = memberDao.memberAuthenticate(userId, password, conn);

		} finally {
			template.close(conn);
		}

		return member;
	}

}
