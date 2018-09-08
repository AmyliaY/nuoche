package com.action.admin;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.action.JccsAction;
import com.pojo.Admin;
import com.service.admin.MoneytongjiService;

@Controller
@RequestMapping("/admin_moneytongji.do")
public class MoneytongjiAction {
	
	@Autowired
	private MoneytongjiService tongjiService;
	
	/**
	 * 统计 会员 and 订单 and 短信信息通知总条数	总数    今日    本月
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(params="p=tongji")
	public String tongjilisting(HttpServletRequest request,HttpServletResponse response)
	{
		Admin admin=(Admin) request.getSession().getAttribute("admin");
		if(admin==null)
		{
			return "/admin/login.jsp";
		}
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Timestamp day=new Timestamp(System.currentTimeMillis());
		String daydate=sdf.format(day);
		
		String qrcodeprice=JccsAction.getQrcodeprice();
		
		String qrcodeProxyprice=JccsAction.getQrcodeProxyprice();
		String topprice=JccsAction.getTopprice();
		String vipyuyueprice=JccsAction.getVipyuyueprice();
		
		String lunboprice=JccsAction.getLunboprice();	
		Calendar calendar=Calendar.getInstance();	//得到日历
		Date date=calendar.getTime();
		calendar.set(Calendar.DAY_OF_MONTH, 1);		//得到本月1号
		date=calendar.getTime();
		String monthone=sdf.format(date);
		
		calendar.set(calendar.DAY_OF_MONTH, calendar.getActualMaximum(calendar.DAY_OF_MONTH));	//得到本月最后一天
		date=calendar.getTime();
		String monthlast=sdf.format(date);
		Map tjmap=tongjiService.tongjilisting(daydate,monthone,monthlast,lunboprice,topprice,vipyuyueprice,qrcodeProxyprice,qrcodeprice); 	//统计 会员   and 订单  and	短信消息通知
		request.setAttribute("tjmap", tjmap);
		return "/admin/moneytongji.jsp";
	}

}
