package mm.mentoring.model.service;

import java.sql.Connection;

import mm.common.db.JDBCTemplate;
import mm.member.model.dto.Mentor;
import mm.mentoring.model.dao.MentoringDao;
import mm.mentoring.model.dto.MentorList;

public class MentoringService {
	
	private MentoringDao mDao = new MentoringDao();
	private JDBCTemplate template = JDBCTemplate.getInstance();
	
	public Mentor[] getMentorIdx(MentorList mentorList) {
		Mentor[] mentorArr = null;
		
		Connection conn = template.getConnection();
		
		try {
			
			mentorArr = mDao.getMentorIdx(mentorList, conn);
			
		} finally {
			template.close(conn);
		}
		
		return mentorArr;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
