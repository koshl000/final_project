package ddit.finalproject.team2.professor.controller;

import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.transfer.TransferManager;
import com.amazonaws.services.s3.transfer.TransferManagerBuilder;
import com.amazonaws.services.s3.transfer.Upload;
import ddit.finalproject.team2.professor.service.Lsh_ILectureFileService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/professor/{lecture_code}/{class_identifying_code}/regvideo")
public class Lsh_LectureFileController {
    @Inject
    Lsh_ILectureFileService service;

    @GetMapping
    ModelAndView uploadVideoView(@PathVariable String class_identifying_code, @PathVariable String lecture_code){
        Map<String,String> map=new HashMap<>();
        map.put("class_identifying_code",class_identifying_code);
        map.put("lecture_code",lecture_code);
        map.putAll(map);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("new/regVideo");
        return mv;
    }
    @PostMapping(produces = "text/plain;charset=utf-8")
    @ResponseBody
    public String uploadVideoService(@RequestPart("vidfile") MultipartFile file, @PathVariable String lecture_code) throws IOException {
//        Map<String,String> map1=map;
        String savedName=file.getOriginalFilename();

//        File target=new File(savedName);
////        public Upload upload(String bucketName, String key, InputStream input, ObjectMetadata objectMetadata) throws AmazonServiceException, AmazonClientException {
//
//        TransferManager xfer_mgr = TransferManagerBuilder.standard().build();
//        try {
//            ObjectMetadata meta=new ObjectMetadata();
//            meta.setContentLength(file.getSize());
//            Upload xfer = xfer_mgr.upload("finalproject001/"+lecture_code, savedName, file.getInputStream(), meta);
////            service.showTransferProgress(xfer);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        return "success";
    }
}
