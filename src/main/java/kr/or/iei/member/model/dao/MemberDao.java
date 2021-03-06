package kr.or.iei.member.model.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.iei.common.model.vo.mainPhotoRecommed;
import kr.or.iei.member.model.vo.Company;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.notice.model.vo.Notice;
import kr.or.iei.recommend.model.vo.Recommend;
import kr.or.iei.tour.model.vo.TourVO;

@Repository("memberDao")
public class MemberDao {
	@Autowired
	private SqlSessionTemplate sqlsession;

	public Member loginMember(Member m) {
		return sqlsession.selectOne("member.loginMember",m);
	}

	public int memberjoin(Member m) {
		return sqlsession.insert("member.memberjoin",m);
	}

	public int companyjoin(Company company) {
		return sqlsession.insert("company.companyjoin",company);
	}

	public int companyjoinMember(Member m) {
		return sqlsession.insert("member.companymemberjoin",m);
	}

	public int chkId(Member m) {
		return sqlsession.selectOne("member.memberchkId",m);
	}

	public int chkNickname(Member m) {
		return sqlsession.selectOne("member.memberchkNickname",m);
	}

	public int chkEmail(Member m) {
		return sqlsession.selectOne("member.memberchkEmail",m);
		
	}

	public Member seleceId(Member m) {
		return sqlsession.selectOne("member.idSearch",m);
	}

	public Member passwordchange(Member m) {
		return sqlsession.selectOne("member.passwordchange",m);
	}

	public int pWModifyMember(Member m) {
		return sqlsession.update("member.pwModifyMember",m);
	}

	public int memberModifiedMember(Member m) {
		return sqlsession.update("member.memberModified",m);
	}

	public Company checkCompanyId(Member member) {
		return sqlsession.selectOne("company.checkCompanyId",member);
	}

	public int companyModifiedMember(Company cp) {
		return sqlsession.update("company.companyModified",cp);
	}

	public List<Recommend> mainrecommendList(HashMap<String, Integer>map) {
		return sqlsession.selectList("member.mainrecommendList",map);
	}

	public List<mainPhotoRecommed> maintourList(HashMap<String, Integer> map) {
		return sqlsession.selectList("member.mainTourList",map);
	}

	public Member sessioncheck(String memberId) {
		return sqlsession.selectOne("member.membercheck",memberId);
	}

	public Company sessionCp(Company cp) {
		return sqlsession.selectOne("company.sessionCp",cp);
	}

	public Member modifyMembercheck(Member m) {
		return sqlsession.selectOne("member.modifyMembercheck",m);
	}

	public Member selectOneMember(Member m) {
		return sqlsession.selectOne("member.selectOneMember",m);
	}

	public int memberPwModifiedMember(Member m) {
		return sqlsession.update("member.memberModifiedMember",m);
	}




}
