package mm.common.listener;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import mm.mentoring.model.dao.MentoringDao;

public class JobDelete implements Job {
    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {
        MentoringDao mDao = new MentoringDao();
        mDao.deleteAh();
        mDao.deleteMh();
    }
}
