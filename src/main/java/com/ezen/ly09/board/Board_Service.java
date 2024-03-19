package com.ezen.ly09.board;

import java.util.ArrayList;

public interface Board_Service {

	public void board_input(String writer, String title, String content);

	public ArrayList<Board_DTO> board_list();

	public void board_delete(int num);

	public Board_DTO board_view(int num);

	public void board_conutup(int num);

	public void board_reply_save(String writer, String title, String content, int groups, int step, int indent);

	public void stepup(int groups, int step);

	public int total();
	
	public ArrayList<Board_DTO> page(Board_Page_DTO dto);

}
