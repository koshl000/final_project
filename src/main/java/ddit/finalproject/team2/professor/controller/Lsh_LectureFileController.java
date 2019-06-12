package ddit.finalproject.team2.professor.controller;

import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.transfer.TransferManager;
import com.amazonaws.services.s3.transfer.TransferManagerBuilder;
import com.amazonaws.services.s3.transfer.Upload;
import ddit.finalproject.team2.professor.service.Lsh_ILectureFileService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
public class Lsh_LectureFileController {
    @Inject
    Lsh_ILectureFileService service;

    @GetMapping("/professor/{lecture_code}/{class_identifying_code}/regvideo")
    ModelAndView uploadVideoView(@PathVariable String class_identifying_code, @PathVariable String lecture_code){
        Map<String,String> map=new HashMap<>();
        map.put("class_identifying_code",class_identifying_code);
        map.put("lecture_code",lecture_code);
        map.putAll(map);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("new/regVideo");
        return mv;
    }
    @PostMapping("/professor/${lecture_code}/${class_identifying_code}/regvideo")
    public void uploadVideoService(MultipartFile file) throws IOException {
//        Map<String,String> map1=map;
        String savedName=file.getOriginalFilename();

        File target=new File(savedName);
//        public Upload upload(String bucketName, String key, InputStream input, ObjectMetadata objectMetadata) throws AmazonServiceException, AmazonClientException {

        TransferManager xfer_mgr = TransferManagerBuilder.standard().build();
        try {
            ObjectMetadata meta=new ObjectMetadata();
            meta.setContentLength(file.getSize());
//            Upload xfer = xfer_mgr.upload("finalproject001/"+lecture_code, savedName, file.getInputStream(), meta);
//            service.showTransferProgress(xfer);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
