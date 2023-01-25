package com.campick.user.service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IDCheckService {
	
	public int execute(String user_id);
}
