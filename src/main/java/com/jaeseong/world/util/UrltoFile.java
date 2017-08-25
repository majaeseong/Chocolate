package com.jaeseong.world.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;

import javax.imageio.ImageIO;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class UrltoFile {
private static UrltoFile instance;
	
	public static UrltoFile getInstance() {
		if(instance == null) {
			instance = new UrltoFile();
		}
		return instance;
	}
	
	public MultipartFile urltofile(String u) throws IOException{
		
		URL url = new URL(u);
		BufferedImage img = ImageIO.read(url);
		File file = new File("downloaded.jpg");
		ImageIO.write(img, "jpg", file);
		System.out.println("File의 크기"+file.length());
		DiskFileItem fi = (DiskFileItem) new DiskFileItemFactory().createItem("fileData", "image/jpeg", true, file.getName());

		InputStream input =  new FileInputStream(file);
        OutputStream os = fi.getOutputStream();
        int ret = input.read();
        while ( ret != -1 )
        {
            os.write(ret);
            ret = input.read();
        }
        os.flush();
        input.close();
		
	
		MultipartFile multipartFile = new CommonsMultipartFile(fi);
		
		return multipartFile;
		
	}
}
