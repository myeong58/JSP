package fileupload;

import java.util.ArrayList;
import java.util.List;

import common.DBConnPool;

public class MyFileDAO extends DBConnPool{
	
	//게시물 추가
	public int insertFile(MyFileDTO dto) {
		
		int applyResult = 0;
		
		try {
			
			String query = "insert into myfile(idx, title, cate, ofile, sfile)"
					+" values(seq_board_num.nextval , ?,?,?,?)";
			
			psmt = con.prepareStatement(query);
			System.out.println("psmt : " + psmt);
			
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getCate());
			psmt.setString(3, dto.getOfile());
			psmt.setString(4, dto.getSfile());
			
			applyResult = psmt.executeUpdate();
			
		}catch(Exception e) {
			System.out.println("Insert 중 예외 발생");
			e.printStackTrace();
		}
		return applyResult;
	}
	
	//파일 목록을 반환.
	public List<MyFileDTO> myFileList(){
		List<MyFileDTO> fileList = new ArrayList<MyFileDTO>();
		
		String query = "select * from myfile order by idx desc";
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				MyFileDTO dto = new MyFileDTO();
				
				dto.setIdx(rs.getString("idx"));
				dto.setTitle(rs.getString("title"));
				dto.setCate(rs.getString("cate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setPostdate(rs.getString("postdate"));
				
				fileList.add(dto);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return fileList;
	}
}
