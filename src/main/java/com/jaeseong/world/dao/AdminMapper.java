package com.jaeseong.world.dao;

import java.util.List;

import com.jaeseong.world.dto.MainImageDTO;
import com.jaeseong.world.dto.MemberDTO;
import com.jaeseong.world.dto.OrderViewDTO;
import com.jaeseong.world.dto.PagingDTO;
import com.jaeseong.world.dto.ProductDTO;
import com.jaeseong.world.dto.QnaDTO;

public interface AdminMapper {
	public void m_change(MainImageDTO mdto);
	public void m_insert(MainImageDTO mdto);
	public MainImageDTO m_one_image(MainImageDTO mdto);
	public List<MainImageDTO> m_image();
	
	public void p_insert(ProductDTO pdto);
	public List<ProductDTO> p_list();
	public List<MemberDTO> paging_member_keyword(PagingDTO pdto);
	public int paging_member_count(PagingDTO pdto);
	public void editProduct(ProductDTO pdto);
	public List<ProductDTO> productAllList();
	public List<OrderViewDTO> all_order_list();
	public List<QnaDTO> all_Qna();
	public void write_reply(QnaDTO qdto);
	public MemberDTO get_one_member(String id);
	public void change_member_useyn(MemberDTO mdto);
}
