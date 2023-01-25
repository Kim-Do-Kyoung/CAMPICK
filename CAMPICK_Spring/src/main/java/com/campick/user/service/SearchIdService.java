package com.campick.user.service;

import com.campick.user.model.UserDto;

public interface SearchIdService {

	public UserDto execute(String name, String phone);
}
