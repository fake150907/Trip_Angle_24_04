package com.example.demo.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.example.demo.repository.GenFileRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.GenFile;
import com.example.demo.vo.ResultData;
import com.google.common.base.Joiner;

// 파일 관련 비즈니스 로직을 담당하는 서비스 클래스
@Service
public class GenFileService {
	// application.properties에서 가져온 파일 저장 경로
	@Value("${custom.genFileDirPath}")
	private String genFileDirPath;

	@Autowired
	private GenFileRepository genFileRepository;

	// 파일 메타 정보를 저장하는 메서드
	public ResultData saveMeta(String relTypeCode, int relId, String typeCode, String type2Code, int fileNo,
			String originFileName, String fileExtTypeCode, String fileExtType2Code, String fileExt, int fileSize,
			String fileDir) {

		// 파일 메타 정보를 Map에 담아서 저장
		Map<String, Object> param = Ut.mapOf("relTypeCode", relTypeCode, "relId", relId, "typeCode", typeCode,
				"type2Code", type2Code, "fileNo", fileNo, "originFileName", originFileName, "fileExtTypeCode",
				fileExtTypeCode, "fileExtType2Code", fileExtType2Code, "fileExt", fileExt, "fileSize", fileSize,
				"fileDir", fileDir);
		genFileRepository.saveMeta(param);

		// 저장한 파일의 ID를 가져옴
		int id = Ut.getAsInt(param.get("id"), 0);
		return new ResultData("S-1", "성공하였습니다.", "id", id);
	}

	// 파일을 저장하는 메서드
	public ResultData save(MultipartFile multipartFile, String relTypeCode, int relId, String typeCode,
			String type2Code, int fileNo) {
		// 파일 입력 이름을 가져옴
		String fileInputName = multipartFile.getName();
		String[] fileInputNameBits = fileInputName.split("__");

		// 파일 입력 이름이 유효하지 않은 경우 오류 반환
		if (fileInputNameBits[0].equals("file") == false) {
			return new ResultData("F-1", "파라미터 명이 올바르지 않습니다.");
		}

		// 파일 사이즈 확인
		int fileSize = (int) multipartFile.getSize();

		// 파일 사이즈가 0 이하인 경우 오류 반환
		if (fileSize <= 0) {
			return new ResultData("F-2", "파일이 업로드 되지 않았습니다.");
		}

		// 파일명, 확장자 등의 정보 추출
		String originFileName = multipartFile.getOriginalFilename();
		String fileExtTypeCode = Ut.getFileExtTypeCodeFromFileName(multipartFile.getOriginalFilename());
		String fileExtType2Code = Ut.getFileExtType2CodeFromFileName(multipartFile.getOriginalFilename());
		String fileExt = Ut.getFileExtFromFileName(multipartFile.getOriginalFilename()).toLowerCase();

		// 파일 확장자가 jpeg인 경우 jpg로 변환
		if (fileExt.equals("jpeg")) {
			fileExt = "jpg";
		} else if (fileExt.equals("htm")) {
			fileExt = "html";
		}

		// 파일이 저장될 디렉토리 경로 생성
		String fileDir = Ut.getNowYearMonthDateStr();

		// 기존에 동일한 관련 ID를 가진 파일이 있는지 확인하고 있다면 삭제
		if (relId > 0) {
			GenFile oldGenFile = getGenFile(relTypeCode, relId, typeCode, type2Code, fileNo);

			if (oldGenFile != null) {
				deleteGenFile(oldGenFile);
			}
		}

		// 파일 메타 정보 저장
		ResultData saveMetaRd = saveMeta(relTypeCode, relId, typeCode, type2Code, fileNo, originFileName,
				fileExtTypeCode, fileExtType2Code, fileExt, fileSize, fileDir);
		int newGenFileId = (int) saveMetaRd.getBody().get("id");

		// 파일이 저장될 디렉토리 경로 생성
		String targetDirPath = genFileDirPath + "/" + relTypeCode + "/" + fileDir;
		File targetDir = new File(targetDirPath);

		// 저장할 디렉토리가 존재하지 않는 경우 생성
		if (!targetDir.exists()) {
			targetDir.mkdirs();
		}

		// 저장할 파일명 생성
		String targetFileName = newGenFileId + "." + fileExt;
		String targetFilePath = targetDirPath + "/" + targetFileName;

		// 파일 생성 (업로드된 파일을 지정된 경로로 이동)
		try {
			multipartFile.transferTo(new File(targetFilePath));
		} catch (IllegalStateException | IOException e) {
			// 파일 저장 실패 시 오류 반환
			return new ResultData("F-3", "파일저장에 실패하였습니다.");
		}

		// 파일 저장 성공 시 결과 반환
		return new ResultData("S-1", "파일이 생성되었습니다.", "id", newGenFileId, "fileRealPath", targetFilePath, "fileName",
				targetFileName, "fileInputName", fileInputName);
	}

	// 파일을 저장하는 메서드 오버로딩
	public ResultData save(MultipartFile multipartFile) {
		// 파일 입력 이름과 관련 정보 추출
		String fileInputName = multipartFile.getName();
		String[] fileInputNameBits = fileInputName.split("__");

		String relTypeCode = fileInputNameBits[1];
		int relId = Integer.parseInt(fileInputNameBits[2]);
		String typeCode = fileInputNameBits[3];
		String type2Code = fileInputNameBits[4];
		int fileNo = Integer.parseInt(fileInputNameBits[5]);

		// 위에서 정의한 다른 save 메서드를 호출하여 파일 저장
		return save(multipartFile, relTypeCode, relId, typeCode, type2Code, fileNo);
	}

