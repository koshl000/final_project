package ddit.finalproject.team2.common.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class ImageUploadController {
	@Inject
	WebApplicationContext container;
	
	@Value("#{appInfo['boardImages']}")
	String boardSaveUrl;
	
	@Value("#{appInfo['assignmentImages']}")
	String assignmentSaveUrl;
	
	File saveFolder;
	
	
	@PostMapping(value="/{type}/imageUpload", produces="application/json;charset=UTF-8")
	public Map<String, Object> imageUpload(@PathVariable String type, @RequestPart(required=true) MultipartFile upload){
		String realPath = null;
		String saveUrl = null;
		if("board".equals(type)){
			realPath = container.getServletContext().getRealPath(boardSaveUrl);
			saveUrl = boardSaveUrl;
		}else if("assignment".equals(type)){
			realPath = container.getServletContext().getRealPath(assignmentSaveUrl);
			saveUrl = assignmentSaveUrl;
		}
		saveFolder = new File(realPath);
		if(!saveFolder.exists()) saveFolder.mkdirs();
		
		String saveName = UUID.randomUUID().toString();
		Map<String, Object> resultMap = new HashMap<>();
		
		try(
			InputStream is = upload.getInputStream();
		){
			FileUtils.copyInputStreamToFile(is, new File(saveFolder, saveName));
			resultMap.put("fileName", upload.getOriginalFilename());
			resultMap.put("uploaded", 1);
			resultMap.put("url", container.getServletContext().getContextPath()+saveUrl+"/"+saveName);
		}catch(IOException e){
			Map<String, Object> error = new HashMap<>();
			error.put("number", 500);
			error.put("message", e.getMessage());
			resultMap.put("error", error);
		}
		
		return resultMap;
	}
}
