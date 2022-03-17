package com.kook.ezenpj.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.kook.ezenpj.dao.MiniDao;
import com.kook.ezenpj.dto.JoinDto;
import com.kook.ezenpj.util.Constant;

public class CustomUserDetailsService implements UserDetailsService{
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MiniDao mdao = Constant.mdao;
		JoinDto dto = mdao.login(username);
		System.out.println("dto" + dto);
		if(dto == null) {
			System.out.println("null");
			throw new UsernameNotFoundException("No user found with username");
//			������ ��ť��Ƽ���� ���� ó���Ͽ� �α��� ����ó��
		}
		String pw = dto.getPpw();
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
//		role��(���� ���� ��, ROLE_USER,ROLE_ADMIN,ROLE_MANAGE ��)�� �����ϴ� ����Ʈ ��ü
//		db�� quthority�÷��� �ְ� �����ߴٸ� dto.getAuthority()�� ���� ���� new SimpleGrantedAutority()
		roles.add(new SimpleGrantedAuthority("ROLE_USER"));
		UserDetails user = new User(username, pw, roles);
//		���� id,pw,roles�� �̿��Ͽ� UserDetail��ü�� ����� ��ȯ����
		Constant.username = username; //�α��� ������ id�ʿ�� ��𼭳� ������ ��
		return user; //spring���� pw��ġ ���� üũ�ϰ� ���� ���� ���� �۾� ����
	}
}
