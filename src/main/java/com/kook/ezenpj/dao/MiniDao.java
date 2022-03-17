package com.kook.ezenpj.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.kook.ezenpj.dto.JoinDto;

public class MiniDao implements MiniIDao {
	@Autowired //필드방식에 의한 Autowired
	private SqlSession sqlSession; //field autowired 실제는 
	
	//join
	@Override
	public String join(JoinDto dto) {
		int res = sqlSession.insert("join",dto);
		System.out.println(res);
		String result =null;
		if(res > 0)
			result = "success";
		else
			result = "failed";
		
		return result;
	}
	
//	== login==
	@Override
	public JoinDto login(String bId) {
		System.out.println(bId);
		JoinDto result = sqlSession.selectOne("login",bId);
		return result;
	}

}
