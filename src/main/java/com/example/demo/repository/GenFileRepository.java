package com.example.demo.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.vo.GenFile;

@Mapper
public interface GenFileRepository {

    /**
     * 파일정보 insert를 위한 메소드
     * GenFileRepository.xml에서 세부 내용 확인 가능
     */
    void saveMeta(Map<String, Object> param);

    /**
     * 특정 조건에 해당하는 파일 정보를 가져오기 위한 메소드
     * GenFileRepository.xml에서 세부 내용 확인 가능
     * 
     * @param relTypeCode 릴레이션 타입 코드
     * @param relId       릴레이션 ID
     * @param typeCode    유형 코드
     * @param type2Code   유형2 코드
     * @param fileNo      파일 번호
     * @return 파일 정보
     */
    GenFile getGenFile(@Param("relTypeCode") String relTypeCode, @Param("relId") int relId,
            @Param("typeCode") String typeCode, @Param("type2Code") String type2Code, @Param("fileNo") int fileNo);

    /**
     * ID를 기반으로 파일 정보를 가져오는 메소드
     * GenFileRepository.xml에서 세부 내용 확인 가능
     * 
     * @param id 파일 ID
     * @return 파일 정보
     */
    GenFile getGenFileById(@Param("id") int id);

    /**
     * 파일의 릴레이션 ID를 변경하는 메소드
     * GenFileRepository.xml에서 세부 내용 확인 가능
     * 
     * @param id    파일 ID
     * @param relId 릴레이션 ID
     */
    void changeRelId(@Param("id") int id, @Param("relId") int relId);

    /**
     * 특정 조건에 해당하는 파일들을 삭제하기 위한 메서드
     * GenFileRepository.xml에서 세부 내용 확인 가능
     * 
     * @param relTypeCode 릴레이션 타입 코드
     * @param relId       릴레이션 ID
     */
    void deleteFiles(@Param("relTypeCode") String relTypeCode, @Param("relId") int relId);

    /**
     * 특정 조건에 해당하는 파일 목록을 가져오기 위한 메서드
     * GenFileRepository.xml에서 세부 내용 확인 가능
     * 
     * @param relTypeCode 릴레이션 타입 코드
     * @param relId       릴레이션 ID
     * @param typeCode    유형 코드
     * @param type2Code   유형2 코드
     * @return 파일 목록
     */
    List<GenFile> getGenFiles(@Param("relTypeCode") String relTypeCode, @Param("relId") int relId,
            @Param("typeCode") String typeCode, @Param("type2Code") String type2Code);

    /**
     * 특정 릴레이션 타입 코드와 관련 ID를 기반으로 파일 목록을 가져오기 위한 메서드
     * GenFileRepository.xml에서 세부 내용 확인 가능
     * 
     * @param relTypeCode 릴레이션 타입 코드
     * @param relId       릴레이션 ID
     * @return 파일 목록
     */
    List<GenFile> getGenFilesByRelTypeCodeAndRelId(@Param("relTypeCode") String relTypeCode,
            @Param("relId") int relId);

    /**
     * 특정 ID를 기반으로 파일을 삭제하기 위한 메서드.
     * GenFileRepository.xml에서 세부 내용 확인 가능
     * 
     * @param id 파일 ID
     */
    void deleteFile(@Param("id") int id);

    /**
     * 특정 조건에 해당하는 파일 목록을 가져오기 위한 메서드
     * GenFileRepository.xml에서 세부 내용 확인 가능
     * 
     * @param relTypeCode 릴레이션 타입 코드
     * @param relIds      릴레이션 ID들
     * @param typeCode    유형 코드
     * @param type2Code   유형2 코드
     * @return 파일 목록
     */
    List<GenFile> getGenFilesRelTypeCodeAndRelIdsAndTypeCodeAndType2Code(@Param("relTypeCode") String relTypeCode,
            @Param("relIds") List<Integer> relIds, @Param("typeCode") String typeCode,
            @Param("type2Code") String type2Code);
}