package com.jsr.project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsr.project.dtos.NoticeBoardDto;
import com.jsr.project.daos.INoticeDao; 

@Service
public class NoticeService implements INoticeService{

	@Autowired
	private INoticeDao noticeDao; 
	
	@Override
	public List<NoticeBoardDto> getAllList() {
		return noticeDao.n_getAllList();
	}

	@Override
	public boolean insertBoard(NoticeBoardDto dto) {
		return noticeDao.n_insertBoard(dto);
	}

	@Override
	public boolean readcount(int n_seq) {
		return noticeDao.n_readCount(n_seq);
	}

	@Override
	public NoticeBoardDto detailBoard(int n_seq) {
		return noticeDao.n_detailBoard(n_seq);
	}

	@Override
	public boolean updateBoard(NoticeBoardDto dto) {
		return noticeDao.n_updateBoard(dto); 
	}

	@Override
	public boolean mulDelBoard(String[] n_seq) {
		return noticeDao.n_muldelBoard(n_seq); 
	}

	@Override
	public boolean deleteBoard(int n_seq) {
		return noticeDao.n_deleteOne(n_seq);
	}

	@Override
	public NoticeBoardDto getBoardAjax(int n_seq) {
		return noticeDao.n_getBoardAjax(n_seq);
	}

}
