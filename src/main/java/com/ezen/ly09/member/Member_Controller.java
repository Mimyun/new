package com.ezen.ly09.member;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class Member_Controller {
	@Autowired
	SqlSession sqlSession;
	String path = "C:\\이젠디지탈12\\spring\\spring_framework\\src\\main\\webapp\\image\\";
	
	@RequestMapping(value = "/member_input")
	public String member_input() {
		return "member_input";
	}
	@ResponseBody
	@RequestMapping(value = "/idcheck")
	public String idcheck(HttpServletRequest request) {
		String id = request.getParameter("id");
		String result = "";
		
		Member_Service sv = sqlSession.getMapper(Member_Service.class);
		String check = sv.idcheck(id);
		if(check==null) result = "ok";
		else result = "no";
		
		return result;
	}
	@RequestMapping(value = "/member_save")
	public String member_save(MultipartHttpServletRequest request) throws IllegalStateException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3");
		String sex = request.getParameter("sex");
		String add = request.getParameter("add");
		String [] hobby_li = request.getParameterValues("hobby");
		String hobby = "";
		for (int i = 0; i < hobby_li.length; i++){
			if(i!=hobby_li.length-1) hobby += hobby_li[i]+",";
			else hobby += hobby_li[i];
		}
		String hello = request.getParameter("hello");
		MultipartFile mf = request.getFile("image");
		UUID uuid = UUID.randomUUID();
		String image = uuid.toString()+mf.getOriginalFilename();
		mf.transferTo(new File(path+image));
		
		Member_Service sv = sqlSession.getMapper(Member_Service.class);
		sv.member_input(id,pw,name,tel,sex,add,hobby,hello,image);
		
		return "redirect:member_input";
	}
	@RequestMapping(value = "/member_list")
	public String member_list(HttpServletRequest request, HttpServletResponse response, Model mo) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		HttpSession hs = request.getSession();
		PrintWriter w = response.getWriter();
		boolean login_state = (boolean)hs.getAttribute("login_state");
		
		Member_Service sv = sqlSession.getMapper(Member_Service.class);
		ArrayList<Member_DTO> list = sv.member_list();
		
		if(login_state==true) {
			mo.addAttribute("list", list);
		}
		else {
			w.write("<script>alert('권한이없습니다 로그인후 이용하십시오');location.href='member_login';</script>");
			w.flush();
			w.close();
		}
		return "member_list";
	}
	@RequestMapping(value = "/member_login")
	public String member_login() {
		return "member_login";
	}
	@RequestMapping(value = "/member_login_check")
	public String member_login_check(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter w = response.getWriter();
		
		Member_Service sv = sqlSession.getMapper(Member_Service.class);
		String user_id = sv.idcheck(id);
		String user_pw = sv.pwcheck(id, pw);
		
		if (user_id == null) {
			w.write("<script>alert('존재하지 않는 ID');history.go(-1);</script>");
			w.flush();
			w.close();
		}
		else if (user_pw == null) {
			w.write("<script>alert('패스워드가 틀렸습니다');history.go(-1);</script>");
			w.flush();
			w.close();
		}
		else {
			HttpSession hs = request.getSession();
			hs.setAttribute("login_state", true);
			hs.setAttribute("user_id", user_id);
			hs.setMaxInactiveInterval(6000);
		}
		
		return "redirect:./";
	}
	@RequestMapping(value = "/member_logout")
	public String member_logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession hs = request.getSession();
		hs.setAttribute("login_state", false);
		PrintWriter w = response.getWriter();
		response.setContentType("text/html; charset=UTF-8");
		w.write("<script>alert('로그아웃되었습니다');location.href='./';</script>");
		w.flush();
		w.close();
		return "redirect:./";
	}
	@RequestMapping(value = "/member_view")
	public String member_view(HttpServletRequest request, Model mo) {
		String id = request.getParameter("id");
		
		Member_Service sv = sqlSession.getMapper(Member_Service.class);
		Member_DTO dto = sv.member_view(id);
		
		mo.addAttribute("user", dto);
		
		return "member_view";
	}
	@RequestMapping(value = "/member_delete")
	public String member_delete(HttpServletRequest request) {
		String id = request.getParameter("id");
		String image = request.getParameter("image");
		
		Member_Service sv = sqlSession.getMapper(Member_Service.class);
		sv.member_delete(id);
		
		File del = new File(path+image);
		del.delete();
		
		return "redirect:member_list";
	}
	@RequestMapping(value = "/member_update")
	public String member_update(HttpServletRequest request, Model mo) {
		String id = request.getParameter("id");
		
		Member_Service sv = sqlSession.getMapper(Member_Service.class);
		Member_DTO dto = sv.member_view(id);
		mo.addAttribute("user", dto);
		
		return "member_update";
	}
	@RequestMapping(value = "/member_update_do")
	public String member_update_do(MultipartHttpServletRequest request) throws IllegalStateException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3");
		String sex = request.getParameter("sex");
		String sex_old = request.getParameter("sex_old");
		if (sex == null) {sex = sex_old;}
		String add = request.getParameter("add");
		String [] hobby_li = request.getParameterValues("hobby");
		String hobby = "";
		String hobby_old = request.getParameter("hobby_old");
		if (hobby_li == null) {hobby = hobby_old;}
		else {
			for (int i = 0; i < hobby_li.length; i++){
				if(i!=hobby_li.length-1) hobby += hobby_li[i]+",";
				else hobby += hobby_li[i];
			}
		}
		String hello = request.getParameter("hello");
		MultipartFile mf = request.getFile("image");
		UUID uuid = UUID.randomUUID();
		String image = uuid.toString()+mf.getOriginalFilename();
		String image_old = request.getParameter("image_old");
		if (mf.getOriginalFilename() == "") {image = image_old;}
		else {
			File del = new File(path+image_old);
			del.delete();
			mf.transferTo(new File(path+image));
		}
		
		Member_Service sv = sqlSession.getMapper(Member_Service.class);
		sv.member_update(id,pw,name,tel,sex,add,hobby,hello,image);
		
		return "redirect:member_list";
	}
	@RequestMapping(value = "/member_search")
	public String member_search() {
		return "member_search";
	}
	@RequestMapping(value = "/member_search_do")
	public String member_search_do(HttpServletRequest request, Model mo) {
		String search = request.getParameter("search");
		String value = request.getParameter("value");
		
		Member_Service sv = sqlSession.getMapper(Member_Service.class);
		ArrayList<Member_DTO> list = sv.member_search(search, value);
		
		mo.addAttribute("list", list);
		
		return "member_search_view";
	}
}
