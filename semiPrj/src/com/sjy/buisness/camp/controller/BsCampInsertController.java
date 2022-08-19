package com.sjy.buisness.camp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.kh.camplist.campinfo.vo.CampInfoVo;
import com.kh.camplist.hashtag.vo.HashTagVo;
import com.kh.camplist.service.CampListService;
import com.kh.camplist.theme.vo.ThemeVo;
import com.sjy.buisness.camp.service.BsCampService;
import com.sjy.buisness.camp.vo.BsCampVo;
import com.sjy.buisness.camp.vo.BsCampZoneVo;

@MultipartConfig(
		//fileSizeThreshold = 1024*1024, //size : byte단위
		//location = ""
		maxFileSize = 1024 * 1024 * 50 ,
		maxRequestSize = 1024 * 1024 * 50 *5
		)
@WebServlet(urlPatterns = ("/bscamp/insert"))
public class BsCampInsertController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//테마 조회
		List<ThemeVo> themeList = new CampListService().selectTheme();
		req.setAttribute("themeList", themeList);
		
		
		//해시태그 조회
		List<HashTagVo> hashTagList = new CampListService().selectHashTag(); 

		req.setAttribute("hashTagList", hashTagList);
		
		String[] hashTag = req.getParameterValues("hashTag");

		
		//시설현황 데이터 받아오기
		
		//화면 불러오기
		req.getRequestDispatcher("/views/buisness/campInsertForm.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		//캠핑장 등록정보 가져오기
		String campName = req.getParameter("campName");				//캠핑장이름
		String city = req.getParameter("city");						//주소 시/도
		String district= req.getParameter("district");				//주소 구/군
		String campDetailAdd = req.getParameter("campDetailAdd");	//상세주소
		String campPhone = req.getParameter("campPhone");			//연락처
		String campIntro = req.getParameter("campIntro");			//시설소개
		String[] f = req.getParameterValues("facility");			//시설현황
		String[] t = req.getParameterValues("theme");				//테마
		String[] h = req.getParameterValues("hashTag");				//해쉬태그
		String campRefund = req.getParameter("campRefund");			//환불규정
		String campRepImg = req.getParameter("campRepImg");
		Part mainImg = req.getPart("campRepImg");
		
		// 해시태그 맵핑테이블에 현재 입력하는 캠핑장 번호와 해쉬태그 번호 입력
		HashTagVo hashVo = new HashTagVo();
		hashVo.setHtName(campName);
		//int hashResult = new BsCampService().hashInsert(hashVo);//작업중

		
		
		// 캠핑장 정보가져온것들 insert처리하기 캠핑장 정보테이블 
		//checkbox 데이터 배열로 받은것 처리
		String facility ="";
		String theme = "";
		String hashTag = "";
		if(f != null) {
			facility = String.join(",", facility);
		}
		if(t != null) {
			theme = String.join(",", theme);
		}
		if(h != null) {
			hashTag = String.join(",", hashTag);
		}
		
		
		
        System.out.println(campName);
        System.out.println(city);
        System.out.println(district);
        System.out.println(campDetailAdd);
        System.out.println(campPhone);
        System.out.println(campIntro);
        System.out.println(facility);
        System.out.println(theme);
        System.out.println(campRefund);
        System.out.println(campRepImg);
        
        
		BsCampVo campVo = new BsCampVo(); 
        campVo.setCampName(campName);
        campVo.setCity(city);
        campVo.setDistrict(district);
        campVo.setCampAddress(campDetailAdd);
        campVo.setCampPhone(campPhone);
        campVo.setCampIntro(campIntro);
        campVo.setTheme(theme);
        //등록일 sysdate
        campVo.setCampRefund(campRefund);
        //캠핑장 테이블 insert
        int resultCamp = new BsCampService().campInsert(campVo);
        
		//캠핑장 대표이미지 넣기
		
		
		
		

		// 캠핑장 구역 정보가져오기 및 입력
		int zonNum = Integer.parseInt(req.getParameter("zonNum"))+1;//캠핑장 구역 개수 0부터
		String num = req.getParameter("zonNum");
		System.out.println("zonNum::"+zonNum);
		//캠핑장 구역개수만큼 insert시키기위한 작업
		String[] campZoneName = new String[zonNum];
		String[] maxGusests = new String[zonNum];
		String[] zoneNor = new String[zonNum];
		String[] campZonePrice = new String[zonNum];
		String[] campZoneImg = new String[zonNum];
		
		
		for (int i = 0; i < zonNum; i++) {
			 String n = Integer.toString(i);
			 System.out.println(i);
			 System.out.println("campZoneName".concat(n));
			 System.out.println("maxGusests".concat(n));
			 System.out.println("zoneNor".concat(n));
			 System.out.println("campZonePrice".concat(n));
			 System.out.println("campZoneImg".concat(n));
			 campZoneName[i] = req.getParameter("campZoneName".concat(n));
			 maxGusests[i] = req.getParameter("maxGusests".concat(n));
			 zoneNor[i] = req.getParameter("zoneNor".concat(n));
			 campZonePrice[i] = req.getParameter("campZonePrice".concat(n));
			 campZoneImg[i] = req.getParameter("campZoneImg".concat(n));
			 
			 System.out.println(campZoneName[i] );
			 System.out.println(maxGusests[i]);
			 System.out.println(zoneNor[i]);
			 System.out.println(campZonePrice[i]);
			 System.out.println( campZoneImg[i] );
			 System.out.println("--------------------------");
			 
			 
			 
		}
		//정보들  insert처리하기
		for (int i = 0; i < zonNum; i++) {
			BsCampZoneVo zoneVo = new BsCampZoneVo();
			int result = new BsCampService().campZoneInsert(zoneVo);
		}
		
		
		//모든 등록이 완료되면 화면이동
		req.getRequestDispatcher("/views/buisness/campSearchForm.jsp").forward(req, resp);
	}
	
}
