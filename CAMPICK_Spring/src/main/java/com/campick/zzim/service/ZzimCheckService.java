package com.campick.zzim.service;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ZzimCheckService {

	public int execute(String id, int camp_id);
}
