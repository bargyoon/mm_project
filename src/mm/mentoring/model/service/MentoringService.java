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
import mm.mentoring.model.dto.Rating;

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

	public int increaseReapplyCnt(int ahIdx) {
		int res = 0;
		
		Connection conn = template.getConnection();
		
		try {
			res = mDao.increaseReapplyCnt(ahIdx, conn);
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
		
		return res;
	}

	public int registApply(MentoringHistory mh) {
		int res = 0;
		
		Connection conn = template.getConnection();
		
		try {
			res = mDao.registApply(mh, conn);
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
		
		
		return res;
	}

	public boolean commentCheck(int userIdx, int mentorIdx) {
		boolean isRegistered = false;
		
		Connection conn = template.getConnection();
		
		try {
			isRegistered = mDao.commentCheck(userIdx, mentorIdx, conn);
		} finally {
			template.close(conn);
		}
		
		return isRegistered;
	}

	public MentoringHistory getMhByMIdx(int mIdx) {
		MentoringHistory mh = null;
		
		Connection conn = template.getConnection();
		
		try {
			mh = mDao.getMhByMIdx(mIdx, conn);
		} finally {
			template.close(conn);
		}
		
		return mh;
	}

	public int registRating(Rating rating) {
		int res = 0;
		
		Connection conn = template.getConnection();
		
		try {
			res = mDao.registRating(rating, conn);
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			e.printStackTrace();
		} finally {
			template.close(conn);
		}
		
		return res;
	}

	public List<Mentor> isExistInApply(List<Mentor> mentorList, int userIdx) {
		List<Mentor> nonExistMentor = new ArrayList<Mentor>();
		
		Connection conn = template.getConnection();
		
		try {
			nonExistMentor = mDao.isExistInApply(mentorList, userIdx, conn);
		} finally {
			template.close(conn);
		}
		
		return nonExistMentor;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
