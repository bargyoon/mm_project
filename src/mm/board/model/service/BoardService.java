package mm.board.model.service;

import java.io.File;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import mm.board.model.dao.BoardDao;
import mm.board.model.dto.BoardMentee;
import mm.common.db.JDBCTemplate;
import mm.common.exception.DataAccessException;
import mm.common.file.FileDTO;

public class BoardService {

	private JDBCTemplate template = JDBCTemplate.getInstance();
	private BoardDao boardDao = new BoardDao();

	public List<BoardMentee> selectBoardList() {

		List<BoardMentee> boardMentee = null;
		Connection conn = template.getConnection();
		boardMentee = boardDao.selectBoardList(conn);
		return boardMentee;
	}

	public Map<String, Object> selectBoardDetail(int bdIdx) {

		Connection conn = template.getConnection();
		Map<String, Object> res = new HashMap<String, Object>();

		try {
			BoardMentee boardMentee = boardDao.selectBoardDetail(bdIdx, conn);
			List<FileDTO> files = boardDao.selectFileDTOs(bdIdx, conn);
			res.put("boardMentee", boardMentee);
			res.put("files", files);
		} finally {
			template.close(conn);
		}
		return res;
	}

	public void insertBoard(BoardMentee boardMentee, List<FileDTO> fileDTOs) {
		Connection conn = template.getConnection();

		try {
			boardDao.insertBoard(boardMentee, conn);
			for (FileDTO fileDTO : fileDTOs) {
				boardDao.insertFile(fileDTO, conn);
			}
			template.commit(conn);
		} catch (DataAccessException e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
	}

	public void deleteBoard(int bdIdx) {
		Connection conn = template.getConnection();

		try {

			List<FileDTO> fileDTO = boardDao.selectFileDTOs(bdIdx, conn);

			for (FileDTO fileDTO2 : fileDTO) {
				String savePath = "C:\\CODE\\upload\\";
				String subPath = fileDTO2.getSavePath();
				String fileSavePath = savePath + subPath;
				String fileName = fileDTO2.getRenameFileName();
				File deleteFile = new File(fileSavePath + fileName);
				System.out.println("지울파일이름 : " + fileSavePath + fileName);
				if (deleteFile.exists()) {
					deleteFile.delete();
				}
			}

			boardDao.deleteBoard(bdIdx, conn);
			boardDao.deleteBoardFileDatas(bdIdx, conn);
			template.commit(conn);
		} catch (DataAccessException e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
	}

	public void updateBoard(BoardMentee boardMentee, int bdIdx, List<FileDTO> fileDTOs) {
		Connection conn = template.getConnection();
		
		try {
			for (FileDTO fileDTO : fileDTOs) {
				boardDao.insertFile(fileDTO, conn, bdIdx);
			}
			boardDao.updateBoard(boardMentee, bdIdx, conn);
			template.commit(conn);
		} catch (DataAccessException e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
	}

	public void deleteBoard(int bdIdx, Map<String, Object> datas) {
		Connection conn = template.getConnection();
		Map<String, Object> res = new HashMap<String, Object>();
		try {
			// boardDao.deleteBoard(bdIdx, conn);
			// boardDao.deleteBoardFile(bdIdx, conn);
			// File file = new File((String) datas.get(0));
			System.out.println(datas.get(0));
			System.out.println(datas);
			// for (FileDTO fileDTO : fileDTOs) { boardDao.deleteFile(fileDTO,conn); }

			template.commit(conn);
		} catch (DataAccessException e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}

	}

	public void deleteFile(int bdIdx) {
		Connection conn = template.getConnection();

		try {

			List<FileDTO> fileDTO = boardDao.selectFileDTOs(bdIdx, conn);

			for (FileDTO fileDTO2 : fileDTO) {
				String savePath = "C:\\CODE\\upload\\";
				String subPath = fileDTO2.getSavePath();
				String fileSavePath = savePath + subPath;
				String fileName = fileDTO2.getRenameFileName();
				File deleteFile = new File(fileSavePath + fileName);
				System.out.println("지울파일이름 : " + fileSavePath + fileName);
				if (deleteFile.exists()) {
					deleteFile.delete();
				}
			}

			boardDao.deleteBoardFileDatas(bdIdx, conn);
			template.commit(conn);
		} catch (DataAccessException e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
		
	}

}
