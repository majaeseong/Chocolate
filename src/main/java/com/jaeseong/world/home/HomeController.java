package com.jaeseong.world.home;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jaeseong.world.dto.CartDTO;
import com.jaeseong.world.dto.CartViewDTO;
import com.jaeseong.world.dto.CrawlDTO;
import com.jaeseong.world.dto.MainImageDTO;
import com.jaeseong.world.dto.MemberDTO;
import com.jaeseong.world.dto.OrderDTO;
import com.jaeseong.world.dto.OrderDetailDTO;
import com.jaeseong.world.dto.PagingDTO;
import com.jaeseong.world.dto.ProductDTO;
import com.jaeseong.world.dto.QnaDTO;
import com.jaeseong.world.dto.ReviewDTO;
import com.jaeseong.world.service.AdminService;
import com.jaeseong.world.service.MemberService;
import com.jaeseong.world.service.SessionService;
import com.jaeseong.world.util.UrltoFile;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	AdminService aservice;

	@Autowired
	MemberService mservice;

	@Autowired
	SessionService sservice;

	MemberDTO md;
	

	@RequestMapping(value = "/move_to_crawl", method = RequestMethod.GET)
	public String move_to_crawl(Model model) throws Exception {

		if (sservice.getSession() == null) {
			return "redirect:login_form";
		} else {
			md = sservice.getSession();
			if (md.getAuthority() == 0) {
				return "redirect:home";
			}
		}

		return "admin/move_to_crawl";
	}

	@RequestMapping(value = "/crawlpage")
	public String crawlpage(@RequestParam(required = false) String word, Model model) throws Exception {

		List<CrawlDTO> list = aservice.crawllist(word);

		model.addAttribute("list", list);

		return "admin/CrawlPage";

	}
	
	@RequestMapping(value = "/crwaladdproduct", method = RequestMethod.GET)
	public String crwaladdproduct(@RequestParam String urld, ProductDTO pd) throws IOException{
		UrltoFile utf = UrltoFile.getInstance();
		
		int size = urld.lastIndexOf('?');
		String url = urld.substring(0, size);
		
		MultipartFile multipartFile = utf.urltofile(url);
		
		aservice.p_insert(pd, multipartFile);
		
        return "redirect:home";
		
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Model model) {

		model.addAttribute("image", aservice.m_image());
		model.addAttribute("list", aservice.p_list());

		return "common/home";
	}

	@RequestMapping(value = "/change_home")
	public String change_home(Model model) throws Exception {
		if (sservice.getSession() == null) {
			return "redirect:login_form";
		} else {
			md = sservice.getSession();
			if (md.getAuthority() == 0) {
				return "redirect:home";
			}
		}

		model.addAttribute("image", aservice.m_image());

		return "admin/mainimagechange";
	}

	@RequestMapping(value = "/change", method = RequestMethod.POST)
	public String change(@RequestParam int no, @RequestParam MultipartFile image) {

		MainImageDTO mi = new MainImageDTO();
		mi.setNo(no);

		aservice.m_change(mi, image);

		return "redirect:change_home";
	}

	@RequestMapping(value = "/join_form")
	public String join_form() {

		return "member/join";
	}

	@RequestMapping(value = "/id_check")
	public String id_check(@RequestParam String id, Model model) {

		id = id.trim();
		int result = -1;
		if (id != null && !id.equals("")) {
			result = mservice.id_check(id);

		}
		model.addAttribute("result", result);
		model.addAttribute("id", id);

		return "common/IdCheckForm";
	}

	@RequestMapping(value = "/join")
	public String join(MemberDTO mdto) {

		mservice.member_join(mdto);

		return "redirect:home";
	}

	@RequestMapping(value = "/login_form")
	public String login_form(@RequestParam(required = false, defaultValue = "0") int id, Model model) {
		model.addAttribute("id", id);
		return "member/login";
	}

	@RequestMapping(value = "/login")
	public String login(Model model, MemberDTO mdto, HttpSession session,
			@RequestParam(required = false, defaultValue = "0") int pid) {

		// 관리자에서 먼저 찾아보고 없으면 멤버에서 찾아보고
		System.out.println(pid);
		int result = mservice.member_check(mdto);
		String url = "member/login";
		String msg = "";
		if (result == 1 || result == 3) {
			session.setAttribute("loginuser", mservice.get_mem(mdto));
			url = "redirect:home";
			if (pid != 0) {
				url = "redirect:productdetail?id=" + pid;
			}

		} else if (result == 0) {
			msg = "비밀번호를 다시 확인해주세요";
			model.addAttribute("msg", msg);
		} else if (result == -1) {
			msg = "아이디를 다시 확인해주세요";
			model.addAttribute("msg", msg);
		}
		model.addAttribute("id", pid);
		return url;
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		if (session != null)
			session.invalidate();
		return "redirect:home";
	}

	@RequestMapping(value = "/addproduct_form")
	public String addproduct_form() throws Exception {

		if (sservice.getSession() == null) {
			return "redirect:login_form";
		} else {
			md = sservice.getSession();
			if (md.getAuthority() == 0) {
				return "redirect:home";
			}
		}

		return "admin/productAdd";
	}

	@RequestMapping(value = "/addproduct")
	public String addproduct(ProductDTO pdto, @RequestParam MultipartFile file) {

		aservice.p_insert(pdto, file);

		return "redirect:home";
	}

	@RequestMapping(value = "/productdetail")
	public String productdetail(@RequestParam int id, Model model, HttpServletRequest request) {

		ProductDTO p = mservice.product_one_sel(id);

		model.addAttribute("product", p);
		request.setAttribute("id", id);

		List<ProductDTO> list = mservice.cookiee(request);
		model.addAttribute("list", list);

		List<ProductDTO> ca_list = mservice.same_category(p);
		model.addAttribute("calist", ca_list);

		return "home/productdetail";
	}

	@RequestMapping(value = "/productlist")
	public String productlist(@RequestParam(required = false, defaultValue = "1") int pageNum,
			@RequestParam(required = false) String keyword, Model model) throws Exception {
		int offset = 9;

		int startNum = (pageNum - 1) * offset;
		PagingDTO pdto = new PagingDTO();
		pdto.setOffset(offset);
		pdto.setStartNum(startNum);
		if (keyword != null && !keyword.trim().equals("")) {
			pdto.setKeyword(keyword);
		}

		model.addAttribute("list", mservice.product_all_sel_onsel(pdto));
		model.addAttribute("pdto", pdto);
		return "home/productlist";
	}

	@RequestMapping(value = "/scroll_page", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<ProductDTO> scroll_page(@RequestParam(required = false, defaultValue = "1") int pageNum,
			@RequestParam(required = false) String keyword) {

		int offset = 9;

		int startNum = (pageNum - 1) * offset;
		PagingDTO pdto = new PagingDTO();
		pdto.setOffset(offset);
		pdto.setStartNum(startNum);

		if (keyword != null && !keyword.trim().equals("")) {
			pdto.setKeyword(keyword);
		}

		return mservice.product_all_sel_onsel(pdto);
	}

	@RequestMapping(value = "/contactus")
	public String contactus() {

		return "home/contactus";
	}

	@RequestMapping(value = "/membermanage")
	public String membermanage(@RequestParam(required = false, defaultValue = "1") int pageNum,
			@RequestParam(required = false) String sortby, Model model, @RequestParam(required = false) String keyword,
			@RequestParam(required = false, defaultValue = "3") int offset) throws Exception {

		if (sservice.getSession() == null) {
			return "redirect:login_form";
		} else {
			md = sservice.getSession();
			if (md.getAuthority() == 0) {
				return "redirect:home";
			}
		}

		int startNum = (pageNum - 1) * offset;
		PagingDTO pdto = new PagingDTO();
		pdto.setOffset(offset);
		pdto.setStartNum(startNum);

		if (keyword != null && !keyword.trim().equals("")) {
			pdto.setSortby(sortby);
			pdto.setKeyword(keyword);
		}
		model.addAttribute("list", aservice.paging_member_keyword(pdto));

		model.addAttribute("count", aservice.paging_last_pageNo(pdto));
		model.addAttribute("pdto", pdto);

		return "admin/membermanage";
	}

	@RequestMapping(value = "/addtocart")
	public String addtocart(@RequestParam(required = false) int amount, @RequestParam(required = false) int id,
			HttpSession session, Model model) {

		if (session.getAttribute("loginuser") == null) {
			model.addAttribute("id", id);
			return "redirect:login_form";
		} else {
			MemberDTO mem = (MemberDTO) session.getAttribute("loginuser");

			CartDTO cdto = new CartDTO();
			cdto.setMemid(mem.getId());
			cdto.setProductid(id);
			cdto.setAmount(amount);

			mservice.addtocart(cdto);

			return "redirect:cartview";
		}

	}

	@RequestMapping(value = "/cartview")
	public String cartview(HttpSession session, Model model) {

		if (session.getAttribute("loginuser") == null) {
			return "redirect:login_form";
		} else {
			MemberDTO mem = (MemberDTO) session.getAttribute("loginuser");
			List<CartViewDTO> list = mservice.getCart(mem);
			model.addAttribute("list", list);
		}

		return "member/cartView";
	}

	@RequestMapping(value = "/changeamount")
	public String changeamount(CartDTO cdto) {

		mservice.changeamount(cdto);

		return "redirect:cartview";
	}

	@RequestMapping(value = "/order_page")
	public String order_page(HttpServletRequest request, HttpSession session, @RequestParam int total,
			@RequestParam String addr, Model model) throws Exception {

		if (sservice.getSession() == null) {
			return "redirect:login_form";
		}

		String addr_radio = request.getParameter("addr_radio");
		String[] orderlist = request.getParameterValues("chk[]");

		// cheory =1로 바꿔주고
		mservice.cartChoery(orderlist);

		// 주문에 추가하고
		MemberDTO mem = (MemberDTO) session.getAttribute("loginuser");
		if (total < 50000) {
			total += 2500;
		}
		OrderDTO od = new OrderDTO();
		od.setMemid(mem.getId());

		od.setTotalprice(total);

		if (addr_radio.equals("0")) {
			od.setAddr(mem.getAddr());
		} else {
			od.setAddr(addr);
		}

		mservice.addOrder(od);
		// 주문id 받아서 주문상세 추가(cartid-orderlist를 통해서 상품 id랑 주문수량 받아오기)하고
		List<CartDTO> pid = mservice.cart_id(orderlist);
		mservice.addOrder_detail(od.getId(), pid);

		// 주문 리스트를 다 가지고 가라 처리가 0인 애들
		model.addAttribute("title", mservice.current_order_title(od.getId()));
		model.addAttribute("list", mservice.current_order_detail_by_orderid(od.getId()));

		return "member/currentOrderPage";
	}

	@RequestMapping(value = "/deleteCart")
	public String deleteCart(@RequestParam int id) {

		mservice.deleteCart(id);

		return "redirect:cartview";
	}

	@RequestMapping(value = "/editproduct")
	public String editproduct(@RequestParam int id, Model model) throws Exception {

		if (sservice.getSession() == null) {
			return "redirect:login_form";
		} else {
			md = sservice.getSession();
			if (md.getAuthority() == 0) {
				return "redirect:home";
			}
		}

		model.addAttribute("product", mservice.product_one_sel(id));

		return "admin/productEdit";
	}

	@RequestMapping(value = "/editsuccess")
	public String editsuccess(@RequestParam String originalImage, @RequestParam MultipartFile file, ProductDTO pdto) {

		aservice.editProduct(pdto, file, originalImage);

		return "redirect:home";
	}

	@RequestMapping(value = "/productAllList")
	public String productAllList(Model model) throws Exception {

		if (sservice.getSession() == null) {
			return "redirect:login_form";
		} else {
			md = sservice.getSession();
			if (md.getAuthority() == 0) {
				return "redirect:home";
			}
		}

		model.addAttribute("list", aservice.productAllList());

		return "admin/productAllList";
	}

	@RequestMapping(value = "/orderview")
	public String orderview(HttpSession session, Model model) throws Exception {

		if (sservice.getSession() == null) {
			return "redirect:login_form";
		}

		MemberDTO mem = (MemberDTO) session.getAttribute("loginuser");
		model.addAttribute("order_list", mservice.order_list_by_id(mem.getId()));

		return "member/order_page";
	}

	@RequestMapping(value = "/allorderview")
	public String allorderview(HttpSession session, Model model) throws Exception {

		if (sservice.getSession() == null) {
			return "redirect:login_form";
		}

		MemberDTO mem = (MemberDTO) session.getAttribute("loginuser");
		model.addAttribute("order_list", mservice.all_order_list_by_id(mem.getId()));

		return "member/order_page";
	}

	@RequestMapping(value = "/orderdetail")
	public String orderdetail(@RequestParam int id, Model model) {

		model.addAttribute("title", mservice.current_order_title(id));
		model.addAttribute("list", mservice.current_order_detail_by_orderid(id));

		return "member/currentOrderPage";
	}

	@RequestMapping(value = "/delete_order")
	public String delete_order(@RequestParam int id) {

		mservice.order_detail_list_by_orderid(id);

		return "redirect:orderview";
	}

	@RequestMapping(value = "/orderManage")
	public String orderManage(Model model) throws Exception {

		if (sservice.getSession() == null) {
			return "redirect:login_form";
		} else {
			md = sservice.getSession();
			if (md.getAuthority() == 0) {
				return "redirect:home";
			}
		}

		model.addAttribute("list", aservice.all_order_list());

		return "admin/orderManage";
	}

	@RequestMapping(value = "/changeChoery")
	public String changeChoery(@RequestParam int id, @RequestParam int choery,Model model) throws Exception {

		if (sservice.getSession() == null) {
			return "redirect:login_form";
		} else {
			md = sservice.getSession();
			if (md.getAuthority() == 0) {
				return "redirect:home";
			}
		}

		OrderDetailDTO oddto = new OrderDetailDTO();
		oddto.setOrderid(id);
		oddto.setChoery(choery);

		mservice.change_Order_detail_cheory(oddto);
		model.addAttribute("id", id);
		return "redirect:orderdetail";
	}

	@RequestMapping(value = "/writeReview", method = RequestMethod.GET)
	public String writeReview(@RequestParam int pid, @RequestParam int orderdetailid, Model model) throws Exception {

		if (sservice.getSession() == null) {
			return "redirect:login_form";
		}

		model.addAttribute("product", mservice.product_one_sel(pid));
		model.addAttribute("orderdetailid", orderdetailid);

		return "member/writeReview";
	}

	@RequestMapping(value = "/writeReview", method = RequestMethod.POST)
	public String writeReview(ReviewDTO rdto, Model model, HttpSession session, @RequestParam MultipartFile file,
			@RequestParam int orderdetailid) {

		MemberDTO mem = (MemberDTO) session.getAttribute("loginuser");
		rdto.setMemid(mem.getId());

		// 리뷰 등록하고
		mservice.add_review(rdto, file);

		// 처리 2로 바꿔주고
		mservice.change_cheory_for_review(orderdetailid);

		// 리뷰 목록 가져오고
		model.addAttribute("reviewList", mservice.review_list());

		return "common/viewReview";
	}

	@RequestMapping(value = "/viewReview")
	public String viewReview(Model model) {
		model.addAttribute("reviewList", mservice.review_list());

		return "common/viewReview";
	}

	@RequestMapping(value = "/reivewDetail")
	public String reivewDetail(@RequestParam int id, Model model) {
		ReviewDTO rd = mservice.review_detail(id);
		model.addAttribute("product", mservice.product_one_sel(rd.getPid()));
		model.addAttribute("review", rd);

		return "common/viewReview_detail";
	}

	@RequestMapping(value = "/updateReview", method = RequestMethod.GET)
	public String updateReview(@RequestParam int id, Model model) {

		model.addAttribute("review", mservice.review_detail(id));

		return "common/update_review";
	}

	@RequestMapping(value = "/updateReview", method = RequestMethod.POST)
	public String updateReview2(ReviewDTO rdto, @RequestParam MultipartFile file, @RequestParam String originalImage,
			Model model) {

		mservice.update_Review(rdto, file, originalImage);

		model.addAttribute("id", rdto.getId());

		return "redirect:reivewDetail";
	}

	@RequestMapping(value = "/deleteReview")
	public String deleteReview(@RequestParam int id) {

		mservice.delete_Review(id);

		return "redirect:viewReview";
	}

	@RequestMapping(value = "/qna_write", method = RequestMethod.GET)
	public String qna_write(HttpSession session) {
		if (session.getAttribute("loginuser") == null) {
			return "redirect:login_form";
		} else {
			return "member/qna_write";
		}

	}

	@RequestMapping(value = "/qna_write", method = RequestMethod.POST)
	public String qna_write(QnaDTO qdto, HttpSession session) {

		MemberDTO mdto = (MemberDTO) session.getAttribute("loginuser");
		qdto.setMemid(mdto.getId());
		mservice.qna_write(qdto);

		return "redirect:viewqna";
	}

	@RequestMapping(value = "/viewqna", method = RequestMethod.GET)
	public String viewqna(HttpSession session, Model model) {

		if (session.getAttribute("loginuser") == null) {
			return "redirect:login_form";
		} else {
			MemberDTO mdto = (MemberDTO) session.getAttribute("loginuser");
			model.addAttribute("qnalist", mservice.qna_list_by_id(mdto.getId()));
		}

		return "member/qna_view";
	}

	@RequestMapping(value = "/qna_detail")
	public String qna_detail(@RequestParam int id, Model model) {

		model.addAttribute("qna", mservice.qna_detail(id));

		return "member/qna_detail";
	}

	@RequestMapping(value = "/updateQna", method = RequestMethod.GET)
	public String updateQna(@RequestParam int id, Model model) {

		model.addAttribute("qna", mservice.qna_detail(id));

		return "member/qna_updateForm";
	}

	@RequestMapping(value = "/updateQna", method = RequestMethod.POST)
	public String updateQna(QnaDTO qdto, Model model) {

		mservice.update_Qna(qdto);

		model.addAttribute("id", qdto.getId());

		return "redirect:qna_detail";
	}

	@RequestMapping(value = "/deleteQna")
	public String deleteQna(@RequestParam int id) {

		mservice.delete_Qna(id);

		return "redirect:viewqna";
	}

	@RequestMapping(value = "/viewAllQna")
	public String viewAllQna(Model model) throws Exception {

		if (sservice.getSession() == null) {
			return "redirect:login_form";
		} else {
			md = sservice.getSession();
			if (md.getAuthority() == 0) {
				return "redirect:home";
			}
		}

		model.addAttribute("qnaList", aservice.all_Qna());

		return "admin/viewAllQna";
	}

	@RequestMapping(value = "/write_reply")
	public String write_reply(QnaDTO qdto) {

		aservice.write_reply(qdto);

		return "redirect:viewAllQna";
	}

	@RequestMapping(value = "/change_member_useyn")
	public String change_member_useyn(HttpServletRequest request) throws Exception {

		if (sservice.getSession() == null) {
			return "redirect:login_form";
		} else {
			md = sservice.getSession();
			if (md.getAuthority() == 0) {
				return "redirect:home";
			}
		}
		String[] memid = request.getParameterValues("chk[]");

		aservice.change_member_useyn(memid);

		return "redirect:membermanage";
	}

	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	public String myPage(HttpSession session, Model model) {

		if (session.getAttribute("loginuser") == null) {
			return "redirect:login_form";
		} else {
			model.addAttribute("member", mservice.get_mem((MemberDTO) session.getAttribute("loginuser")));
			return "member/myPage";
		}
	}

	@RequestMapping(value = "/myPage", method = RequestMethod.POST)
	public String myPage2(MemberDTO mdto, @RequestParam String oldpwdCheck) {

		if (mdto.getPwd() == null) {
			mdto.setPwd(oldpwdCheck);
		}
		mservice.update_member(mdto);
		return "redirect:myPage";
	}
}
