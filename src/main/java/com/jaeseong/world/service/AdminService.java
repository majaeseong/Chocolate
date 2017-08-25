package com.jaeseong.world.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jaeseong.world.dao.AdminMapper;
import com.jaeseong.world.dto.CrawlDTO;
import com.jaeseong.world.dto.MainImageDTO;
import com.jaeseong.world.dto.MemberDTO;
import com.jaeseong.world.dto.OrderViewDTO;
import com.jaeseong.world.dto.PagingDTO;
import com.jaeseong.world.dto.ProductDTO;
import com.jaeseong.world.dto.QnaDTO;
import com.jaeseong.world.util.FileUtils;


@Service
public class AdminService {
	
	@Autowired
	AdminMapper mapper;
	
	public List<CrawlDTO> crawllist(String word) throws IOException{
		
		List<CrawlDTO> list = new ArrayList<CrawlDTO>();
		
		String URL = "http://shopping.naver.com/search/all.nhn?query="+word+"&pagingIndex=1&pagingSize=80&viewType=list&sort=rel&frm=NVSHATC";
        Document doc = Jsoup.connect(URL).get();
        
        Elements elem = doc.select("li.ad._itemSection");
        for(Element el : elem ){
        	CrawlDTO cdto = new CrawlDTO();
        	
        	Elements imgElem = el.select("img._productLazyImg");
        	String imgElemSrc = imgElem.attr("data-original");
        	cdto.setUrl(imgElemSrc);
        	
        	Elements titleElem = el.select("a.tit");
   
        	String titleElemText = titleElem.text();
        	cdto.setTitle(titleElemText);
        	
        	String hrefElem = titleElem.attr("href");
        	cdto.setHref(hrefElem);
        	
        	
        	list.add(cdto);
        }
       
        Elements elem2 = doc.select("li._model_list._itemSection");
        for(Element el : elem2 ){
        	CrawlDTO cdto = new CrawlDTO();
        	
        	Elements imgElem = el.select("img._productLazyImg");
        	String imgElemSrc = imgElem.attr("data-original");
        	cdto.setUrl(imgElemSrc);
        	
        	Elements titleElem = el.select("a.tit");
        	
        	String titleElemText = titleElem.text();
        	cdto.setTitle(titleElemText);
        	
        	String hrefElem = titleElem.attr("href");
        	cdto.setHref(hrefElem);
        	
        	list.add(cdto);
        }
        
        Elements elem3 = doc.select("li._itemSection");
        for(Element el : elem3 ){
        	CrawlDTO cdto = new CrawlDTO();
        	
        	Elements imgElem = el.select("img._productLazyImg");
        	String imgElemSrc = imgElem.attr("data-original");
        	cdto.setUrl(imgElemSrc);
        	
        	Elements titleElem = el.select("a.tit");
        	
        	String titleElemText = titleElem.text();
        	cdto.setTitle(titleElemText);
        	
        	String hrefElem = titleElem.attr("href");
        	cdto.setHref(hrefElem);
        	
        	list.add(cdto);
        }
        return list;
	}
	
	public void m_change(MainImageDTO mi, MultipartFile image){
		String pic = null;
		if(image!=null){
			FileUtils fu = FileUtils.getInstance();
			pic = fu.writeFile(image, "image/");
		}
		if(pic!=null){
			mi.setImage(pic);
		}

		if(mapper.m_one_image(mi)==null){
			mapper.m_insert(mi);
		}
		else{
			mapper.m_change(mi);
		}
		
	}
	
	public List<MainImageDTO> m_image(){
		return mapper.m_image();
	}
	
	public void p_insert(ProductDTO pdto, MultipartFile image){
		String pic = null;
		if(!image.isEmpty()){
		 	FileUtils fu = FileUtils.getInstance();
		 	pic = fu.writeFile(image, "image/");
		}
		
		if(pic!=null){
			pdto.setImage(pic);
		}
		
		mapper.p_insert(pdto);
	}
	
	public List<ProductDTO> p_list(){
		return mapper.p_list();
	}

	public List<MemberDTO> paging_member_keyword(PagingDTO pdto) {
		
		return mapper.paging_member_keyword(pdto);
	}
	
	public int paging_last_pageNo(PagingDTO pdto){
		int count = mapper.paging_member_count(pdto);
		int page = count/pdto.getOffset();
		if(count%pdto.getOffset()!=0){
			page+=1;
		}
		return page;
	}

	public void editProduct(ProductDTO pdto, MultipartFile file, String originalImage) {
		String pic = null;
		
		if(!file.isEmpty()){
			FileUtils fu = FileUtils.getInstance();
			pic = fu.writeFile(file, "image/");
		}
		
		if(pic!=null){
			pdto.setImage(pic);
		}else{
			pdto.setImage(originalImage);
		}
		
		mapper.editProduct(pdto);
		
	}

	public List<ProductDTO> productAllList() {
		
		return mapper.productAllList();
	}

	public List<OrderViewDTO> all_order_list() {
		return mapper.all_order_list();
	}

	public List<QnaDTO> all_Qna() {
		return mapper.all_Qna();
	}

	public void write_reply(QnaDTO qdto) {
		mapper.write_reply(qdto);
		
	}

	public void change_member_useyn(String[] memid) {
		for(int i=0;i<memid.length;i++){
			MemberDTO mdto = mapper.get_one_member(memid[i]);
			if(mdto.getUseyn()==0){
				mdto.setUseyn(1);
			}else{
				mdto.setUseyn(0);
			}
			mapper.change_member_useyn(mdto);
		}
		
	}

	
}
