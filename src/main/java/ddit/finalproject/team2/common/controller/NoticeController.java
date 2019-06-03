package ddit.finalproject.team2.common.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ddit.finalproject.team2.common.service.Ljs_INoticeService;
import ddit.finalproject.team2.util.AuthorityUtil;
import ddit.finalproject.team2.util.constant.AuthConstants;
import ddit.finalproject.team2.util.enumpack.BrowserType;
import ddit.finalproject.team2.vo.AttachmentVo;
import ddit.finalproject.team2.vo.Ljs_BoardVo;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	@Inject
	Ljs_INoticeService noticeService;
	
	@GetMapping("download/{attachment_no}")
	public String download(@PathVariable String attachment_no
		, @RequestHeader(name="User-Agent") String userAgent
		, HttpServletResponse resp) throws IOException {
		
		AttachmentVo attach = noticeService.downloadAttachment(attachment_no);
		String savePath = attach.getFile_path();
		String filename = attach.getFile_name();
		
		BrowserType brType = BrowserType.matchedType(userAgent);
		if(BrowserType.IE.equals(brType) || BrowserType.TRIDENT.equals(brType)){
			filename = URLEncoder.encode(filename, "UTF-8");
		}else{
			filename = new String(filename.getBytes(), "ISO-8859-1");
		}
		
		File saveFile = new File(savePath);
		if(!saveFile.exists()){
			resp.sendError(404);
			return null;
		}
		
		resp.setHeader("Content-Disposition", "attachment;filename=\""+filename+"\"");
		
		try(
			InputStream is = new FileInputStream(saveFile);
			OutputStream os = resp.getOutputStream();
		){
			IOUtils.copy(is, os);
		}
		return null;
	}
	
	@GetMapping("{notice_no}")
	public ModelAndView goBoardView(@PathVariable String notice_no, ModelAndView mv, Authentication au){
		List<String> authorities = AuthorityUtil.getAuthorityList(au);
		if(authorities.contains(AuthConstants.ROLE_STUDENT)){
			mv.setViewName("student/noticeDetail");
		}else if(authorities.contains(AuthConstants.ROLE_PROFESSOR)){
			mv.setViewName("professor/noticeDetail");
		}else {
			mv.setViewName("admin/noticeDetail");
		}
		List<Ljs_BoardVo> notices = noticeService.retrieveNotice(notice_no);
		mv.getModel().put("notices", notices);
		mv.getModel().put("notice_no", notice_no);
		
		return mv;
	}
}
