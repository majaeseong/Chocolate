package com.jaeseong.world.util;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Service;

@Service
public class GlobalVar implements InitializingBean {
	
	public static String CONTEXT_PATH = "";
	public static String RESOURCES_PATH = "";
	public static String IMG_PATH = "/world/resources/image/";
	
	@Override
	public void afterPropertiesSet() throws Exception {		
		String classPath = this.getClass().getResource("/").getPath(); 
		System.out.println("classPath : " + classPath);
		CONTEXT_PATH = classPath.substring(0, classPath.lastIndexOf("WEB-INF"));
		System.out.println("context_path : " + CONTEXT_PATH);
		
		RESOURCES_PATH = CONTEXT_PATH + "resources/";
		
	}

}
