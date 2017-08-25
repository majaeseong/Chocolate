package com.jaeseong.world.dao;

import java.util.List;

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

public interface MemberMapper {
	public void member_join(MemberDTO mdto);
	public MemberDTO member_one_sel(MemberDTO mdto);
	public ProductDTO product_one_sel(int id);
	public List<ProductDTO> product_all_sel_onsel(PagingDTO pdto);
	public void addtocart(CartDTO cdto);
	public List<ProductDTO> cookiee(CookieDTO cdto);
	public List<ProductDTO> same_category(ProductDTO p);
	public List<CartViewDTO> getCart(MemberDTO mem);
	public void changeamount(CartDTO cdto);
	public void cartCheory(String orderlist);
	public void addOrder(OrderDTO od);
	public CartDTO cart_id(String string);
	public void addOrder_detail(OrderDetailDTO oddto);
	public void deleteCart(int id);
	public CartDTO isSameCart(CartDTO cdto);
	public void EditSold_Remain(CartDTO pid);
	public List<OrderViewDTO> order_list_by_id(String id);
	public List<OrderViewDTO> all_order_list_by_id(String id);
	public OrderViewDTO current_order_title(int id);
	public List<CurrentViewDTO> current_order_detail_by_orderid(int id);
	public List<OrderDetailDTO> order_detail_list_by_orderid(int id);
	public void change_Order_detail_cheory(OrderDetailDTO oddto);
	public void add_review(ReviewDTO rdto);
	public void change_cheory_for_review(int orderdetailid);
	public List<ReviewDTO> review_list();
	public ReviewDTO reveiw_detail(int id);
	public void update_Review(ReviewDTO rdto);
	public List<QnaDTO> qna_list_by_id(String id);
	public QnaDTO qna_detail(int id);
	public void delete_Review(int id);
	public void update_Qna(QnaDTO qdto);
	public void delete_Qna(int id);
	public void qna_write(QnaDTO qdto);
	public MemberDTO id_check(String id);
	public void update_member(MemberDTO mdto);
}
