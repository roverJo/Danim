package org.kosta.finalproject.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.finalproject.model.service.AdminService;
import org.kosta.finalproject.model.service.BestFoodService;
import org.kosta.finalproject.model.service.LodgeService;
import org.kosta.finalproject.model.vo.food.BestFoodVO;
import org.kosta.finalproject.model.vo.food.FileVO;
import org.kosta.finalproject.model.vo.food.MenuVO;
import org.kosta.finalproject.model.vo.lodge.LodgePictureVO;
import org.kosta.finalproject.model.vo.lodge.LodgeVO;
import org.kosta.finalproject.model.vo.member.MemberListVO;
import org.kosta.finalproject.model.vo.member.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	@Resource
	private AdminService adminService;
	@Resource
	private BestFoodService bestFoodService;
	@Resource
	private LodgeService lodgeService;
	@Resource(name = "uploadFoodShopPath")
	private String uploadFoodShopPath;
	@Resource(name = "uploadFoodMenuPath")
	private String uploadFoodMenuPath;
	@Resource(name = "uploadLodgePicPath")
	private String uploadLodgePicPath;

	@RequestMapping("admin_login.do")
	public String adminLogin(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		if (vo.getAdmin() == 0) {
			return "home";
		}
		return "admin_admin_login";
	}

	@RequestMapping("admin_member.do")
	public ModelAndView adminMember(String pageNo) {
		MemberListVO lvo = adminService.memberList(pageNo);
		return new ModelAndView("admin_admin_member", "lvo", lvo);
	}

	@RequestMapping("admin_popup.do")
	public ModelAndView memberPup(String id) {
		return new ModelAndView("admin/admin_member_popup", "id", id);
	}

	@RequestMapping("admin_checkPass.do")
	public ModelAndView checkPass(HttpServletRequest request, String id,
			String password) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession(false);
		MemberVO vo = (MemberVO) session.getAttribute("mvo");
		vo.setPassword(password);
		int check = adminService.checkPass(vo);
		mv.setViewName("admin/admin_member_popup_result");
		mv.addObject("check", check);
		mv.addObject("id", id);
		return mv;
	}

	// 회원탈퇴
	@RequestMapping("admin_delete.do")
	public String deleteMember(String id) {
		// 삭제순서
		// replycomment - > commcomment - > commLike -> community
		// notice - > combinecart - > message - > member
		adminService.deleteReplyCommentById(id);
		adminService.deleteCommCommentById(id);
		adminService.deleteCommLikeById(id);
		adminService.deleteCommunityById(id);
		adminService.deleteNoticeById(id);
		adminService.deleteCombineCartById(id);
		adminService.deleteMessageById(id);
		adminService.deleteMember(id);
		return "redirect:admin_member.do";
	}

	@RequestMapping("admin_appoint.do")
	public ModelAndView appointMember() {
		List<MemberVO> list = adminService.adminList();
		return new ModelAndView("admin_admin_appoint", "list", list);
	}

	@RequestMapping("findJSONAdmin.do")
	@ResponseBody
	public List<MemberVO> findNickCheck(String administer, String inputVal) {
		List<MemberVO> list = null;
		if (administer.equals("id")) {
			list = adminService.memberById(inputVal);
		} else if (administer.equals("nickname")) {
			list = adminService.memberByNick(inputVal);
		}
		return list;
	}

	@RequestMapping("admin_appointMember.do")
	public ModelAndView adminAppoint(String appoint) {
		MemberVO vo = adminService.checkMemberId(appoint);
		if (vo.getAdmin() == 0) {
			adminService.appointAdmin(appoint);
		} else {
			vo = null;
		}
		return new ModelAndView("admin_admin_appoint_result", "vo", vo);
	}

	@RequestMapping("admin_fireAdmin.do")
	public String fireAdmin(String id) {
		adminService.fireAdmin(id);
		return "redirect:admin_appoint.do";
	}

	// 정보관리 페이지로 이동
	@RequestMapping("admin_informationManagement.do")
	public ModelAndView movePage() {
		return new ModelAndView("admin_admin_informationManagement");
	}

	// 음식 관리 (음식점 추가, 메뉴추가, 메뉴 수정)
	@RequestMapping("admin_foodmanagement.do")
	public ModelAndView foodManageMentInfo() {
		return new ModelAndView("adminpage_food_infoManagement");
	}

	// 음식점 추가하는 페이지로 이동
	@RequestMapping("admin_foodmanagementRegi.do")
	public ModelAndView foodManagement() {
		return new ModelAndView("adminpage_food_management");
	}

	// 음식점 추가
	@RequestMapping(value = "foodshopregister.do", method = RequestMethod.POST)
	public ModelAndView foodShopRegister(BestFoodVO bestFoodVO) {
		List<BestFoodVO> foodshoplist = bestFoodService.allFoodShop();
		// 동일 지역에 같은 이름, 주소의 음식점이 있을 경우 가입이 안되도록 한다.
		for (int i = 0; i < foodshoplist.size(); i++) {
			if (foodshoplist.get(i).getDetailarea_name()
					.equals(bestFoodVO.getDetailarea_name())) {
				if (foodshoplist.get(i).getShopname()
						.equals(bestFoodVO.getShopname())) {
					if (foodshoplist.get(i).getShop_add()
							.equals(bestFoodVO.getShop_add())) {
						return new ModelAndView("adminpage_register_fail");
					}
				}
			}
		}

//		System.out.println(bestFoodVO);

		MultipartFile file = bestFoodVO.getUploadFile();// 파일

		// 확장자 jsp 나 png 등의 사진파일 뒤 .xxx 의 확장자를 추출
		String extension = file.getOriginalFilename().substring(
				file.getOriginalFilename().lastIndexOf(".") + 1);
		// 지정할 사진파일의 이름
		String main_menu_picture = "";
		// 새로 지정한 사진파일의 이름 등록
		// ex) 맛집의 세부위치+지역구위치+맛집의이름+확장자
		main_menu_picture = bestFoodVO.getDetailarea_name() + "_"
				+ bestFoodVO.getLocal_area() + "_" + bestFoodVO.getShopname()
				+ "_main." + extension;

		if (file.isEmpty() == false) {
			// System.out.println("파일명:"+file.getOriginalFilename());
			// 여기에 파일이 들어온거
			File uploadFile = new File(uploadFoodShopPath + main_menu_picture);
			try {
				file.transferTo(uploadFile); // 실제 디렉토리로 파일을 저장한다
				System.out.println(uploadFoodShopPath + "에 파일업로드");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		bestFoodVO.setMain_menu_picture(main_menu_picture);
		bestFoodService.foodShopRegister(bestFoodVO);
		return new ModelAndView("adminpage_foodshop_find");
	}

	// 음식점 검색(음식점 수정)
	@RequestMapping("foodshopfind3.do")
	public ModelAndView foodshopfind3(BestFoodVO bestFoodVO) {
		bestFoodVO = bestFoodService.foodshopfind(bestFoodVO);
		// System.out.println(bestFoodVO);
		if (bestFoodVO == null) {
			return new ModelAndView("adminpage_foodfind_fail");
		}
//		System.out.println(bestFoodVO);
		return new ModelAndView("adminpage_food_shop_update", "fvo", bestFoodVO);
	}

	// 메뉴 추가할 음식점 검색
	@RequestMapping("foodshopfind.do")
	public ModelAndView foodshopfind(BestFoodVO bestFoodVO) {
		ModelAndView mv = new ModelAndView();

		bestFoodVO = bestFoodService.foodshopfind(bestFoodVO);

		// System.out.println(bestFoodVO);
		if (bestFoodVO == null) {
			mv.setViewName("adminpage_foodfind_fail");
			return mv;
		}

		List<MenuVO> menuList = bestFoodService.findMenu(bestFoodVO
				.getFoodshop_no());
		if (menuList.size() == 4) {
			mv.setViewName("adminpage_menu_register_fail");
		} else {
			mv.setViewName("adminpage_food_menu_register");
			mv.addObject("fvo", bestFoodVO);
			mv.addObject("menuList", menuList);
		}
		return mv;
	}

	// 메뉴 추가할 음식점 검색2(메뉴수정)
	@RequestMapping("foodshopfind2.do")
	public ModelAndView foodshopfind2(BestFoodVO bestFoodVO) {
		ModelAndView mv = new ModelAndView();
		// 여기서는 bestFoodVO에 값을 찾고
		bestFoodVO = bestFoodService.foodshopfind(bestFoodVO);

		// System.out.println(bestFoodVO);
		if (bestFoodVO == null) {
			mv.setViewName("adminpage_foodfind_fail");
			
		} else {
			// 그 음식점의 메뉴값들을 찾는다.
			List<MenuVO> menuList = bestFoodService.findMenu(bestFoodVO
					.getFoodshop_no());
			mv.setViewName("adminpage_food_menu_update");
			mv.addObject("fvo", bestFoodVO);
			mv.addObject("menuList", menuList);
		}
		return mv;
	}

	// 메뉴 추가
	@RequestMapping(value = "foodmenu_multi_fileupload.do", method = RequestMethod.POST)
	public ModelAndView foodmenu_multi_fileupload(String food_list,
			String price_list, MenuVO menuVO, FileVO fileVO) {

		List<MultipartFile> list = fileVO.getFile();
		ArrayList<String> nameList = new ArrayList<String>();

		// 넘어온 리스트 마지막 문자 , 를 자른다
		String foodmenuList = food_list.substring(0, food_list.length() - 1);
		String foodprice = price_list.substring(0, price_list.length() - 1);
		// 넘어온 리스트 문자를 , 기준으로 나눠서 배열에 저장한다
		String[] food_name = foodmenuList.split(",");
		String[] price = foodprice.split(",");

		// 추가할 메뉴의 음식점 정보를 받기 위하여 사용
		BestFoodVO bestFoodVO = new BestFoodVO();
		bestFoodVO = bestFoodService.foodShopFindByNo(menuVO.getFoodshop_no());

		for (int i = 0; i < list.size(); i++) {
			// 만약 업로드 파일이 없으면 파일명은 공란처리된다
			String food_picture = "";
			food_picture = bestFoodVO.getDetailarea_name() + "_"
					+ bestFoodVO.getLocal_area() + "_"
					+ bestFoodVO.getShopname() + "_menu."
					+ list.get(i).getOriginalFilename();

			// 업로드 파일이 있으면 파일을 특정경로로 업로드한다
			// if(!food_picture.equals("")){
			if (food_picture.endsWith(".") == false) {
				try {
					list.get(i).transferTo(
							new File(uploadFoodMenuPath + food_picture));
					nameList.add(food_picture);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		for (int i = 0; i < nameList.size(); i++) {
			menuVO.setFood_picture(nameList.get(i));
			menuVO.setFood_name(food_name[i]);
			menuVO.setPrice(Integer.parseInt(price[i]));
			bestFoodService.foodMenuRegister(menuVO);
		}
		return new ModelAndView("adminpage_food_menu_register_result");
	}

	// 메뉴 수정(동시에 여러 메뉴 수정)
	@RequestMapping(value = "food_menu_update_list.do", method = RequestMethod.POST)
	public ModelAndView food_name_list(String food_list, String menuNo_list,
			String price_list, MenuVO menuVO, FileVO fileVO) {
		// public ModelAndView food_name_list(MenuVO menuVO){
		List<MultipartFile> list = fileVO.getFile();
		// view 화면에 업로드 된 파일 목록을 전달하기 위한 리스트
		ArrayList<String> nameList = new ArrayList<String>();

		BestFoodVO bestFoodVO = new BestFoodVO();
		bestFoodVO = bestFoodService.foodShopFindByNo(menuVO.getFoodshop_no());
		/*
		 * System.out.println("음식점 피케이"+bestFoodVO.getFoodshop_no());
		 * System.out.println("넘어온 푸드 리스트"+food_list);
		 * System.out.println("넘어온 메뉴 PK 리스트"+menuNo_list);
		 * System.out.println("넘어온 가격 리스트"+price_list);
		 */
		// 넘어온 리스트 마지막 문자 , 를 자른다
		String foodmenuList = food_list.substring(0, food_list.length() - 1);
		String foodmenuPk = menuNo_list.substring(0, menuNo_list.length() - 1);
		String foodprice = price_list.substring(0, price_list.length() - 1);
		// 넘어온 리스트 문자를 , 기준으로 나눠서 배열에 저장한다
		String[] food_name = foodmenuList.split(",");
		String[] menu_no = foodmenuPk.split(",");
		String[] price = foodprice.split(",");

		for (int i = 0; i < list.size(); i++) {
			// 만약 업로드 파일이 없으면 파일명은 공란처리된다
			// String fileName=list.get(i).getOriginalFilename();
			String food_picture = "";
			food_picture = bestFoodVO.getDetailarea_name() + "_"
					+ bestFoodVO.getLocal_area() + "_"
					+ bestFoodVO.getShopname() + "_menu."
					+ list.get(i).getOriginalFilename();
			// 업로드 파일이 있으면 파일을 특정경로로 업로드한다
			if (!food_picture.equals("")) {
				try {
					list.get(i).transferTo(
							new File(uploadFoodMenuPath + food_picture));

					nameList.add(food_picture);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		// 업로드된 파일 리스트의 이름들을 DB로 저장 ( 파일명,메뉴이름,가격 디비로 저장)
		for (int i = 0; i < nameList.size(); i++) {
			if (nameList.get(i).endsWith(".") == true) {
				menuVO.setMenu_no(Integer.parseInt(menu_no[i]));
				menuVO.setFood_name(food_name[i]);
				menuVO.setPrice(Integer.parseInt(price[i]));
				bestFoodService.menuUpdateExcludePicture(menuVO);
			} else {
				menuVO.setFood_picture(nameList.get(i));
				menuVO.setMenu_no(Integer.parseInt(menu_no[i]));
				menuVO.setFood_name(food_name[i]);
				menuVO.setPrice(Integer.parseInt(price[i]));
				bestFoodService.menuUpdate(menuVO);
			}
		}
		return new ModelAndView("adminpage_food_menu_update_result");
	}

	// 숙박
	// 숙박 관리 (숙박 추가, 숙박 사진 추가, 숙박 사진 수정)
	@RequestMapping("admin_lodgemanagement.do")
	public ModelAndView lodgeManageMentInfo() {
		return new ModelAndView("adminpage_lodge_infoManagement");
	}

	// 숙박 추가하는 페이지로 이동
	@RequestMapping("admin_lodgemanagementRegi.do")
	public ModelAndView lodgeManagement() {
		return new ModelAndView("adminpage_lodge_management");
	}

	// 숙박 추가
	@RequestMapping("lodgeshopregister.do")
	public ModelAndView lodgeShopRegister(LodgeVO lodgeVO) {
		List<LodgeVO> lodgeshoplist = lodgeService.allFindLodge();
		// 동일 지역에 같은 이름, 주소의 음식점이 있을 경우 가입이 안되도록 한다.
		for (int i = 0; i < lodgeshoplist.size(); i++) {
			if (lodgeshoplist.get(i).getArea_name()
					.equals(lodgeVO.getArea_name())) {
				if (lodgeshoplist.get(i).getDetailarea_name()
						.equals(lodgeVO.getDetailarea_name())) {
					if (lodgeshoplist.get(i).getShopname()
							.equals(lodgeVO.getShopname())) {
						return new ModelAndView("adminpage_lodgeregister_fail");
					}
				}
			}
		}

		lodgeService.lodgeRegister(lodgeVO);
		return new ModelAndView("adminpage_lodgeshop_find");
	}

	// 사진 추가할 숙박 찾기
	@RequestMapping("lodgefind.do")
	public ModelAndView lodgefind(LodgeVO lodgeVO) {
		ModelAndView mv = new ModelAndView();
		
		lodgeVO = lodgeService.lodgefind(lodgeVO);
		if (lodgeVO == null) {
			mv.setViewName("adminpage_lodgefind_fail");
			return mv;
		}
		
		List<LodgePictureVO> lodgePicList=lodgeService.lodge_findPic(lodgeVO.getLodge_no());
		
		if(lodgePicList.size()==4){
			mv.setViewName("adminpage_lodge_picRegi_fail");
		}else{
			mv.setViewName("adminpage_lodge_picture_register");
			mv.addObject("lvo",lodgeVO);
			mv.addObject("lodgePicList",lodgePicList);
		}
		
		return mv;
	}

	// 사진 추가할 숙박 찾기
	@RequestMapping("lodgefind3.do")
	public ModelAndView lodgefind3(LodgeVO lodgeVO) {
		lodgeVO = lodgeService.lodgefind(lodgeVO);
		if (lodgeVO == null) {
			return new ModelAndView("adminpage_lodgefind_fail");
		}

		return new ModelAndView("adminpage_lodge_shop_update", "lvo", lodgeVO);
	}

	// 사진 등록
	@RequestMapping(value = "lodgepicture_fileupload.do", method = RequestMethod.POST)
	public ModelAndView lodgepicture_fileupload(LodgePictureVO lodgePictureVO, FileVO fileVO,LodgeVO lodgeVO) {
		List<LodgePictureVO> Llist = lodgeService.findLodgeAllPicture(lodgePictureVO);
		List<MultipartFile> list = fileVO.getFile();
		ArrayList<String> picList = new ArrayList<String>();
		
		
		
		for (int i = 0; i < list.size(); i++) {
			// 만약 업로드 파일이 없으면 파일명은 공란처리된다
			String picture_name = "";
			String first_picName = "";
			String mid_pic = "";
			
			if(list.size()==4){
				if (i == 0) {
					mid_pic = "a";
				} else if (i == 1) {
					mid_pic = "b";
				} else if (i == 2) {
					mid_pic = "c";
				} else if (i == 3) {
					mid_pic = "d";
				}
			}else if(list.size()==3){
				if (i == 0) {
					mid_pic = "b";
				} else if (i == 1) {
					mid_pic = "c";
				} else if (i == 2) {
					mid_pic = "d";
				}
			}else if(list.size()==2){
				if (i == 0) {
					mid_pic = "c";
				} else if (i == 1) {
					mid_pic = "d";
				}
			}else if(list.size()==1){
				if (i == 0) {
					mid_pic = "d";
				}
			}
			
			// 확장자 jsp 나 png 등의 사진파일 뒤 .xxx 의 확장자를 추출
			String extension = list
					.get(i).getOriginalFilename().substring(list.get(i).getOriginalFilename().lastIndexOf(".") + 1);
			
			if (lodgeVO.getLodgetype().equals("게스트하우스")) {
				first_picName = "guest" + lodgePictureVO.getLodge_no();
			} else {
				first_picName = "room" + lodgePictureVO.getLodge_no();
			}

			picture_name = first_picName + "_" + mid_pic + "." + extension;
			// 업로드 파일이 있으면 파일을 특정경로로 업로드한다
			//if (picList.get(i).endsWith("_") == true)
			//if (!picture_name.equals("")) {
			if(picture_name.endsWith(".")==false){
				try {
					list.get(i).transferTo(new File(uploadLodgePicPath + picture_name));
					picList.add(picture_name);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		for (int i = 0; i < picList.size(); i++) {
			lodgePictureVO.setPicture_name(picList.get(i));
			lodgeService.lodgeResiPic(lodgePictureVO);
		}

		return new ModelAndView("adminpage_lodge_picRegi_result");
	}

	// 숙박찾기2(사진 수정)
	@RequestMapping("lodgefind2.do")
	public ModelAndView lodgefind2(LodgeVO lodgeVO) {
		ModelAndView mv = new ModelAndView();
		lodgeVO = lodgeService.lodgefind(lodgeVO);
		if (lodgeVO == null) {
			mv.setViewName("adminpage_lodgefind_fail");
		} else {
			List<LodgePictureVO> lodgePicList = lodgeService
					.lodge_findPic(lodgeVO.getLodge_no());
			mv.setViewName("adminpage_lodge_pic_update");
			mv.addObject("lodgeVO", lodgeVO);
			mv.addObject("lodgePicList", lodgePicList);
			System.out.println(lodgePicList);
		}
		return mv;
	}

	// 사진 수정(멀티 업데이트)
	@RequestMapping(value = "lodge_pic_update_list.do", method = RequestMethod.POST)
	public ModelAndView lodge_pic_update_list(String LodgePicNo_list,
			LodgePictureVO lodgePictureVO, FileVO fileVO, LodgeVO lodgeVO) {

		List<MultipartFile> list = fileVO.getFile();
		ArrayList<String> picList = new ArrayList<String>();

		String LodgePicNolist = LodgePicNo_list.substring(0,
				LodgePicNo_list.length() - 1);
		String[] picture_no = LodgePicNolist.split(",");
		System.out.println(LodgePicNolist);
//		System.out.println(picture_no);
		for (int i = 0; i < list.size(); i++) {
			// 만약 업로드 파일이 없으면 파일명은 공란처리된다
			String picture_name = "";
			String first_picName = "";
			String mid_pic = "";
			if (i == 0) {
				mid_pic = "a";
			} else if (i == 1) {
				mid_pic = "b";
			} else if (i == 2) {
				mid_pic = "c";
			} else if (i == 3) {
				mid_pic = "d";
			}
			// 확장자 jsp 나 png 등의 사진파일 뒤 .xxx 의 확장자를 추출
			String extension = list
					.get(i)
					.getOriginalFilename()
					.substring(
							list.get(i).getOriginalFilename().lastIndexOf(".") + 1);
			if (lodgeVO.getLodgetype().equals("게스트하우스")) {
				first_picName = "guest" + lodgePictureVO.getLodge_no();
			} else {
				first_picName = "room" + lodgePictureVO.getLodge_no();
			}

			// picture_name=lodgePictureVO.getLodge_no()+"_"+list.get(i).getOriginalFilename();
			picture_name = first_picName + "_" + mid_pic + "." + extension;
			// 업로드 파일이 있으면 파일을 특정경로로 업로드한다
			if (!picture_name.equals("")) {
				try {
					list.get(i).transferTo(
							new File(uploadLodgePicPath + picture_name));

					picList.add(picture_name);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		System.out.println(picList);
		for (int i = 0; i < picList.size(); i++) {
			if (picList.get(i).endsWith("_") == true) {
				lodgePictureVO.setPicture_no(Integer.parseInt(picture_no[i]));
				lodgeService.lodgePic_ExcludePicupdate(lodgePictureVO);
			} else {
				lodgePictureVO.setPicture_name(picList.get(i));
				lodgePictureVO.setPicture_no(Integer.parseInt(picture_no[i]));
				lodgeService.lodgePic_update(lodgePictureVO);
			}
		}
		return new ModelAndView("adminpage_lodge_pic_update_result");
	}

	// 음식점 수정
	@RequestMapping("foodshopupdate.do")
	public ModelAndView foodshopupdate(BestFoodVO bestFoodVO) {

		MultipartFile file = bestFoodVO.getUploadFile();// 파일

		// 확장자 jsp 나 png 등의 사진파일 뒤 .xxx 의 확장자를 추출
		String extension = file.getOriginalFilename().substring(
				file.getOriginalFilename().lastIndexOf(".") + 1);
		// 지정할 사진파일의 이름
		String main_menu_picture = "";
		// 새로 지정한 사진파일의 이름 등록
		// ex) 맛집의 세부위치+지역구위치+맛집의이름+확장자
		main_menu_picture = bestFoodVO.getDetailarea_name() + "_"
				+ bestFoodVO.getLocal_area() + "_" + bestFoodVO.getShopname()
				+ "_main." + extension;

		if (file.isEmpty() == false) {
			// System.out.println("파일명:"+file.getOriginalFilename());
			// 여기에 파일이 들어온거
			File uploadFile = new File(uploadFoodShopPath + main_menu_picture);
			try {
				file.transferTo(uploadFile); // 실제 디렉토리로 파일을 저장한다
				System.out.println(uploadFoodShopPath + "에 파일업로드");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		if (main_menu_picture.endsWith(".") == true) {

			bestFoodService.foodshopupdateExcludePic(bestFoodVO);

		} else {

			bestFoodVO.setMain_menu_picture(main_menu_picture);
			bestFoodService.foodshopupdate(bestFoodVO);

		}

		return new ModelAndView("adminpage_food_shop_update_result");
	}

	// 숙박 수정
	@RequestMapping("lodgeshopupdate.do")
	public ModelAndView lodgeshopupdate(LodgeVO lodgeVO) {
		lodgeService.lodgeshopupdate(lodgeVO);

		return new ModelAndView("adminpage_lodge_shop_update_result");
	}

}
