package com.jaeseong.world.service;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import com.jaeseong.world.dto.MemberDTO;

@Service
public class SessionService {
	
	public MemberDTO getSession() throws Exception  {
		String name="loginuser";
		MemberDTO md = (MemberDTO)RequestContextHolder.getRequestAttributes().getAttribute(name, RequestAttributes.SCOPE_SESSION);
		if(md==null){
			return null;
		}
		else{
			return md;
		}

	}

}
