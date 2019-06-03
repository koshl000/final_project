package ddit.finalproject.team2.admin.controller.sync;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ddit.finalproject.team2.admin.service.Jch_SmsService;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.Jch_SMSGroupVo;
import ddit.finalproject.team2.vo.Jch_SMSVo;
import ddit.finalproject.team2.vo.Jch_UnitGroupVo;
import ddit.finalproject.team2.vo.Jch_UserVo;
import ddit.finalproject.team2.vo.SMSGroupVo;
import ddit.finalproject.team2.vo.UnitGroupVo;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@RequestMapping("/sms")
public class SmsManageController {

	final String API_KEY = "NCSDR0AKHFXQMT3W";
	final String API_SECRET = "7OJVF4K8TVLAO80YYKK8XWNZIOCESX8R";
	
	@Inject
	Jch_SmsService smsService;
	
	@GetMapping("smsGroupList")
	public ModelAndView smsGroupList(ModelAndView mv){
		mv.setViewName("admin/smsGroupList");
		return mv;
	}
	
	@GetMapping("smsSendList")
	public ModelAndView smsSendList(ModelAndView mv){
		mv.setViewName("admin/smsSendList");
		return mv;
	}
	
	@GetMapping("smsGroupListRedirect")
	public ModelAndView smsGroupListRedirect(ModelAndView mv){
		mv.setViewName("/admin/smsGroupList");
		return mv;
	}
	
	/*
	 * 논리적 뷰네임 ex)admin/smsGroupList 로 보내면 servlet-context에서 order1을 준 TilesViewResolver가 캐치 ==> tiles를 포함한 jsp반환
	 * 		tiles-def를 안타게하려면 InternalResourceViewResolver를 타게 한다. ==>/admin/smsGroupList
	 * 		/admin 앞의 /는  dispatchServlet을 타면서 //를 /로 변환
	 */
	@GetMapping("smsGroupForm")
	public ModelAndView smsGroupFormApply(ModelAndView mv){
		mv.setViewName("/admin/smsGroupForm");
		return mv;
	}
	
