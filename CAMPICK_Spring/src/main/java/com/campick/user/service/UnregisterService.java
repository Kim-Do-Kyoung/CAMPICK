package com.campick.user.service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface UnregisterService {
	
	public void execute(String deletID);

}
