package com.jaeseong.world.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jaeseong.world.dao.MemberMapper;
import com.jaeseong.world.dto.CartDTO;
import com.jaeseong.world.dto.CartViewDTO;
import com.jaeseong.world.dto.CookieDTO;
import com.jaeseong.world.dto.CurrentViewDTO;
import com.jaeseong.world.dto.MemberDTO;
import com.jaeseong.world.dto.OrderDTO;
import com.jaeseong.world.dto.OrderDetailDTO;
import com.jaeseong.world.dto.OrderViewDTO;
import com.jaeseong.world.dto.PagingDTO;
import com.jaeseong.world.dto.ProductDTO;
import com.jaeseong.world.dto.QnaDTO;
import com.jaeseong.world.dto.ReviewDTO;
import com.jaeseong.world.util.FileUtils;

@Service
public class MemberService {
	@Autowired
	MemberMapper mapper;
	
	public void member_join(MemberDTO mdto){
		mapper.member_join(mdto);
	}
	
	public MemberDTO get_mem(MemberDTO mdto){
		return mapper.member_one_sel(mdto);
	}
	
	public int member_check(MemberDTO mdto){
		
		if(mapper.member_one_sel(mdto)==null){
			//아이디 없는거
			return -1;
		}else {
			//아이디는 있고
			MemberDTO mTest = mapper.member_one_sel(mdto);
			//비밀번호
			if(!mTest.getPwd().equals(mdto.getPwd())){
				//로그인이 안된거
				return 0;
			}else{
				//로그인이 된건데
				//관리자인지 사용자인지 비교
				if(mTest.getAuthority()==1) return 3;
				else return 1;
			}
		}
	}
	
	public ProductDTO product_one_sel(int id){
		return mapper.product_one_sel(id);
	}
	public List<ProductDTO> product_all_sel_onsel(PagingDTO pdto){
		return mapper.product_all_sel_onsel(pdto);
	}

	public void addtocart(CartDTO cdto) {
		
		if(mapper.isSameCart(cdto)==null){
			mapper.addtocart(cdto);
			
		}else{
			
			CartDTO c = mapper.isSameCart(cdto);
			
			int temp = c.getAmount()+cdto.getAmount();
			cdto.setAmount(temp);
			cdto.setId(c.getId());
			mapper.changeamount(cdto);
		
		}
		
		
	}

	public List<ProductDTO> cookiee(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();	// 요청정보로부터 쿠키를 가져온다.
		
		int count=0;
		
		CookieDTO cdto = new CookieDTO();

		for(int i=cookies.length-1 ; i>=0 ; i--){
			
			if(cookies[i].getValue().length()<=3){
				int temp = Integer.parseInt(cookies[i].getValue());
				
				if(count == 0){
					cdto.setAr2(temp);
				}else if(count == 1){
					cdto.setAr3(temp);
				}else if(count == 2){
					cdto.setAr4(temp);
				}
				
				count++;
				if(count==3) break;
			}
			
		}
		return mapper.cookiee(cdto);
	}

	public List<ProductDTO> same_category(ProductDTO p) {
		
		return mapper.same_category(p);
	}

	public List<CartViewDTO> getCart(MemberDTO mem) {
		
		return mapper.getCart(mem);
	}

	public void changeamount(CartDTO cdto) {
		mapper.changeamount(cdto);
		
	}

	public void cartChoery(String[] orderlist) {
		for(int i=0;i<orderlist.length;i++){
			mapper.cartCheory(orderlist[i]);
		}
		
		
	}

	public void addOrder(OrderDTO od) {

		mapper.addOrder(od);
		
	}

	public List<CartDTO> cart_id(String[] orderlist) {
		
		List<CartDTO> list=new ArrayList<CartDTO>();
		
		for(int i=0;i<orderlist.length;i++){
			list.add( mapper.cart_id(orderlist[i]) );
		}
		return list;
	}

	public void addOrder_detail(int id, List<CartDTO> pid) {
		for(int i=0; i<pid.size();i++){
			
			OrderDetailDTO oddto = new OrderDetailDTO();
			
			oddto.setOrderid(id);
			oddto.setPid(pid.get(i).getProductid());
			oddto.setAmount(pid.get(i).getAmount());
			mapper.addOrder_detail(oddto);
			//주문 완료하면서 remain, sold 수정
			mapper.EditSold_Remain(pid.get(i));
		}
		
		
	}

