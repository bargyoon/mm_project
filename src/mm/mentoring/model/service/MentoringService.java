package mm.mentoring.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import mm.common.db.JDBCTemplate;
import mm.member.model.dto.Member;
import mm.member.model.dto.Mentor;
import mm.mentoring.model.dao.MentoringDao;
import mm.mentoring.model.dto.ApplyHistory;
import mm.mentoring.model.dto.MentorCondition;
import mm.mentoring.model.dto.MentoringHistory;

public class MentoringService {
	
	private MentoringDao mDao = new MentoringDao();
	private JDBCTemplate template = JDBCTemplate.getInstance();
	
	public List<Mentor> getMentorByCondition(MentorCondition mentorCondition) {
		List<Mentor> mentorList = new ArrayList<Mentor>();
		
		Connection conn = template.getConnection();
		
		try {
			
			mentorList = mDao.getMentorByCondition(mentorCondition, conn);
			
		} finally {
			template.close(conn);
		}
		
		return mentorList;
	}

	public Member getMemberByIdx(int userIdx) {
		Member memberList = new Member();
		
		Connection conn = template.getConnection();
		
		try {
			memberList = mDao.getMemberByIdx(userIdx, conn);
		} finally {
			template.close(conn);
		}
		return memberList;
	}

	public List<MentoringHistory> getMtHistoryByUserIdx(int userIdx) {
		List<MentoringHistory> mhList = new ArrayList<MentoringHistory>();
		
		Connection conn = template.getConnection();
		
		try {
			
			mhList = mDao.getMtHistoryByUserIdx(userIdx, conn);
			
		} finally {
			template.close(conn);
		}
		
		return mhList;
	}

	public List<ApplyHistory> getApHistoryByUserIdx(int userIdx) {
		List<ApplyHistory> ahList = new ArrayList<ApplyHistory>();
		
		Connection conn = template.getConnection();
		
		try {
			
			ahList = mDao.getApHistoryByUserIdx(userIdx, conn);
			
		} finally {
			template.close(conn);
		}
		
		return ahList;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