	// 파일을 저장하는 메서드 오버로딩
	public ResultData save(MultipartFile multipartFile, int relId) {
		// 파일 입력 이름과 관련 정보 추출
		String fileInputName = multipartFile.getName();
		System.err.println(fileInputName);
		String[] fileInputNameBits = fileInputName.split("__");

		String relTypeCode = fileInputNameBits[1];
		String typeCode = fileInputNameBits[3];
		String type2Code = fileInputNameBits[4];
		int fileNo = Integer.parseInt(fileInputNameBits[5]);

		// 위에서 정의한 다른 save 메서드를 호출하여 파일 저장
		return save(multipartFile, relTypeCode, relId, typeCode, type2Code, fileNo);
	}

	// 특정 관련 ID와 관련된 모든 파일을 가져오는 메서드
	public List<GenFile> getGenFiles(String relTypeCode, int relId, String typeCode, String type2Code) {
		return genFileRepository.getGenFiles(relTypeCode, relId, typeCode, type2Code);
	}

	// 특정 관련 ID와 관련된 파일 중에서 특정 번호의 파일을 가져오는 메서드
	public GenFile getGenFile(String relTypeCode, int relId, String typeCode, String type2Code, int fileNo) {
		return genFileRepository.getGenFile(relTypeCode, relId, typeCode, type2Code, fileNo);
	}

	// 파일들의 메타 정보를 저장하고 파일을 업로드하는 메서드
	public ResultData saveFiles(Map<String, Object> param, MultipartRequest multipartRequest) {
		// 업로드 시작
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();

		Map<String, ResultData> filesResultData = new HashMap<>();
		List<Integer> genFileIds = new ArrayList<>();

		// 파일 업로드 및 메타 정보 저장
		for (String fileInputName : fileMap.keySet()) {
			MultipartFile multipartFile = fileMap.get(fileInputName);

			if (!multipartFile.isEmpty()) {
				ResultData fileResultData = save(multipartFile);
				int genFileId = (int) fileResultData.getBody().get("id");
				genFileIds.add(genFileId);

				filesResultData.put(fileInputName, fileResultData);
			}
		}

		// 파일 삭제 시작
		int deleteCount = 0;

		for (String inputName : param.keySet()) {
			String[] inputNameBits = inputName.split("__");

			// 삭제할 파일 정보가 있는지 확인하고 있다면 삭제
			if (inputNameBits[0].equals("deleteFile")) {
				String relTypeCode = inputNameBits[1];
				int relId = Integer.parseInt(inputNameBits[2]);
				String typeCode = inputNameBits[3];
				String type2Code = inputNameBits[4];
				int fileNo = Integer.parseInt(inputNameBits[5]);

				GenFile oldGenFile = getGenFile(relTypeCode, relId, typeCode, type2Code, fileNo);

				if (oldGenFile != null) {
					deleteGenFile(oldGenFile);
					deleteCount++;
				}
			}
		}

		// 결과 반환
		return new ResultData("S-1", "파일을 업로드하였습니다.", "filesResultData", filesResultData, "genFileIdsStr",
				Joiner.on(",").join(genFileIds), "deleteCount", deleteCount);
	}

	// 파일의 관련 ID를 변경하는 메서드
	public void changeRelId(int id, int relId) {
		genFileRepository.changeRelId(id, relId);
	}

	// 특정 관련 ID와 관련된 파일들을 삭제하는 메서드
	public void deleteGenFiles(String relTypeCode, int relId) {
		List<GenFile> genFiles = genFileRepository.getGenFilesByRelTypeCodeAndRelId(relTypeCode, relId);

		for (GenFile genFile : genFiles) {
			deleteGenFile(genFile);
		}
	}

	// 파일을 삭제하는 메서드
	private void deleteGenFile(GenFile genFile) {
		String filePath = genFile.getFilePath(genFileDirPath);
		Ut.deleteFile(filePath);

		genFileRepository.deleteFile(genFile.getId());
	}

	// 특정 ID에 해당하는 파일 정보를 가져오는 메서드
	public GenFile getGenFile(int id) {
		return genFileRepository.getGenFileById(id);
	}

	// 특정 관련 ID들과 파일 번호로 파일들을 가져와 Map으로 반환하는 메서드
	public Map<Integer, Map<String, GenFile>> getFilesMapKeyRelIdAndFileNo(String relTypeCode, List<Integer> relIds,
			String typeCode, String type2Code) {
		List<GenFile> genFiles = genFileRepository.getGenFilesRelTypeCodeAndRelIdsAndTypeCodeAndType2Code(relTypeCode,
				relIds, typeCode, type2Code);
		Map<Integer, Map<String, GenFile>> resultMap = new LinkedHashMap<>();

		for (GenFile genFile : genFiles) {
			int relId = genFile.getRelId();
			if (!resultMap.containsKey(relId)) {
				resultMap.put(relId, new LinkedHashMap			<>());
			}
			resultMap.get(relId).put(String.valueOf(genFile.getFileNo()), genFile);
		}

		return resultMap;
	}

	// 파일들의 관련 ID를 변경하는 메서드
	public void changeInputFileRelIds(Map<String, Object> param, int id) {
		String genFileIdsStr = Ut.ifEmpty((String) param.get("genFileIdsStr"), null);

		if (genFileIdsStr != null) {
			List<Integer> genFileIds = Ut.getListDividedBy(genFileIdsStr, ",");

			// 파일이 먼저 생성된 후에, 관련 데이터가 생성되는 경우에는, file의 relId가 일단 0으로 저장된다.
			// 그것을 뒤늦게라도 이렇게 고처야 한다.
			for (int genFileId : genFileIds) {
				changeRelId(genFileId, id);
			}
		}
	}

}


