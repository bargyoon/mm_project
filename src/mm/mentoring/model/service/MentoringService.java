package mm.mentoring.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import mm.common.db.JDBCTemplate;
import mm.member.model.dto.Mentor;
import mm.mentoring.model.dao.MentoringDao;
import mm.mentoring.model.dto.MentorCondition;

public class MentoringService {
	
	private MentoringDao mDao = new MentoringDao();
	private JDBCTemplate template = JDBCTemplate.getInstance();
	
	public List<Mentor> getMentorIdx(MentorCondition mentorCondition) {
		List<Mentor> mentorList = new ArrayList<Mentor>();
		
		Connection conn = template.getConnection();
		
		try {
			
			mentorList = mDao.getMentorIdx(mentorCondition, conn);
			
		} finally {
			template.close(conn);
		}
		
		return mentorList;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
