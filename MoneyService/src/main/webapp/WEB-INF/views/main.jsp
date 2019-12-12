<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>국가지원금 안내</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style>
        * {
            /* border: 1px solid black;*/
        }

        p {
            margin: 1px;
            margin-top: 13px;
        }
        
        p.tip {
        text-align: center;
        background-color: #D8D8D8;
        
        }

        header {
            text-align: center;
        }

        h3 {
            text-align: center;
            background-color: rgba(0, 255, 0, 0.3);
        }
        
        h3#title {/* 제목 */
            background-color: #F781F3;
            font-size: 100px;
            margin: 20px;
            padding: 5px auto;
            background-image:url('${rootPath}/images/maxresdefault (1).jpg') no-repeat 95% 50%;
    
        }
        
        h3#necessary{ /* 필수입력 */
         background-color: red;
         
        }
        
        span.star {/* 필수입력 별표 */
        color : red;
        font-size : 15px;
        text-align: center;
        margin: 2px;
        padding: 1px;
        }
        
        span.Dselection { /* 중복선택가능 글자 */
        color : blue;
        
        }

        header p {
            margin: 1px;
        }

        select {
            
        }

        input[type="checkbox"],[type="radio"] {
            position: relative;
            width: 18px;
            height: 18px;
            top: 3px;
            margin-right: 5px;
        }

        body {
            width: 978px;
            margin: auto;
        }

        .search {
            display: flex;
        }

        #btn-search {
            margin: 10px auto;
            padding: 10px 50px;
        }


    </style>
    <script>
            $(function() {
                $("#btn-search").click(function() {
                    let city = $("#city").val()
                    let district = $("#district").val()

                    if(city == "") {
                        alert("시/도를 선택하세요")
                        $("#city").focus()
                        return false
                    } else if(district == "") {
                        alert("시/군/구를 선택하세요")
                        $("#district").focus()
                        return false
                    } else if($("input[name='foreigner']:checked").length < 1) {
                        alert("내국인/외국인 여부를 선택하세요")
                        $("#fr1").focus()
                        return false
                    } else if($("input:radio[name='gagu']:checked").length < 1) {
                        alert("가구주/가구원 여부를 선택하세요")
                        $("#gagu1").focus()
                        return false
                    } else if($("input:radio[name='house']:checked").length < 1) {
                        alert("주택보유 여부를 선택하세요")
                        $("#house1").focus()
                        return false
                    } else if($("input[name='house']").val() == "보유" && $("input:checkbox[name='house_a']:checked").length < 1) {
                        alert("주택 보유 선택시 주거유형을 선택해야 합니다")
                        $("#house_a_1").focus()
                        return false
                    }

                    $("form").submit()
                })
            })
        </script>