	public void deleteCart(int id) {
		mapper.deleteCart(id);
		
	}

	public List<OrderViewDTO> order_list_by_id(String id) {
		
		return mapper.order_list_by_id(id);
	}
	
	public List<OrderViewDTO> all_order_list_by_id(String id) {
			
			return mapper.all_order_list_by_id(id);
		}
	
	public OrderViewDTO current_order_title(int id) {
		
		return mapper.current_order_title(id);
	}
	
	public List<CurrentViewDTO> current_order_detail_by_orderid(int id) {
		
		return mapper.current_order_detail_by_orderid(id);
	}
	
	public void order_detail_list_by_orderid(int id) {
		
		List<OrderDetailDTO> list = mapper.order_detail_list_by_orderid(id);
		
		for(int i=0;i<list.size();i++){
			CartDTO cdto = new CartDTO();
			cdto.setAmount(-list.get(i).getAmount());
			cdto.setProductid(list.get(i).getPid());
			mapper.EditSold_Remain(cdto);
		}
		
		OrderDetailDTO oddto = new OrderDetailDTO();
		oddto.setOrderid(id);
		oddto.setChoery(3);
		mapper.change_Order_detail_cheory(oddto);
	}

	public void change_Order_detail_cheory(OrderDetailDTO oddto) {
		List<OrderDetailDTO> list = mapper.order_detail_list_by_orderid(oddto.getOrderid());
		
		//넘어온게 1이면 sold + / remain -
		//넘어온게 3이면 sold - / remian +
		if(oddto.getChoery()!=1 && oddto.getChoery()!=2){
			
			for(int i=0;i<list.size();i++){
				CartDTO cdto = new CartDTO();
				
				if(oddto.getChoery()==0){
					cdto.setAmount(list.get(i).getAmount());
				}else if(oddto.getChoery()==3){
					cdto.setAmount(-list.get(i).getAmount());
					
				}
				cdto.setProductid(list.get(i).getPid());
				mapper.EditSold_Remain(cdto);
			}
			
		}

		mapper.change_Order_detail_cheory(oddto);
		
	}

	public void add_review(ReviewDTO rdto, MultipartFile file) {
		
		String pic = null;
		
		if(!file.isEmpty()){
		 	FileUtils fu = FileUtils.getInstance();
		 	pic = fu.writeFile(file, "image/");
		}
		
		if(pic!=null){
			rdto.setImage(pic);
		}else{
			rdto.setImage("");
		}
		
		mapper.add_review(rdto);
		
	}

	public void change_cheory_for_review(int orderdetailid) {
		mapper.change_cheory_for_review(orderdetailid);
	}

	public List<ReviewDTO> review_list() {
		return mapper.review_list();
	}

	public ReviewDTO review_detail(int id) {
		return mapper.reveiw_detail(id);
	}

	public void update_Review(ReviewDTO rdto, MultipartFile file, String originalImage) {
		String pic = null;
		
		if(!file.isEmpty()){
		 	FileUtils fu = FileUtils.getInstance();
		 	pic = fu.writeFile(file, "image/");
		}
		
		if(pic!=null){
			rdto.setImage(pic);
		}else{
			rdto.setImage(originalImage);
		}
		mapper.update_Review(rdto);
	}

	public List<QnaDTO> qna_list_by_id(String id) {
		
		return mapper.qna_list_by_id(id);
	}

	public QnaDTO qna_detail(int id) {
		
		return mapper.qna_detail(id);
	}

	public void delete_Review(int id) {
		mapper.delete_Review(id);
		
	}

	public void update_Qna(QnaDTO qdto) {
		mapper.update_Qna(qdto);
		
	}

	public void delete_Qna(int id) {
		mapper.delete_Qna(id);
		
	}

	public void qna_write(QnaDTO qdto) {
		mapper.qna_write(qdto);		
	}

	public int id_check(String id) {
		int result=-1;
		MemberDTO md = mapper.id_check(id);
		if(md==null){
			result=1;
		}
		
		return result;
	}

	public void update_member(MemberDTO mdto) {
		mapper.update_member(mdto);
		
	}
		

}
