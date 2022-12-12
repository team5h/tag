package kr.co.itwill.memberSeller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.itwill.concert.ConcertDTO;
import kr.co.itwill.productOrder.ProdcutOrderDTO;


@Repository
public class SellerProductDAO {
	
	public SellerProductDAO() {
		System.out.println("----------------SellerProductDAO()");
	}//end
	
	@Autowired
	SqlSession sqlSession;

	
	public int productInsert(SellerProductDTO dto) {
		return sqlSession.insert("sellerProduct.insert", dto);
	}//product Insert() end
	
	public List<ConcertDTO> concertlist() {
		return sqlSession.selectList("sellerProduct.concertlist");
	}//concert list() end
 	
	public List<SellerProductDTO> productlist() {
		return sqlSession.selectList("sellerProduct.productlist");
	}
	
	public int chkdelete(SellerProductDTO dto) throws Exception {
		return sqlSession.delete("sellerProduct.chkdelete", dto);
	}
	
	public int productstatusup(SellerProductDTO dto) {
		return sqlSession.update("sellerProduct.productstatusup",dto);
	}
	
	public SellerProductDTO productread(int pro_no) {
		return sqlSession.selectOne("sellerProduct.productread", pro_no);
	}
	
	public int productupdate (SellerProductDTO dto) {
		return sqlSession.update("sellerProduct.productupdate", dto);
	}
	
	public int productdelete (int pro_no) {
		return sqlSession.delete("sellerProduct.productdelete",pro_no);
	}
	
	public String posternameread (int pro_no) {
		return sqlSession.selectOne("sellerProduct.posternameread",pro_no);
	}
	
	public List<ProdcutOrderDTO> orderlist(String p_id) {
		return sqlSession.selectList("sellerProduct.orderlist",p_id);
	}
	
}//DAO end
