package kr.or.iei.common.model.vo;

import lombok.Data;

@Data
public class Photo {
	private int photoNo;
	private int boardClass;
	private int boardNo;
	private String filename;
	private String filepath;
}
