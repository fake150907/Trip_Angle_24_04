package com.example.demo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;

import com.example.demo.exception.GenFileNotFoundException;
import com.example.demo.service.GenFileService;
import com.example.demo.vo.GenFile;
import com.example.demo.vo.ResultData;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class GenFileController {
    // 파일 저장 경로를 설정하는 변수
    @Value("${custom.genFileDirPath}")
    private String genFileDirPath;

    // GenFileService 객체를 자동으로 주입 받음
    @Autowired
    private GenFileService genFileService;

    // 파일 업로드를 처리하는 메서드
    @RequestMapping("/common/genFile/doUpload")
    @ResponseBody
    public ResultData doUpload(@RequestParam Map<String, Object> param, MultipartRequest multipartRequest) {
        return genFileService.saveFiles(param, multipartRequest);
    }

    // 파일 다운로드를 처리하는 메서드
    @GetMapping("/common/genFile/doDownload")
    public ResponseEntity<Resource> downloadFile(int id, HttpServletRequest request) throws IOException {
        GenFile genFile = genFileService.getGenFile(id);

        // 파일이 존재하지 않으면 예외 발생
        if (genFile == null) {
            throw new GenFileNotFoundException();
        }

        // 파일 경로 설정
        String filePath = genFile.getFilePath(genFileDirPath);

        // 파일의 Resource 객체 생성
        Resource resource = new InputStreamResource(new FileInputStream(filePath));

        // 파일의 MIME 타입 설정
        String contentType = request.getServletContext().getMimeType(new File(filePath).getAbsolutePath());
        if (contentType == null) {
            contentType = "application/octet-stream";
        }

        // 다운로드 응답 생성
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + genFile.getOriginFileName() + "\"")
                .contentType(MediaType.parseMediaType(contentType)).body(resource);
    }

    // 파일 표시를 처리하는 메서드
    @GetMapping("/common/genFile/file/{relTypeCode}/{relId}/{typeCode}/{type2Code}/{fileNo}")
    public ResponseEntity<Resource> showFile(HttpServletRequest request, @PathVariable String relTypeCode,
            @PathVariable int relId, @PathVariable String typeCode, @PathVariable String type2Code,
            @PathVariable int fileNo) throws FileNotFoundException {
        GenFile genFile = genFileService.getGenFile(relTypeCode, relId, typeCode, type2Code, fileNo);

        // 파일이 존재하지 않으면 예외 발생
        if (genFile == null) {
            throw new GenFileNotFoundException();
        }

        // 파일 경로 설정
        String filePath = genFile.getFilePath(genFileDirPath);
        // 파일의 Resource 객체 생성
        Resource resource = new InputStreamResource(new FileInputStream(filePath));

        // 파일의 MIME 타입 설정
        String contentType = request.getServletContext().getMimeType(new File(filePath).getAbsolutePath());
        if (contentType == null) {
            contentType = "application/octet-stream";
        }

        // 파일 표시 응답 생성
        return ResponseEntity.ok().contentType(MediaType.parseMediaType(contentType)).body(resource);
    }
}
