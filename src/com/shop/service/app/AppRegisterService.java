package com.shop.service.app;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.HqlDAO;
import com.dao.JihuomaDAO;
import com.pojo.Jihuoma;

@Service
public class AppRegisterService {
	@Autowired
	private JihuomaDAO jihuomaDAO;
	@Autowired
	private HqlDAO hqldao;
  public void saveCode(String code,String mobile)
  {
	  Date date=new Date();
	  Timestamp time=new Timestamp(date.getTime());
	  Jihuoma jihuoma=new Jihuoma();
	  jihuoma.setMessage(code);
	  jihuoma.setPhone(mobile);
	  jihuoma.setTime(time);
	  jihuomaDAO.save(jihuoma);

  }
  public List findJihuoma(String mobile,String code)
  {
	  String hql="from Jihuoma where message=? and phone=?";
	  List list=hqldao.findByHQL(hql, code,mobile);
	 return list;
  }
}
