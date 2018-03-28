package com.jsr.project.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsr.project.dtos.NoticeBoardDto;
import com.jsr.project.dtos.QnaBoardDto;

@Repository
public class NoticeBoardDao implements INoticeDao{

	@Autowired
	private SqlSessionTemplate sqlSession; 
	private String namespace="com.jsr.project.notice.";
	
	// 글 목록 조회
	@Override
	public List<NoticeBoardDto> n_getAllList(QnaBoardDto dto) {  
		return sqlSession.selectList(namespace+"noticeboard",dto);
	}

	//글 상세 조회
	
	@Override
	public NoticeBoardDto n_detailBoard(int n_seq) {
		return sqlSession.selectOne(namespace+"n_detailboard",n_seq);
	}
	
	//새 글 입력 
	@Override
	public boolean n_insertBoard(NoticeBoardDto dto) {
		int count=0;
		count=sqlSession.selectOne(namespace+"n_insertboard", dto);
		return count>0?true:false;
	}

	//조횟수 증가 
	@Override
	public boolean n_readCount(int n_seq) {
		int count=0;
		count= sqlSession.update(namespace+"n_readcount",n_seq);
		return count>0?true:false;
	}

	//글 수정 
	@Override
	public boolean n_updateBoard(NoticeBoardDto dto) {
		int count=0; 
		count=sqlSession.update(namespace+"n_updateboard", dto);
		return count>0?true:false;
	}

	//한 개의 글 삭제하기
	@Override
	public boolean n_deleteOne(NoticeBoardDto dto) {
		int count=0; 
		count=sqlSession.update(namespace+"n_deleteboard", dto);
		return count>0?true:false;
	}
	
	//여러 개의 글 삭제하기 
	@Override
	public boolean n_muldelBoard(String[] n_seq) {
		Map<String, String[]>map=new HashMap<String, String[]>(); 
		map.put("n_seqs", n_seq);
		int count=sqlSession.update(namespace+"n_muldelboard", map);
		return count>0?true:false;
	}

	//ajax 처리
	@Override
	public NoticeBoardDto n_getBoardAjax(int n_seq) {
		return sqlSession.selectOne(namespace+"n_detailAjax", n_seq);
	}


	

}
