package main.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.service.MemberService;
import main.service.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Resource(name="memberDAO")
	public MemberDAO memberDAO;
	
	@Override /* 다형성(오버라이딩, 오버로딩 */
	public String insertMember(MemberVO vo) throws Exception {
		return memberDAO.insertMember(vo);
	}

}
