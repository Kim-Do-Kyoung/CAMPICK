package com.campick.zzim.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ZzimPlusService {

	public void execute(String user_id, int camp_id) throws Exception;
}