</head>
<body>
    
    <header>
        <h3 id="title">국가지원금 안내</h3>
        <p class="tip">입력한 정보를 기준으로 받을 수 있는 지원금을 계산합니다</p>
        <p class="tip">입력한 정보는 어디에도 저장되지 않고 계산을 위한 조건값으로만 사용되며</p>
        <p class="tip">조건값이 많을수록 검색 결과의 정확도가 올라갑니다</p>
    </header>

    <form method="POST">
        <br/>
        <h3 id="necessary">- 필수입력 -</h3>
        <p>1. 현재 거주하는 지역을 선택하세요<span class="star">*</span></p>
        <select name="city" class="city">
            <option value="" selected="selected">시/도</option>
            <option value="강원도">강원도</option>
            <option value="경기도">경기도</option>
            <option value="경상남도">경상남도</option>
            <option value="경상북도">경상북도</option>
            <option value="광주광역시">광주광역시</option>
            <option value="대구광역시">대구광역시</option>
            <option value="대전광역시">대전광역시</option>
            <option value="부산광역시">부산광역시</option>
            <option value="서울특별시">서울특별시</option>
            <option value="세종특별자치시">세종특별자치시</option>
            <option value="울산광역시">울산광역시</option>
            <option value="인천광역시">인천광역시</option>
            <option value="전라남도">전라남도</option>
            <option value="전라북도">전라북도</option>
            <option value="제주특별자치도">제주특별자치도</option>
            <option value="충청남도">충청남도</option>
            <option value="충청북도">충청북도</option>
        </select>

        <select name="district" class="district">
            <option value="">시/군/구</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="2">3</option>
        </select>

        <p>2. 내국인이신가요? 외국인이신가요?<span class="star">*</span></p>
        <div class="foreigner">
            <input type="radio" name="foreigner" value="내국인" id="fr1"><label for="fr1">내국인</label>
            <input type="radio" name="foreigner" value="외국인" id="fr2"><label for="fr2">외국인</label>
        </div>

        <p>3. 등본상 가구주이신가요?<span class="star">*</span></p>
        <div class="gagu">
            <input type="radio" name="gagu" value="가구주" id="gagu1"><label for="gagu1">가구주</label>
            <input type="radio" name="gagu" value="가구원" id="gagu2"><label for="gagu2">가구원</label>
        </div>

        <p>4. 주택을 보유중이신가요?<span class="star">*</span></p>
        <div class="house">
            <input type="radio" name="house" value="보유" id="house1"><label for="house1">보유</label>
            <input type="radio" name="house" value="미보유" id="house2"><label for="house2">미보유</label>
        </div>

        <p>4-1. (주택 보유 선택시) 주거유형을 선택하세요. <span class="Dselection">(중복선택가능)</span><span class="star">*</span></p>
        <div class="house_a">
            <input type="hidden" name="house_a" value="dummy">
            <input type="checkbox" name="house_a" id="house_a_1" value="house_a_1"><label for="house_a_1">전세</label>
            <input type="checkbox" name="house_a" id="house_a_2" value="house_a_2"><label for="house_a_2">월세</label>
            <input type="checkbox" name="house_a" id="house_a_3" value="house_a_3"><label for="house_a_3">공공(임대)주택</label>
            <input type="checkbox" name="house_a" id="house_a_4" value="house_a_4"><label for="house_a_4">무상임대</label>
            <input type="checkbox" name="house_a" id="house_a_5" value="house_a_5"><label for="house_a_5">보장기관 제공주거(시설입소)</label>
            <input type="checkbox" name="house_a" id="house_a_6" value="house_a_6"><label for="house_a_6">기타</label>
        </div>

        <br/>
        <br/>
        <h3>- 선택입력 -</h3>
        <p class="tip">밑에 있는 정보들은 입력하지 않아도 검색이 가능하지만, 결과의 정확도가 낮아질 수 있습니다</p>
        <br/>
        <p>5. 재학중이신가요?</p>
        <div class="hak">
            <input type="radio" name="hak" value="어린이집" id="hak1"><label for="hak1">어린이집</label>
            <input type="radio" name="hak" value="유치원" id="hak2"><label for="hak2">유치원</label>
            <input type="radio" name="hak" value="초등학교" id="hak3"><label for="hak3">초등학교</label>
            <input type="radio" name="hak" value="중학교" id="hak4"><label for="hak4">중학교</label>
            <input type="radio" name="hak" value="고등학교" id="hak5"><label for="hak5">고등학교</label>
            <input type="radio" name="hak" value="대학교" id="hak6"><label for="hak6">대학교</label>
            <input type="radio" name="hak" value="대학원" id="hak7"><label for="hak7">대학원</label>
            <input type="radio" name="hak" value="국립특수학교" id="hak8"><label for="hak8">국립특수학교</label>
            <input type="radio" name="hak" value="기타" id="hak9"><label for="hak9">기타</label>
        </div>

        <p>6. 사업자,근로자,취업준비생/창업예정자/구직자 중 해당하는 부분이 있으신가요? <span class="Dselection">(중복선택가능)</span></p>
        <div class="job1">
            <input type="hidden" name="job1" value="dummy">
            <input type="checkbox" name="job1" id="job1_1" value="사업자"><label for="job1_1">사업자</label>
            <input type="checkbox" name="job1" id="job1_2" value="근로자"><label for="job1_2">근로자</label>
            <input type="checkbox" name="job1" id="job1_3" value="취업준비생/창업예정자/구직자"><label for="job1_3">취업준비생/창업예정자/구직자</label>
        </div>

        <p>6-1. (사업자 선택시) 지원형태를 선택하세요. <span class="Dselection">(중복선택가능)</span></p>
        <div class="job1_a">
            <input type="hidden" name="job1_a" value="dummy">
            <input type="checkbox" name="job1_a" id="job1_a_1" value="고용지원"><label for="job1_a_1">고용지원(고용안정, 고용축진, 고용연장에 대한 지원)</label>
            <input type="checkbox" name="job1_a" id="job1_a_2" value="운영지원"><label for="job1_a_2">운영지원(사업운영, 일반운영 등에 대한 지원)</label><br/>
            <input type="checkbox" name="job1_a" id="job1_a_3" value="훈련지원"><label for="job1_a_3">훈련지원(근로자의 근로능력, 자활 등에 대한 교육/훈련 지원)</label>
            <input type="checkbox" name="job1_a" id="job1_a_4" value="환경지원"><label for="job1_a_4">환경지원(시설, 장비, 설비 설치 및 설치비 지원, 안전지원)</label>
        </div>

        <p>7. (정년)퇴직자,중장기복무제대군인 중 해당하는 부분이 있으신가요? <span class="Dselection">(중복선택가능)</span></p>
        <div class="job2">
            <input type="hidden" name="job2" value="dummy">
            <input type="checkbox" name="job2" id="job2_1" value="퇴직자"><label for="job2_1">(정년)퇴직자</label>
            <input type="checkbox" name="job2" id="job2_2" value="중장기복무제대군인"><label for="job2_2">중장기복무제대군인</label>
        </div>

        <p>8. 장애유무를 선택하세요</p>
        <div class="disorder">
            <input type="radio" name="disorder" value="어린이집" id="disorder1"><label for="disorder1">있음</label>
            <input type="radio" name="disorder" value="유치원" id="disorder2"><label for="disorder2">없음</label>
        </div>

        <p>8-1. (장애유무 선택시) 장애유형을 선택하세요. <span class="Dselection">(중복선택가능)</span></p>
        <div class="disorder_a">
            <input type="hidden" name="disorder_a" value="dummy">
            <input type="checkbox" name="disorder_a" id="disorder_a_1" value="지체장애"><label for="disorder_a_1">지체장애</label>
            <input type="checkbox" name="disorder_a" id="disorder_a_2" value="뇌병변장애"><label for="disorder_a_2">뇌병변장애</label>
            <input type="checkbox" name="disorder_a" id="disorder_a_3" value="시각장애"><label for="disorder_a_3">시각장애</label>
            <input type="checkbox" name="disorder_a" id="disorder_a_4" value="청각장애"><label for="disorder_a_4">청각장애</label>
            <input type="checkbox" name="disorder_a" id="disorder_a_5" value="언어장애"><label for="disorder_a_5">언어장애</label>
            <input type="checkbox" name="disorder_a" id="disorder_a_6" value="안면장애"><label for="disorder_a_6">안면장애</label>
            <input type="checkbox" name="disorder_a" id="disorder_a_7" value="신장장애"><label for="disorder_a_7">신장장애</label>
            <input type="checkbox" name="disorder_a" id="disorder_a_8" value="심장장애"><label for="disorder_a_8">심장장애</label><br/>
            <input type="checkbox" name="disorder_a" id="disorder_a_9" value="간장애"><label for="disorder_a_9">간장애</label>
            <input type="checkbox" name="disorder_a" id="disorder_a_10" value="장루.요루장애"><label for="disorder_a_10">장루.요루장애</label>
            <input type="checkbox" name="disorder_a" id="disorder_a_11" value="뇌전증"><label for="disorder_a_11">뇌전증</label>
            <input type="checkbox" name="disorder_a" id="disorder_a_12" value="호흡기장애"><label for="disorder_a_12">호흡기장애</label>
            <input type="checkbox" name="disorder_a" id="disorder_a_13" value="지적장애"><label for="disorder_a_13">지적장애</label>
            <input type="checkbox" name="disorder_a" id="disorder_a_14" value="자폐성장애"><label for="disorder_a_14">자폐성장애</label>
            <input type="checkbox" name="disorder_a" id="disorder_a_16" value="정신장애"><label for="disorder_a_15">정신장애</label>
        </div>

        <p>8-2. (장애유무 선택시) 장애유형을 선택하세요. <span class="Dselection">(중복선택가능)</span></p>
        <div class="disorder_b">
            <input type="hidden" name="disorder_b" value="dummy">
            <input type="checkbox" name="disorder_b" id="disorder_b_1" value="disorder_b_1"><label for="disorder_b_1">중증장애(장애인연금 신청가능대상자)</label>
            <input type="checkbox" name="disorder_b" id="disorder_b_2" value="disorder_b_2"><label for="disorder_b_2">비등록 장애인</label><br/>
            <input type="checkbox" name="disorder_b" id="disorder_b_3" value="disorder_b_3"><label for="disorder_b_3">장애정도가 심한 장애인</label>
            <input type="checkbox" name="disorder_b" id="disorder_b_4" value="disorder_b_4"><label for="disorder_b_4">장애정도가 심하지 않은 장애인</label>
        </div>

        <p>9. 질병유무를 선택하세요. <span class="Dselection">(중복선택가능)</span></p>
        <div class="disease">
            <input type="hidden" name="disease" value="dummy">
            <input type="checkbox" name="disease" id="disease1" value="disease1"><label for="disease1">희귀 난치성, 중증질환(암, 심장병, 뇌질환, 희귀난치성 질환 등 중증질환)</label><br/>
            <input type="checkbox" name="disease" id="disease2" value="disease2"><label for="disease2">중증질환 외 질병(만성질환자, 당뇨, 고혈압, 결핵, 선천성대사이상, 치매(파킨슨) 등)</label>
        </div>

        <p>10. 건강상태를 선택하세요. <span class="Dselection">(중복선택가능)</span></p>
        <div class="health">
            <input type="hidden" name="health" value="dummy">
            <input type="checkbox" name="health" id="health1" value="health1"><label for="health1">임산부및출산(임산부, 출산한 사람 또는 출산 예정인 사람, 출산을 원하는 사람)</label><br/>
            <input type="checkbox" name="health" id="health2" value="health2"><label for="health2">(장기)요양환자(장기요양, 요양성환자)</label>
        </div>

        <p>11. 보훈대상을 선택하세요. <span class="Dselection">(중복선택가능)</span></p>
        <div class="bohun">
            <input type="hidden" name="bohun" value="dummy">
            <input type="checkbox" name="bohun" id="bohun1" value="bohun1"><label for="bohun1">5.18민주유공자(5·18민주화운동사망자(행방불명자), 5·18민주화운동부상자, 5·18민주화운동희생자)</label><br/>
            <input type="checkbox" name="bohun" id="bohun2" value="bohun2"><label for="bohun2">고엽제후유(의)증(고엽제환자(월남전참전, 국내전방복무), 고엽제2세환자, 고엽제후유증환자가족(유족))</label><br/>
            <input type="checkbox" name="bohun" id="bohun3" value="bohun3"><label for="bohun3">국가유공자</label><br/>
            <input type="checkbox" name="bohun" id="bohun4" value="bohun4"><label for="bohun4">독립유공자(순국선열, 애국지사, 독립유공자손자녀, 유족)</label><br/>
            <input type="checkbox" name="bohun" id="bohun5" value="bohun5"><label for="bohun5">보훈보상 대상자</label><br/>
            <input type="checkbox" name="bohun" id="bohun6" value="bohun6"><label for="bohun6">참전 유공자(6ㆍ25참전 재일학도 의용군인, 참전유공자)</label><br/>
            <input type="checkbox" name="bohun" id="bohun7" value="bohun7"><label for="bohun7">특수임무 유공자(특수임무사망자·행방불명자, 특수임무부상자, 특수임무공로자)</label><br/>
        </div>

        <p>12. 위기상황을 선택하세요. <span class="Dselection">(중복선택가능)</span></p>
        <div class="danger">
            <input type="hidden" name="danger" value="dummy">
            <input type="checkbox" name="danger" id="danger1" value="danger1"><label for="danger1">폭력(가정,성매매,성폭력,학교)/타인의범죄로인한피해/학대</label>
            <input type="checkbox" name="danger" id="danger2" value="danger2"><label for="danger2">가출/실종/사망,사고</label><br/>
            <input type="checkbox" name="danger" id="danger3" value="danger3"><label for="danger3">이혼(예정)</label>
            <input type="checkbox" name="danger" id="danger4" value="danger4"><label for="danger4">재해(자연재해/화재피해)</label>
            <input type="checkbox" name="danger" id="danger5" value="danger5"><label for="danger5">학교밖청소년</label>
            <input type="checkbox" name="danger" id="danger6" value="danger6"><label for="danger6">실직</label>
            <input type="checkbox" name="danger" id="danger7" value="danger7"><label for="danger7">기타</label>
        </div>

        <p>13. 피해상황을 선택하세요. <span class="Dselection">(중복선택가능)</span></p>
        <div class="damage">
            <input type="hidden" name="damage" value="dummy">
            <input type="checkbox" name="damage" id="damage1" value="damage1"><label for="damage1">산업재해 피해자 및 가족(업무상의 사유에 따른 근로자의 부상, 질병, 장해 또는 사망을 의미 (진폐장애, 분진작업근로자 포함))</label><br/>
            <input type="checkbox" name="damage" id="damage2" value="damage2"><label for="damage2">일제 강점기 피해자(사할린한인(가족), 일본군위안부피해자, 원폭피해자 및 유족)</label><br/>
            <input type="checkbox" name="damage" id="damage3" value="damage3"><label for="damage3">특수상황 피해자(석면피해(특별유족), 한센인피해자, 전후납북피해자, 의사상자 및 유족, 의사자의 장제를 행한자)</label><br/>
            <input type="checkbox" name="damage" id="damage4" value="damage4"><label for="damage4">기타</label>
        </div>

        <p>14. 그 외 상황을 선택하세요. <span class="Dselection">(중복선택가능)</span></p>
        <div class="etc">
            <input type="hidden" name="etc" value="dummy">
            <input type="checkbox" name="etc" id="etc1" value="etc1"><label for="etc1">북한이탈주민</label>
            <input type="checkbox" name="etc" id="etc2" value="etc2"><label for="etc2">입양</label>
            <input type="checkbox" name="etc" id="etc3" value="etc3"><label for="etc3">가정위탁</label>
        </div>

        <p>15. 건강보험료를 입력하세요</p>
        [ ▼ 국민건강보험공단 건강보험료 조회 링크 (클릭시 새 창에서 열림) ]
        <br/><a href="https://minwon.nhis.or.kr/menu/retriveMenuSet.xx?menuId=MENU_WBMCA09" target="_new">https://minwon.nhis.or.kr/menu/retriveMenuSet.xx?menuId=MENU_WBMCA09</a>
        <div class="nhis">
            <select name="nhis1" id="region">
                <option value="" selected="selected">선택</option>
                <option value="의료급여수급권자">의료급여수급권자</option>
                <option value="직장가입자">직장가입자</option>
                <option value="지역가입자">지역가입자</option>
                <option value="피부양자직장">피부양자(직장)</option>
                <option value="피부양자지역">피부양자(지역)</option>
            </select>

            <input name="nhis2"> 원
        </div>

        <p>16. 근로/사업소득(월평균)을 입력하세요</p>
        <div class="income1">
            본인 <input name="income1" id="income1"> 원
        </div>

        <p>17. 그 외 소득(월평균)을 입력하세요</p>
        <div class="income2">
            본인 <input name="income2" id="income2"> 원
        </div>

        <p>18. 주거용 재산을 입력하세요</p>
        <p>- 거주를 목적으로 하는 주택, 부속토지 등의 금액</p>
        <div class="property1">
            본인 <input name="property1" id="property1"> 원
        </div>

        <p>19. 주거 외 재산을 입력하세요</p>
        <p>- 주거용 목적 이외의 주택, 건물, 시설물, 토지, 임차보증금의 금액</p>
        <div class="property2">
            본인 <input name="property2" id="property2"> 원
        </div>

        <p>20. 금융재산을 입력하세요</p>
        <p>- 현금, 수표, 어음, 주식, 국공채 등 유가증권, 예금, 적금, 부금, 보험, 수익증권 등의 총 금액</p>
        <div class="property3">
            본인 <input name="property3" id="property3"> 원
        </div>

        <p>21. 부채금액을 입력하세요</p>
        <p>- 금융기관 대출금, 공증된 사채 등으로 차용한 금액 중 미상환액</p>
        <div class="debt">
            본인 <input name="debt" id="debt"> 원
        </div>
        <div class="search">
            <button id="btn-search" type="button">검색</button>
        </div>
    </form>
</body>
</html>