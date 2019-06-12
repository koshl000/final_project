package ddit.finalproject.team2.professor.service;


import com.amazonaws.services.s3.transfer.MultipleFileUpload;
import com.amazonaws.services.s3.transfer.Transfer;
import ddit.finalproject.team2.vo.VideoFileVo;

public interface Lsh_ILectureFileService {
    void waitForCompletion(Transfer xfer);
    void showTransferProgress(Transfer xfer);
    void showMultiUploadProgress(MultipleFileUpload multi_upload);
    void printProgressBar(double pct);
    void eraseProgressBar();
}
