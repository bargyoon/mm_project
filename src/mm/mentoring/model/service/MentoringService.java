package mm.mentoring.model.service;

import java.sql.Connection;

import mm.common.db.JDBCTemplate;
import mm.mentoring.model.dao.MentoringDao;
import mm.mentoring.model.dto.MentorList;

public class MentoringService {
	
	private MentoringDao mDao = new MentoringDao();
	private JDBCTemplate template = JDBCTemplate.getInstance();
	
	public int[] getMentorIdx(MentorList mentorList) {
		int[] mentorIdx = null;
		
		Connection conn = template.getConnection();
		
		try {
			
			mentorIdx = mDao.getMentorIdx(mentorList, conn);
			
		} finally {
			template.close(conn);
		}
		
		return mentorIdx;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
