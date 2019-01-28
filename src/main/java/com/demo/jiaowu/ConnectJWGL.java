package com.demo.jiaowu;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 * @Author: Mencre
 * @Email: mencre@163.com
 * @Date: 2019/1/17/017 16:57
 * @Version 1.0
 */
public class ConnectJWGL {
	//private final String url = "http://www.zfjw.xupt.edu.cn";
	private final String url = "http://jwglxt.qust.edu.cn";
	private Map<String,String> cookies = new HashMap<>();
	private String modulus;
	private String exponent;
	private String csrftoken;
	private Connection connection;
	private Connection.Response response;
	private Document document;
	private String stuNum;
	private String password;

	public ConnectJWGL(String stuNum,String password){
		this.stuNum = stuNum;
		this.password = password;
	}

	public boolean init() throws Exception{
		if (getCsrftoken()){	//如果连接成功
			getRSApublickey();
			return true;
		}
		return false;	//连接失败返回false
	}

	// 获取csrftoken和Cookies
	// return boolean;  连接成功return TRUE;  连接失败return FALSE;
	private boolean getCsrftoken(){
		try{
			connection = Jsoup.connect(url+ "/jwglxt/xtgl/login_slogin.html?language=zh_CN&_t="+new Date().getTime());
			connection.header("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0");
			response = connection.execute();
			cookies = response.cookies();
			//保存csrftoken
			document = Jsoup.parse(response.body());
			csrftoken = document.getElementById("csrftoken").val();
		}catch (Exception ex){
			System.out.println("连接失败！");
			ex.printStackTrace();
			return false;
		}
		return true;
	}

	// 获取公钥并加密密码
	public void getRSApublickey() throws Exception{
		connection = Jsoup.connect(url+ "/jwglxt/xtgl/login_getPublicKey.html?" + "time="+ new Date().getTime());
		connection.header("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0");
		response = connection.cookies(cookies).ignoreContentType(true).execute();
		JSONObject jsonObject = JSON.parseObject(response.body());
		modulus = jsonObject.getString("modulus");
		exponent = jsonObject.getString("exponent");
		password = RSAEncoder.RSAEncrypt(password, B64.b64tohex(modulus), B64.b64tohex(exponent));
		password = B64.hex2b64(password);
	}

	/*
	 * 登录
	 * return 1:登录成功
	 * return tips:返回错误提示信息
	 */
	public String beginLogin() throws Exception{
		connection = Jsoup.connect(url+ "/jwglxt/xtgl/login_slogin.html");
		connection.header("Content-Type","application/x-www-form-urlencoded;charset=utf-8");
		connection.header("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0");

		connection.data("csrftoken",csrftoken);
		connection.data("yhm",stuNum);
		connection.data("mm",password);
		connection.data("mm",password);
		connection.cookies(cookies).ignoreContentType(true)
				.method(Connection.Method.POST).execute();
		response = connection.execute();
		document = Jsoup.parse(response.body());
		if(document.getElementById("tips") == null){
			System.out.println("登录成功，学号：" + stuNum + "，密码：" + password);
			return "1";
		}else{
			System.out.println(document.getElementById("tips").text());
			return document.getElementById("tips").text();
		}
	}

	// 查询学生信息
	public void getStudentInformaction() throws Exception {
		connection = Jsoup.connect(url+ "/jwglxt/xsxxxggl/xsxxwh_cxCkDgxsxx.html?gnmkdm=N100801&su="+ stuNum);
		connection.header("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0");
		response = connection.cookies(cookies).ignoreContentType(true).execute();
		JSONObject jsonObject = JSON.parseObject(response.body());
		System.out.println("--- 基本信息 ---");
		System.out.println("学号：" + jsonObject.getString("xh_id"));
		System.out.println("性别：" + jsonObject.getString("xbm"));
		System.out.println("民族：" + jsonObject.getString("mzm"));
		System.out.println("学院：" + jsonObject.getString("jg_id"));
		System.out.println("班级：" + jsonObject.getString("bh_id"));
		System.out.println("专业：" + jsonObject.getString("zszyh_id"));
		System.out.println("状态：" + jsonObject.getString("xjztdm"));
		System.out.println("入学年份：" + jsonObject.getString("njdm_id"));
		System.out.println("证件号码：" + jsonObject.getString("zjhm"));
		System.out.println("政治面貌：" + jsonObject.getString("zzmmm"));
	}

