package com.campick.user.service;

import com.campick.user.model.UserDto;

public interface SearchPwService {
	
	public UserDto execute(String s_id, String s_email, String s_tel);
}
