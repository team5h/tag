package kr.co.itwill.memberSeller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itwill.memberGeneral.MemberGeneralDTO;


@Repository
public class MemberSellerDAO {
	
	public MemberSellerDAO() {
		System.out.println("------- MemberSellerDAO() 객체 생성됨 ");
	}//MemberSellerDAO() end
	
	@Autowired
	SqlSession sqlSession;
	
	
	// 로그인 등급 가져오는 sql문
	public String select(MemberSellerDTO mem_grade) {
		return sqlSession.selectOne("memberSeller.select", mem_grade);
	}//memberGeneralInsert() end
	
	
	// 아이디 중복확인 mappers
	public int idCheckS(String p_id) {
		return sqlSession.selectOne("memberSeller.idCheckS", p_id);
	}//idCheck() end
	
	
	// 이메일 중복확인 mappers
	public int emailScheck(String com_email) {
		return sqlSession.selectOne("memberSeller.emailScheck", com_email);
	}//idCheck() end
	
	
	// 회원가입 mappers
	public int joinS(MemberSellerDTO dto) {
		return sqlSession.insert("memberSeller.joinS", dto);
	}//joinG end
	
}//class end

