package com.kook.ezenpj.miniCommand;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface MiniCommand {
	
	//�߻�޼��� ����
	void execute(Model model, HttpServletRequest request);

}
