package qcg.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import qcg.bean.User;
import qcg.service.UserService;
import qcg.util.StringUtil;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author qcg
 * @date 2018/12/27 15:32
 */
@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String view() {
		return "userList";
	}

	@RequestMapping(value = "/list", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject list(HttpServletRequest request) {
		String page = request.getParameter("page");
		String limit = request.getParameter("limit");
		List<User> userList = userService.list(Integer.parseInt(page), Integer.parseInt(limit));
		int count = userService.size();
		JSONArray jsonArray = new JSONArray();
		jsonArray = JSONArray.parseArray(JSONObject.toJSONString(userList));
		// 构造返回数据
		String msg = "123";

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("count", count);
		jsonObject.put("msg", msg);
		jsonObject.put("data", jsonArray);
		jsonObject.put("code", 0);
		return jsonObject;
	}

	@RequestMapping(value = "/add",method = RequestMethod.GET)
	public String addView(){
		return "userAdd";
	}

	@RequestMapping(value = "/add",method = RequestMethod.POST)
	@ResponseBody
	public JSONObject add(User user){
		boolean result = userService.add(user);
		JSONObject jsonObject = new JSONObject();
		if (result){
			jsonObject.put("status", "1");
			jsonObject.put("msg", "操作成功!");
		}else {
			jsonObject.put("status", "0");
			jsonObject.put("msg", "操作失败!");
		}
		return jsonObject;
	}
}