	// 获取课表信息
	public void getStudentTimetable(int year , int term) throws Exception {
		connection = Jsoup.connect(url+ "/jwglxt/kbcx/xskbcx_cxXsKb.html?gnmkdm=N2151");
		connection.header("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0");
		connection.data("xnm",String.valueOf(year));
		connection.data("xqm",String.valueOf(term * term * 3));
		response = connection.cookies(cookies).method(Connection.Method.POST).ignoreContentType(true).execute();
		JSONObject jsonObject = JSON.parseObject(response.body());
		if(jsonObject.get("kbList") == null){
			System.out.println("暂时没有安排课程");
			return;
		}
		JSONArray timeTable = JSON.parseArray(jsonObject.getString("kbList"));
		System.out.println(String.valueOf(year) + " -- " + String.valueOf(year + 1) + "学年 " + "第" + term + "学期");
		for (Iterator iterator = timeTable.iterator(); iterator.hasNext();) {
			JSONObject lesson = (JSONObject) iterator.next();
			System.out.println(lesson.getString("xqjmc") + " " +
					lesson.getString("jc") + " " +
					lesson.getString("kcmc") + " " +
					lesson.getString("xm") + " " +
					lesson.getString("xqmc") + " " +
					lesson.getString("cdmc") + " " +
					lesson.getString("zcd"));
		}
	}

	// 获取成绩信息
	public List<Map<String,Object>> getStudentGrade(int year , int term) throws Exception {
		System.out.println(year + "学年，" + term + "学期");
		List<Map<String,Object>> listMap = new ArrayList<Map<String,Object>>();
		Map<String,String> datas = new HashMap<>();
		datas.put("xnm",String.valueOf(year));
		datas.put("xqm",String.valueOf(term * term * 3));
		datas.put("_search","false");
		datas.put("nd",String.valueOf(new Date().getTime()));
		datas.put("queryModel.showCount","20");
		datas.put("queryModel.currentPage","1");
		datas.put("queryModel.sortName","");
		datas.put("queryModel.sortOrder","asc");
		datas.put("queryModel.sortName","");
		datas.put("time","0");

		connection = Jsoup.connect(url+ "/jwglxt/cjcx/cjcx_cxDgXscj.html?gnmkdm=N305005&layout=default&su=" + stuNum);
		connection.header("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0");
		response = connection.cookies(cookies).method(Connection.Method.POST)
				.data(datas).ignoreContentType(true).execute();
		connection = Jsoup.connect(url+ "/jwglxt/cjcx/cjcx_cxDgXscj.html?doType=query&gnmkdm=N305005");
		connection.header("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0");
		response = connection.cookies(cookies).method(Connection.Method.POST)
				.data(datas).ignoreContentType(true).execute();
		JSONObject jsonObject = JSON.parseObject(response.body());
		JSONArray gradeTable = JSON.parseArray(jsonObject.getString("items"));
		for (Iterator iterator = gradeTable.iterator(); iterator.hasNext();) {
			JSONObject lesson = (JSONObject) iterator.next();
			System.out.println(lesson.getString("kcmc") + " " +	//课程名称
					lesson.getString("kcxzmc") + " " +				//课程性质
					lesson.getString("bfzcj") + " " +				//成绩
					lesson.getString("xf") + " " +					//学分
					lesson.getString("jd"));						//绩点

			//打包数据
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("kcmc",lesson.getString("kcmc"));		//课程名称
			map.put("kcxz",lesson.getString("kcxzmc"));	//课程性质（必修，选修）
			map.put("cj",lesson.getString("bfzcj"));		//成绩
			map.put("xf",lesson.getString("xf"));			//学分
			map.put("jd",lesson.getString("jd"));			//绩点

			listMap.add(map);

		}
		return listMap;
	}

	public void logout() throws Exception {
		connection = Jsoup.connect(url+ "/jwglxt/logout");
		connection.header("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0");
		response = connection.cookies(cookies).ignoreContentType(true).execute();
	}
}
