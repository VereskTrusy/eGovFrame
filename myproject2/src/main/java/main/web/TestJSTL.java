package main.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestJSTL {

	
	@RequestMapping("/test.do")
	public String testJSTL() {
		return "jstlTip/testJSTL";
	}
}
