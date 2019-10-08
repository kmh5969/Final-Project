package com.prj.te.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.prj.te.dto.MemberDto;
import com.prj.te.model.dao.MemberDao;

@Service
public class MemberBizImpl implements MemberBiz {

	@Autowired
	private MemberDao dao;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public MemberDto login(String id) {
		return dao.login(id);
	}

	@Override
	public List<MemberDto> selectList() {
		return dao.selectList();
	}

	@Override
	public MemberDto selectone(int member_seq) {
		return dao.selectone(member_seq);
	}

	@Override
	public int insert(MemberDto dto) {
	System.out.println(dto+"비즈입니다");
		dto.setPw(passwordEncoder.encode(dto.getPassword()));
		return dao.insert(dto);
	}

	@Override
	public int update(MemberDto dto) {
		if(dto.getPassword()!=null && dto.getPassword()!="") {
			dto.setPw(passwordEncoder.encode(dto.getPassword()));
		}
		return dao.update(dto);
	}

	@Override
	public int delete(int member_seq) {
		return dao.delete(member_seq);
	}
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberDto dto = null;
		
		dto = dao.login(username);
		
		if(dto == null) {
			throw new BadCredentialsException("해당 하는 ID를 찾을 수 없습니다.");
		}
		
		return dto;
	}
	public User findAccount(String email) {
		
		return null;
	}

	public void updateInfo(String username, String string, String password) {
		
	}

	
}
