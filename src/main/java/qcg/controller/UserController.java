package qcg.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Author: qcg
 * @Description:
 * @Date: 2018/12/27 15:32
 */
@Controller
@RequestMapping("/user")
public class UserController {

	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public String view(){
		return "userList";
	}
	@RequestMapping(value="/list",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject list(){
		// 构造返回数据
		int count = 1000;
		String msg = "";
		JSONArray jsonArray = new JSONArray();
		for(int i = 0 ; i < 50 ; i ++) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", i);
			jsonObject.put("username", "用户"+i);
			jsonObject.put("password", "密码"+i);
			jsonArray.add(jsonObject);
		}
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("count", count);
		jsonObject.put("msg", msg);
		jsonObject.put("data", jsonArray);
		jsonObject.put("code", 0);
		return jsonObject;
	}
}
