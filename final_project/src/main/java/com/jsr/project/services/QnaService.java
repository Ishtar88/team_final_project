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
	public List<QnaBoardDto> q_getAlllist() {
		return qnaDao.q_getAllList(); 
	}

	@Override
	public boolean q_insertBoard(QnaBoardDto dto) {
		return qnaDao.q_insertBoard(dto);
	}

	@Override
	public boolean q_readcount(int q_seq) {
		return qnaDao.q_readCount(q_seq);
	}

	@Override
	public QnaBoardDto q_getBoard(int q_seq, String count) {
		if (count.equals("count")) {
			qnaDao.q_readCount(q_seq);
		}
		return qnaDao.q_getBoard(q_seq);
	}

	@Override
	public boolean q_updateBoard(QnaBoardDto dto) {
		return qnaDao.q_updateBoard(dto);
	}

	@Override
	public boolean q_mulDelBoard(String[] q_seq) {
		return qnaDao.q_mulDelBoard(q_seq);
	}
	
	@Override
	public boolean q_replyBoard(QnaBoardDto dto) {
		int count=0; 
		count=qnaDao.q_replyBoard(dto);
		qnaDao.q_updateReply(dto.getQ_seq());
		return count>0?true:false;
	}

	@Override
	public boolean q_deleteBoard(QnaBoardDto dto) {
		return qnaDao.q_deleteOne(dto);
	}



	@Override
	public QnaBoardDto q_getBoardAjax(int q_seq) {
		
		return qnaDao.q_getBoardAjax(q_seq);
	}
	
	
	
}
