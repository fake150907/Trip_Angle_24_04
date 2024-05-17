package com.example.demo.vo;

import java.util.Map;

import com.example.demo.util.Ut;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// ResultData 클래스를 정의
@AllArgsConstructor // 모든 필드를 매개변수로 받는 생성자를 자동으로 생성
@NoArgsConstructor // 파라미터가 없는 생성자를 자동으로 생성
@Data // Lombok을 사용해서 Getter, Setter 등을 자동으로 생성
public class ResultData<DT> {

    // 결과 코드를 저장하는 변수
    private String resultCode;

    // 메시지를 저장하는 변수
    private String msg;

    // 데이터1을 저장하는 변수
    private DT data1;

    // 데이터1의 이름을 저장하는 변수
    private String data1Name;

    // 데이터2를 저장하는 변수
    private Object data2;

    // 데이터2의 이름을 저장하는 변수
    private String data2Name;

    // 결과 데이터를 저장하는 맵을 저장하는 변수
    private Map<String, Object> body;

    // 생성자를 통해 결과 코드와 메시지를 초기화하는 메서드
    public ResultData(String resultCode, String msg, Object... args) {
        this.resultCode = resultCode;
        this.msg = msg;
        this.body = Ut.mapOf(args);
    }

    // 결과 데이터를 생성하는 정적 메서드
    public static <DT> ResultData<DT> from(String resultCode, String msg) {
        return from(resultCode, msg, null, null);
    }

    // 결과 데이터를 생성하는 정적 메서드
    public static <DT> ResultData<DT> from(String resultCode, String msg, String data1Name, DT data1) {
        ResultData<DT> rd = new ResultData<DT>();
        rd.resultCode = resultCode;
        rd.msg = msg;
        rd.data1Name = data1Name;
        rd.data1 = data1;

        return rd;
    }

    // 결과 데이터를 생성하는 정적 메서드
    public static <DT> ResultData<DT> from(String resultCode, String msg, String data1Name, DT data1, String data2Name,
            DT data2) {
        ResultData<DT> rd = new ResultData<DT>();
        rd.resultCode = resultCode;
        rd.msg = msg;
        rd.data1Name = data1Name;
        rd.data1 = data1;
        rd.data2Name = data2Name;
        rd.data2 = data2;

        return rd;
    }

    // 새로운 데이터로 결과 데이터를 갱신하는 메서드
    public static <DT> ResultData<DT> newData(ResultData rd, String dataName, DT newData) {
        return from(rd.getResultCode(), rd.getMsg(), dataName, newData);
    }

    // 성공 여부를 판단하는 메서드
    public boolean isSuccess() {
        return resultCode.startsWith("S-");
    }

    // 실패 여부를 판단하는 메서드
    public boolean isFail() {
        return !isSuccess();
    }

    // 데이터2를 설정하는 메서드
    public void setData2(String data2Name, Object data2) {
        this.data2Name = data2Name;
        this.data2 = data2;
    }

}
