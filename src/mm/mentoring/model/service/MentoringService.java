package mm.mentoring.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import mm.common.db.JDBCTemplate;
import mm.member.model.dto.Mentor;
import mm.mentoring.model.dao.MentoringDao;
import mm.mentoring.model.dto.MentorCondition;

public class MentoringService {
	
	private MentoringDao mDao = new MentoringDao();
	private JDBCTemplate template = JDBCTemplate.getInstance();
	
	public ArrayList<Mentor> getMentorIdx(MentorCondition mentorCondition) {
		ArrayList<Mentor> mentorList = null;
		
		Connection conn = template.getConnection();
		
		try {
			
			mentorList = mDao.getMentorIdx(mentorCondition, conn);
			
		} finally {
			template.close(conn);
		}
		
		return mentorList;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
