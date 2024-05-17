package com.example.demo.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 값 객체(VO) 클래스를 정의
@AllArgsConstructor // 모든 필드를 매개변수로 받는 생성자를 자동으로 생성
@NoArgsConstructor // 파라미터가 없는 생성자를 자동으로 생성
@Data // Lombok을 사용해서 Getter, Setter 등을 자동으로 생성
public class GenFile {
    // 파일의 고유한 ID를 저장하는 변수
    private int id;
    // 파일의 등록일을 저장하는 변수
    private String regDate;
    // 파일의 수정일을 저장하는 변수
    private String updateDate;
    // 파일의 삭제 여부를 저장하는 변수
    private boolean delStatus;
    // 파일의 삭제일을 저장하는 변수
    private String delDate;
    // 파일의 유형 코드를 저장하는 변수
    private String typeCode;
    // 파일의 두 번째 유형 코드를 저장하는 변수
    private String type2Code;
    // 파일이 연관된 유형 코드를 저장하는 변수
    private String relTypeCode;
    // 파일이 연관된 ID를 저장하는 변수
    private int relId;
    // 파일의 확장자 유형 코드를 저장하는 변수
    private String fileExtTypeCode;
    // 파일의 두 번째 확장자 유형 코드를 저장하는 변수
    private String fileExtType2Code;
    // 파일의 크기를 저장하는 변수
    private int fileSize;
    // 파일의 순번을 저장하는 변수
    private int fileNo;
    // 파일의 확장자를 저장하는 변수
    private String fileExt;
    // 파일이 저장된 디렉토리를 저장하는 변수
    private String fileDir;
    // 파일의 원본 파일명을 저장하는 변수
    private String originFileName;

    // 파일의 실제 경로를 반환하는 메서드
    @JsonIgnore
    public String getFilePath(String genFileDirPath) {
        return genFileDirPath + getBaseFileUri();
    }

    // 파일의 기본 경로를 반환하는 메서드
    @JsonIgnore
    private String getBaseFileUri() {
        return "/" + relTypeCode + "/" + fileDir + "/" + getFileName();
    }

    // 파일의 이름을 반환하는 메서드
    public String getFileName() {
        return id + "." + fileExt;
    }

    // 클라이언트에게 보여질 URL을 반환하는 메서드
    public String getForPrintUrl() {
        return "/gen" + getBaseFileUri() + "?updateDate=" + updateDate;
    }

    // 다운로드 URL을 반환하는 메서드
    public String getDownloadUrl() {
        return "/common/genFile/doDownload?id=" + id;
    }

    // 미디어 HTML을 반환하는 메서드ㄴ
    public String getMediaHtml() {
        return "<img src=\"" + getForPrintUrl() + "\">";
    }
}
