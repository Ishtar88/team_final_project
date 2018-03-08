package com.jsr.project.daos;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsr.project.dtos.NoticeBoardDto;

@Repository
public class NoticeBoardDao implements INoticeDao{

	@Autowired
	private SqlSessionTemplate sqlSession; 
	private String namespace="com.jsr.project.";
	
	@Override
	public List<NoticeBoardDto> n_getAllList() {
		return null;
	}

	@Override
	public boolean n_insertBoard(NoticeBoardDto dto) {
		return false;
	}

	@Override
	public boolean n_readCount(int n_seq) {
		return false;
	}

	@Override
	public boolean n_updateBoard(NoticeBoardDto dto) {
		return false;
	}

	@Override
	public boolean n_muldelBoard(String[] n_seq) {
		return false;
	}

	@Override
	public boolean n_deleteOne(int n_seq) {
		return false;
	}

	@Override
	public NoticeBoardDto n_getBoardAjax(int n_seq) {
		return null;
	}

	@Override
	public NoticeBoardDto n_detailBoard(int n_seq) {
		return null;
	}
	

}
