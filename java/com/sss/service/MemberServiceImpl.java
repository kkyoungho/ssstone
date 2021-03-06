package com.sss.service;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.sss.domain.MemberCriteria;
import com.sss.domain.MemberVO;
import com.sss.domain.Member_AuthVO;
import com.sss.mapper.MemberMapper;
import com.sss.mapper.Member_AuthMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Log4j
@Service
public class MemberServiceImpl implements MemberService {
	private MemberMapper mapper;
	private Member_AuthMapper authmapper;
	// private PasswordEncoder pwencoder;

	@Override
	public void insert(MemberVO member) {
		/* member.setM_password((member.getM_password())); */
		mapper.insert(member);
		Member_AuthVO auth = new Member_AuthVO();
		log.info(member.getM_no());
		auth.setM_no(member.getM_no());
		authmapper.insert(auth);
	}

	@Override
	public MemberVO read(Long m_no) {

		return mapper.read(m_no);
	}

	@Override
	public boolean update(MemberVO member) {
		boolean updated = mapper.update(member) == 1;
		System.out.println("비밀번호 바뀜");
		return updated;
	}

	@Override
	public boolean delete(Long m_no) {

		return mapper.delete(m_no) == 1;
	}

	@Override
	public List<MemberVO> getList(MemberCriteria cri) {

		return mapper.getList(cri);
	}

	/*
	 * @Override public List<MemberVO> getListWithPaging(Criteria cri) {
	 * log.info("getListpaging...." + cri); return getListWithPaging(cri); }
	 */

	@Override
	public int getMemberTotal() {
		log.info("get total count");
		return mapper.getMemberTotal();
	}

	@Override
	public List<MemberVO> countTodayAccountMember() {

		return mapper.countTodayAccountMember();
	}

	@Override
	public int memberTotalPurchaseAmount(Long m_no) {
		log.info(mapper.memberTotalPurchaseAmount(m_no));
		return mapper.memberTotalPurchaseAmount(m_no);
	}

	@Override
	public List<MemberVO> memberPurchaseAmount(Long m_no) {
		log.info(mapper.memberPurchaseAmount(m_no));
		return mapper.memberPurchaseAmount(m_no);
	}

	@Override
	public int checkID(String m_email) {
		if (m_email != null) {
			mapper.checkID(m_email);

		}
		return mapper.checkID(m_email);

	}

	@Override
	public MemberVO readByEmail(String m_email) {
		return mapper.readByEmail(m_email);
	}

	@Override
	public void insertManager(MemberVO member) {
		mapper.insert(member);
		Member_AuthVO auth = new Member_AuthVO();
		log.info(member.getM_no());
		auth.setM_no(member.getM_no());
		authmapper.insertManager(auth);
		authmapper.insert(auth);
	}

	@Override
	public List<MemberVO> readManager(MemberCriteria cri) {

		return mapper.readManager(cri);
	}

	@Override
	public List<MemberVO> mypage(Long m_no) {

		log.info(m_no + "");
		return mapper.mypage(m_no);
	}
}