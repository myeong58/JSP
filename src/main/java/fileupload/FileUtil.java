package fileupload;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.sql.rowset.serial.SerialException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class FileUtil {
	
	//파일 업로드
	public static String uploadFile(HttpServletRequest request, String sDirectory) 
					throws ServletException, IOException{
		
//		Part part = request.getPart("ofile");
		Part part = request.getPart("attachedFile");
		String partHeader = part.getHeader("content-disposition");
		System.out.println("partHeader : " + partHeader);
		
		String[] phArr = partHeader.split("filename=");
		
		System.out.println("------------------");
		for(String s : phArr)
			System.out.println(s);
		System.out.println("------------------");
		
		String originalFileName = phArr[1].trim().replace("\"", "");
		System.out.println("originalFileName : " + originalFileName);
	
		System.out.println("File.separator : " + File.separator);
		System.out.println("sDirectory : " + sDirectory);
		System.out.println("fileDirect : " + sDirectory + File.separator + originalFileName);
		
		if(!originalFileName.isEmpty()) {
			part.write(sDirectory + File.separator + originalFileName); 
		}		
		return originalFileName;		
	}
	
	public static ArrayList<String> multipleFile(HttpServletRequest request, String sDirectory) 
			throws ServletException, IOException{

		ArrayList<String> listFileName = new ArrayList<>();
		Collection<Part> parts = request.getParts();
		for(Part part : parts) {
			if(!part.getName().equals("attachedFile"))
				continue;
				
			String partHeader = part.getHeader("content-disposition");
			String[] phArr = partHeader.split("filename=");
			String originalFileName = phArr[1].trim().replace("\"", "");
			if(!originalFileName.isEmpty()) {
				part.write(sDirectory + File.separator + originalFileName); 
			}	
			listFileName.add(originalFileName);			
		}

		return listFileName;				
	}
	
	//파일명 변경
	public static String renameFile(String sDirectory, String fileName) {
		
		String ext = fileName.substring(fileName.lastIndexOf("."));
		System.out.println("ext : " + ext);
		
		String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
		String newFileName = now+ext;
		
		File oldFile = new File(sDirectory + File.separator + fileName);
		File newFile = new File(sDirectory + File.separator + newFileName);
		oldFile.renameTo(newFile);
		
		return newFileName;
	}
}
