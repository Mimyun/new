package com.ezen.ly09.member;

import java.util.ArrayList;

public interface Member_Service {

	void member_input(String id, String pw, String name, String tel, String sex, String add, String hobby, String hello,
			String image);

	String idcheck(String id);
	
	String pwcheck(String pw, String pw2);

	ArrayList<Member_DTO> member_list();

	Member_DTO member_view(String id);

	void member_delete(String id);

	void member_update(String id, String pw, String name, String tel, String sex, String add, String hobby,
			String hello, String image);

	ArrayList<Member_DTO> member_search(String search, String value);

}
