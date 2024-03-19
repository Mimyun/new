package com.ezen.ly09.board;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Board_Controller {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/board_input")
	public String board_input() {
		return "board_input";
	}
	@RequestMapping(value = "/board_save")
	public String board_save(HttpServletRequest request) {
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
		sv.board_input(writer, title, content);
		
		return "redirect:board_input";
	}
//	@RequestMapping(value = "/board_list")
//	public String board_list(Model mo) {
//		Board_Service sv = sqlSession.getMapper(Board_Service.class);
//		ArrayList<Board_DTO> list = sv.board_list();
//		
//		mo.addAttribute("list", list);
//		
//		return "board_list";
//	}
	@RequestMapping(value = "/board_page")
	public String board_page(HttpServletRequest request, Board_Page_DTO dto, Model mo) {
		String nowPage = request.getParameter("nowPage");
		String cntPerPage = request.getParameter("cntPerPage");

        Board_Service sv = sqlSession.getMapper(Board_Service.class);
        //전체레코드수구하기
        int total = sv.total();
        if(nowPage == null) nowPage = "1";
        if(cntPerPage == null) cntPerPage = "5";
        
        dto = new Board_Page_DTO(total,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
        mo.addAttribute("paging",dto);
        mo.addAttribute("list",sv.page(dto));
        
		return "board_list";
	}
	@RequestMapping(value = "/board_delete")
	public String board_delete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
		
		sv.board_delete(num);
		
		return "redirect:board_page";
	}
	@RequestMapping(value = "/board_view")
	public String board_view(HttpServletRequest request, Model mo) {
		int num = Integer.parseInt(request.getParameter("num"));
		
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
		sv.board_conutup(num);
		Board_DTO dto = sv.board_view(num);
		
		mo.addAttribute("dto", dto);
		
		return "board_view";
	}
	@RequestMapping(value = "/board_reply")
	public String board_comment(HttpServletRequest request, Model mo) {
		int num = Integer.parseInt(request.getParameter("num"));
		
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
		Board_DTO dto = sv.board_view(num);
		
		mo.addAttribute("dto", dto);
		
		return "board_reply_view";
	}
	@RequestMapping(value = "/board_reply_save")
	public String board_reply_save(HttpServletRequest request) {
		int groups = Integer.parseInt(request.getParameter("groups"));
		int step = Integer.parseInt(request.getParameter("num"));
		int indent = Integer.parseInt(request.getParameter("indent"));
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Board_Service sv = sqlSession.getMapper(Board_Service.class);
//		sv.stepup(groups,step);
//		step++;
		indent++;
		sv.board_reply_save(writer,title,content,groups,step,indent);
		
		return "redirect:board_page";
	}
	@RequestMapping(value = "/board_search")
	public String board_search() {
		return "board_search";
	}
	@RequestMapping(value = "/board_search_do")
	public String board_search_do() {
		return "board_search_view";
	}
}
