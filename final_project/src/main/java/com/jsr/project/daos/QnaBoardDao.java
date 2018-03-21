package com.jsr.project.daos;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jsr.project.dtos.QnaBoardDto;

@Repository
public class QnaBoardDao implements IQnaBoardDao{

	@Autowired
	private SqlSessionTemplate sqlSession; 
	private String namespace="com.jsr.project.qnaboard.";
	
//	글 목록 조회 - 유저 
	@Override
	public List<QnaBoardDto> q_getAllList() {
		return sqlSession.selectList(namespace+"qnaboard");
	}
	
//	공개글 상세 조회 - 유저
	@Override
	public QnaBoardDto q_getBoard(int q_seq) {
		return sqlSession.selectOne(namespace+"q_detailboard", q_seq);
	}
	
//	모든글 상세 조회 - 관리자 
	@Override
	public QnaBoardDto q_getAllBoard(int q_seq) {
		return sqlSession.selectOne(namespace+"q_detailboard_all", q_seq);
	}
	
//	새로운 글 입력 - 모두 
	@Override
	public boolean q_insertBoard(QnaBoardDto dto) {
		int count=0; 
		count=sqlSession.insert(namespace+"q_insertboard", dto);
		return count>0?true:false;
	}
	
//	새로운 답변 입력 - 관리자 
	@Override
	public int q_replyBoard(QnaBoardDto dto) {
		 return sqlSession.insert(namespace+"q_ansinsert", dto);
	}
	
//	일반 글 수정 - 모두 
	@Override
	public boolean q_updateBoard(QnaBoardDto dto) {
		int count=0; 
		count=sqlSession.update(namespace+"q_updateboard", dto); 
		return count>0?true:false;
	}
	
//	답변 글 수정 - 관리자
	@Override
	public int q_updateReply(int q_seq) {
	 return sqlSession.update(namespace+"q_ansupdate", q_seq);
	}
	
	
//	조횟수 증가 - 모두 
	@Override
	public boolean q_readCount(int q_seq) {
		int count=0; 
		count=sqlSession.update(namespace+"q_readcount", q_seq);
		return count>0?true:false;
	}
	
//	한 개의 글 삭제하기 - 모두 
//	q_deleteboard
	@Override
	public boolean q_deleteOne(int q_seq) {
		int count=0; 
		count=sqlSession.update(namespace+"q_deleteboard", q_seq);
		return count>0?true:false; 
		
	}

//	여러개의 글 삭제하기 - 관리자 
	@Override
	public boolean q_mulDelBoard(String[] q_seq) {
		Map<String, String[]>map=new HashMap<String, String[]>();
		map.put("q_seqs", q_seq);
		int count=sqlSession.update(namespace+"q_muldelboard", map); 
		return count>0?true:false;
	}

//  ajax 처리
	@Override
	public QnaBoardDto q_getBoardAjax(int q_seq) {
		return sqlSession.selectOne(namespace+"q_detailAjax", q_seq);
	}



	}


	