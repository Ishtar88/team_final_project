package com.jsr.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsr.project.dtos.NoticeBoardDto;
import com.jsr.project.dtos.QnaBoardDto;
import com.jsr.project.daos.INoticeDao; 

@Service
public class NoticeService implements INoticeService{

	@Autowired
	private INoticeDao noticeDao; 
	
	@Override
	public List<NoticeBoardDto> n_getAllList(QnaBoardDto dto) {
		return noticeDao.n_getAllList(dto);
	}

	@Override
	public boolean n_insertBoard(NoticeBoardDto dto) {
		return noticeDao.n_insertBoard(dto);
	}

	@Override
	public boolean n_readcount(int n_seq) {
		return noticeDao.n_readCount(n_seq);
	}

	@Override
	public NoticeBoardDto n_detailBoard(int n_seq, String count) {
		if (count.equals("count")) {
			noticeDao.n_readCount(n_seq);
		}
		return noticeDao.n_detailBoard(n_seq);
		
	}

	@Override
	public boolean n_updateBoard(NoticeBoardDto dto) {
		return noticeDao.n_updateBoard(dto); 
	}

	@Override
	public boolean n_mulDelBoard(String[] n_seq) {
		return noticeDao.n_muldelBoard(n_seq); 
	}

	@Override
	public boolean n_deleteBoard(NoticeBoardDto dto) {
		return noticeDao.n_deleteOne(dto);
	}

	@Override
	public NoticeBoardDto n_getBoardAjax(int n_seq) {
		return noticeDao.n_getBoardAjax(n_seq);
	}

}
