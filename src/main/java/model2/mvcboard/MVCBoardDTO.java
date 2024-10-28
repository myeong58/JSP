package model2.mvcboard;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class MVCBoardDTO {
	   private String idx;
	   private String name;
	   private String title;
	   private String content;
	   private Date postdate;
	   private String ofile;
	   private String sfile;
	   private int downcount;
	   private String pass;
	   private int visitcount;
	}
