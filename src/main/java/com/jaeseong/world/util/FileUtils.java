package com.jaeseong.world.util;

import java.io.File;
import java.io.FileOutputStream;

import org.springframework.web.multipart.MultipartFile;


public class FileUtils {
	
	private static FileUtils instance;
	
	public static FileUtils getInstance() {
		if(instance == null) {
			instance = new FileUtils();
		}
		return instance;
	}
	
	private void makeFolder(String path) {
		File dir = new File(path);
		if(!dir.isDirectory()) {
			dir.mkdirs();			
		}
	}
	
	public String writeFile(MultipartFile file, String path) {
		String targetUrl = GlobalVar.RESOURCES_PATH + path;		
		System.out.println("targetUrl : " + targetUrl);		
		makeFolder(targetUrl);
		
		String _fileNm = CommonUtils.getRandomString();
		String originFileNm = file.getOriginalFilename();
		String _extension = originFileNm.substring(originFileNm.lastIndexOf("."), originFileNm.length()).toLowerCase();
		String resultSaveDb = "";
		FileOutputStream fos = null;
		try {
			boolean isSameFileNm = true;
			
			while(isSameFileNm) {
				resultSaveDb = targetUrl + _fileNm + _extension;
				File f = new File(resultSaveDb);
				if(f.exists()) {
					_fileNm = CommonUtils.getRandomString();
				} else {
					byte fileData[] = file.getBytes();
					fos = new FileOutputStream(resultSaveDb);
					fos.write(fileData);
					isSameFileNm = false;
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(fos != null) {
				try { fos.close(); }catch(Exception e) {}
			}
		}		
		
		return _fileNm + _extension;
	}
}
