package jspstudy.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import jspstudy.dbconn.Dbconn;
import jspstudy.domain.MemberVo;

public class MemberDao {

	//���ᰴü
	private Connection conn;
	//������ü
	private PreparedStatement pstmt = null;
	
	public MemberDao() {
		Dbconn db = new Dbconn();
		this.conn = db.getConnection();
	}

	public int insertMember(String memberId, String memberPwd,String memberName,String memberEmail,String memberGender,String memberAddr,String memberPhone,String memberJumin,String hobby,String ip){
		int value=0;
		//��ȭ�� ������ü ���� �� �ʱ�ȭ
		
		String sql="insert into a_member(MIDX,MEMBERID,MEMBERPWD,MEMBERNAME,MEMBEREMAIL,MEMBERGENDER,MEMBERADDR,MEMBERPHONE,MEMBERJUMIN,MEMBERHOBBY,MEMBERIP)" 
				+ "values(midx_seq.nextval,?,?,?,?,?,?,?,?,?,?)";
			
		//������ �����ϱ� ���� �������� Ŭ������ �����Ѵ�
		try{
		//	Statement stmt = conn.createStatement();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			pstmt.setString(3, memberName);
			pstmt.setString(4, memberEmail);
			pstmt.setString(5, memberGender);
			pstmt.setString(6, memberAddr);
			pstmt.setString(7, memberPhone);
			pstmt.setString(8, memberJumin);
			pstmt.setString(9, hobby);
			pstmt.setString(10,ip);
			value = pstmt.executeUpdate();		
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return value;
	}

	public ArrayList<MemberVo> memberSelectAll(){
		
		ArrayList<MemberVo> alist = new ArrayList<MemberVo>();
		ResultSet rs = null;
		String sql = "select * from a_member where delyn='N' order by midx desc";
		
		try{
		//Connection ��ü�� ���ؼ� ���ڿ��� ����ȭ ��Ų��
		pstmt = conn.prepareStatement(sql);
		//���� �����͸� �״�� �����ؼ� ��� Ŭ���� ResultSet
		rs = pstmt.executeQuery();
		//�ݺ��� ���� . rs.next()�� ���� �࿡ ���� �ִ��� ������ true ������ false.. ������ �� ������ �̵�  
		while(rs.next()){
			
			//��ü����
			MemberVo mv = new MemberVo();
			//�Űܴ��
			mv.setMidx(rs.getInt("midx"));
			mv.setMembername(rs.getString("memberName"));
			mv.setMemberphone(rs.getString("memberphone"));
			mv.setWriteday(rs.getString("writeday"));
			//���� mv�� alist�� �߰��Ѵ�
			alist.add(mv);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				rs.close();
				pstmt.close();
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
		
		return alist;

	}
	
	public MemberVo memberLogin(String memberId, String memberPwd) {
		System.out.println(memberId +  memberPwd);
		ResultSet rs = null;
		MemberVo mv = null;
		
		String sql="select * from a_member where delyn = 'N' and memberid = ? and memberpwd = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {	//다음꺼가 존재한다면
				mv = new MemberVo();	//객체를 생성시킨다.
				mv.setMidx(rs.getInt("midx")); //mv에 담겨있는 midx, memberIdm memberName 값을 꺼낸다.
				mv.setMemberid(rs.getString("memberid"));
				mv.setMembername(rs.getString("membername"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return mv;
	}
	
	
}