	@GetMapping(value="getUserList", produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, List<Jch_UserVo>> getUserList() {
		Map<String, List<Jch_UserVo>> map = new HashMap<>();
		List<Jch_UserVo> userList = smsService.selectUserList();
		
		map.put("data", userList);
		return map;
	}
	
	@GetMapping(value="getSmsGroupList", produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, List<Jch_SMSGroupVo>> getSmsGroupList() {
		Map<String, List<Jch_SMSGroupVo>> map = new HashMap<>();
		List<Jch_SMSGroupVo> groupList = smsService.getSmsGroupList();
		
		map.put("data", groupList);
		return map;
	}
	
	@GetMapping(value="getSmsSendList", produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, List<Jch_SMSVo>> getSmsSendList() {
		Map<String, List<Jch_SMSVo>> map = new HashMap<>();
		List<Jch_SMSVo> groupList = smsService.getSmsSendList();
		
		map.put("data", groupList);
		return map;
	}
	
	@PostMapping(value="smsGroupAdd")
	public String smsGroupAdd(@RequestBody Map<String, String> params, HttpServletRequest request) {
		String view = null;
		
	    
	    String smsgroup_name = params.get("smsgroup_name");
	    if(smsgroup_name!=null) {
	    	params.remove("smsgroup_name");
	    }
	    
	    SMSGroupVo sgVo = new SMSGroupVo();
	    sgVo.setSmsgroup_name(smsgroup_name);
	    ServiceResult result = smsService.smsGroupAdd(sgVo);
	    
	    String returnGroupNo = null;
	    List<Jch_UserVo> studId_list = new ArrayList<Jch_UserVo>();
	    
	    //value를 list에 담기
//	    List<String> studHp_list = new ArrayList<String>(params.values());
	    
	    if(ServiceResult.OK.equals(result)) {
	    	returnGroupNo = sgVo.getSmsgroup_no();
	    	for(Entry<String, String> entry: params.entrySet()) {
				String id = entry.getKey();
				Jch_UserVo vo = new Jch_UserVo(id);
				studId_list.add(vo);
			}
	    	Jch_SMSGroupVo jsgVO = new Jch_SMSGroupVo(returnGroupNo, studId_list);
		    ServiceResult result2 = smsService.smsGroupDetailAdd(jsgVO);
		    if (ServiceResult.OK.equals(result2)) {
		    	view = "redirect:smsGroupList";
			} else {
				view = "sms/smsGroupForm";
			}
	    }
	    return view;
	}
	
	@PostMapping(value="smsGroupUpdate")
	public String smsGroupUpdate(@RequestBody Map<String, String> params, HttpServletRequest request) {
		String view = null;
		System.out.println(params.toString());
		
		String smsgroup_name = params.get("smsgroup_name");
		if(smsgroup_name!=null) {
			params.remove("smsgroup_name");
		}
		String smsgroup_no = params.get("smsgroup_no");
		if(smsgroup_name!=null) {
			params.remove("smsgroup_no");
		}
		
		//unit그룹 삭제
		ServiceResult result = smsService.getUnitGroupDelete(smsgroup_no);
		Jch_SMSGroupVo updateVo = new Jch_SMSGroupVo();
		updateVo.setSmsgroup_no(smsgroup_no);
		updateVo.setSmsgroup_name(smsgroup_name);
		ServiceResult groupNameUpdateResult = smsService.groupNameUpdate(updateVo);
		
		List<Jch_UserVo> studId_list = new ArrayList<Jch_UserVo>();
		for(Entry<String, String> entry: params.entrySet()) {
			String id = entry.getKey();
			Jch_UserVo vo = new Jch_UserVo(id);
			studId_list.add(vo);
		}
		Jch_SMSGroupVo jsgVO = new Jch_SMSGroupVo();
		jsgVO.setSmsgroup_no(smsgroup_no);
		jsgVO.setSmsgroup_list(studId_list);
		ServiceResult result2 = smsService.smsGroupDetailAdd(jsgVO);
		if (ServiceResult.OK.equals(result2)) {
			view = "redirect:smsGroupList";
		} else {
			view = "sms/smsGroupForm";
		}
		return view;
	}
	
	@GetMapping("smsGroupUpdate")
	public ModelAndView smsGroupUpdsteApply(String no, ModelAndView mv){
		List<UnitGroupVo> unitGroupList = smsService.getUnitGroupList(no);
		mv.addObject("list", unitGroupList);
		mv.setViewName("/admin/smsGroupForm");
		return mv;	
	}
	
	@GetMapping("smsGroupDelete")
	public ModelAndView smsGroupDelete(String no, ModelAndView mv){
		ServiceResult result = smsService.getGroupDelete(no);
		mv.setViewName("/admin/smsGroupList");
		return mv;	
	}
	
	@GetMapping("groupSendList")
	public ModelAndView groupSendList(String no, ModelAndView mv){
		ArrayList<UnitGroupVo> unitSendGroupList = (ArrayList<UnitGroupVo>) smsService.getUnitGroupList(no);
		mv.addObject("sendlist", unitSendGroupList);
		mv.setViewName("/admin/smsGroupSend");
		return mv;	
	}
	
	@GetMapping("groupSendListRe")
	public ModelAndView groupSendListRe(ModelAndView mv){
		mv.setViewName("admin/smsSendList");
		return mv;	
	}
	
	@PostMapping("smsSendSubmit")
	public String smsSendSubmit(@RequestBody Map<String, Object> param) {
		String view = null;
		String msg = (String) param.get("msg");
		String no = (String) param.get("no");
		String msgType = (String) param.get("msgType");
		String msgDate = (String) param.get("msgDate");
		String msgGroupName = (String) param.get("msgGroupName");
		String group_id = "";
	    
		List<Jch_UnitGroupVo> hpList = smsService.getUsersHp(no);
		String sendResult = "발송완료";
		for(Jch_UnitGroupVo vo : hpList) {
			//문자SMS
			Message coolsms = new Message(API_KEY, API_SECRET);
			HashMap<String, String> params = new HashMap<String, String>();
			params.put("to", vo.getUser_hp()); // 수신번호
			params.put("from", "01099409824"); // 발신번호
			params.put("type", "SMS"); // Message type ( SMS, LMS, MMS, ATA )
			params.put("text", "[Abnormals]\r\n"+msg); // 문자내용
			if(msgType.equals("예약발송")) {
				System.out.println("예약발송입니다!");
				params.put("app_version", "test app 1.2"); // application name and version
				params.put("datetime", msgDate); // Format must be(YYYYMMDDHHMISS) 2016-02-21 15:00:00
			}
			try {
				JSONObject obj = (JSONObject) coolsms.send(params);
				group_id = (String) obj.get("group_id");
				System.out.println(group_id);
				System.out.println(obj.toString());
				view = "redirect:smsGroupList";
			} catch (CoolsmsException e) {
				System.out.println(e.getMessage());
				System.out.println(e.getCode());
				view = "admin/smsGroupSend";
				sendResult = "발송실패";
			}
		}
		if(!msgDate.contains("-")) {
			StringBuffer sb = new StringBuffer(msgDate);
			sb.insert(4, "-");
			sb.insert(7, "-");
			sb.insert(10, " ");
			sb.insert(13, ":");
			sb.insert(16, ":");
			msgDate = sb.toString();
		}
		
		System.out.println("\n===================================================== 초기값 " + msgDate);
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date to = new Date();
		try {
			to = transFormat.parse(msgDate);
			System.out.println("\n===================================================== 여긴됨? " + to.toString());
		} catch (ParseException e) {
			e.printStackTrace();
			System.out.println("\n===================================================== 파스 안되냥안됨");
		}
		msgDate = transFormat.format(to);

		System.out.println("●■■■■■■■msgDate : " +msgDate);
		Jch_SMSVo smsVo = new Jch_SMSVo(sendResult, msgGroupName, msg, no, msgType, msgDate, group_id);
		ServiceResult result = smsService.insertSms(smsVo);
		if (ServiceResult.OK.equals(result)) {
			view = "sms/smsSendList";
		} else {
			view = "sms/groupSendList";
		}
		return view;
	}
	
	@GetMapping("smsSendCancle")
	public ModelAndView smsSendCancle(String no, ModelAndView mv) {
		String view = null;
		System.out.println(no);
		
		Message coolsms = new Message(API_KEY, API_SECRET);

	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("group_id", no); // group id

	    try {
	      JSONObject obj = (JSONObject) coolsms.cancel(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	    
		mv.setViewName("admin/smsSendList");
		return mv;	
	}
	
}
