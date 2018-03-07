package com.jsr.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsr.project.daos.IQnaBoardDao;
import com.jsr.project.dtos.QnaBoardDto;

@Service
public class QnaService implements IQnaService{

	@Autowired
	private IQnaBoardDao qnaDao;

	@Override
	public List<QnaBoardDto> getAlllist() {
		return qnaDao.getAllList(); 
	}

	@Override
	public boolean insertBoard(QnaBoardDto dto) {
		return qnaDao.q_insertBoard(dto);
	}

	@Override
	public boolean readcount(int q_seq) {
		return qnaDao.readCount(q_seq);
	}

	@Override
	public QnaBoardDto getBoard(int q_seq) {
		return qnaDao.getBoard(q_seq);
	}

	@Override
	public boolean updateBoard(QnaBoardDto dto) {
		return qnaDao.updateBoard(dto);
	}

	@Override
	public boolean mulDelBoard(String[] q_seq) {
		return qnaDao.mulDelBoard(q_seq);
	}

	@Override
	public boolean deleteBoard(int q_seq) {
		return qnaDao.deleteOne(q_seq);
	}

	@Override
	public boolean replyBoard(QnaBoardDto dto) {
		return qnaDao.replyBoard(dto);
	}

	@Override
	public QnaBoardDto getBoardAjax(int q_seq) {
		return qnaDao.getBoardAjax(q_seq);
	}
	
	
	
}
