package kr.or.iei.tripBoard.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.or.iei.tripBoard.model.service.TripBoardService;

@Controller
public class TripBoardController {
	@Autowired
	@Qualifier("tripBoardService")
	private TripBoardService service;

	public TripBoardController() {
		super();
		System.out.println("TripBoardController 생성완료");
	}

	@RequestMapping(value = "/tripBoardList.do")
	public String tripboardList() {
		return "tripBoard/tripBoardList";
	}

	@RequestMapping(value = "/tripBaordWrite.do")
	public String tripboardWrite(String memberId) {
		
		return "tripBoard/tripBoardWrite";
	}

	public long getCurrentTime() {
		Calendar today = Calendar.getInstance();
		return today.getTimeInMillis();
	}

	@RequestMapping(value = "/tBuploadImage.do", method = RequestMethod.POST)
	public void imageUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception {
		OutputStream out = null;
		PrintWriter printWriter = null;
		// 인코딩
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		try {
			
			// 파일 이름 가져오기
			String fileName = upload.getOriginalFilename();
			String onlyFilename = fileName.substring(0, fileName.lastIndexOf("."));// 확장자를 제외한 파일 이름(ex>test)
			String extension = fileName.substring(fileName.lastIndexOf("."));// 확장자 이름(ex>.txt)
			String filepath = onlyFilename + "_" + getCurrentTime() + extension;
			byte[] bytes = upload.getBytes();
			// 이미지 경로 생성
			String path = request.getRealPath("/upload/images/tour/content");// fileDir는 전역 변수라 그냥 이미지 경로 설정해주면 된다.
			String ckUploadPath = path + "/" + filepath;
			File folder = new File(path);

			// 해당 디렉토리 확인
			if (!folder.exists()) {
				try {
					folder.mkdirs(); // 폴더 생성
				} catch (Exception e) {
					e.getStackTrace();
				}
			}

			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

			String callback = request.getParameter("CKEditorFuncNum");
			printWriter = response.getWriter();
			String fileUrl = "/ckImgSubmit.do?filepath=" + filepath; // 작성화면

			// 업로드시 메시지 출력
			printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
			printWriter.flush();

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

//	@RequestMapping(value = "/ckImgSubmit.do")
//	public void ckSubmit(@RequestParam(value = "filepath") String filepath, HttpServletRequest request,
//			HttpServletResponse response) throws ServletException, IOException {
//
//		// 서버에 저장된 이미지 경로
//		String path = request.getRealPath("/upload/images/tour/content");
//		;
//
//		String sDirPath = path + "/" + filepath;
//
//		File imgFile = new File(sDirPath);
//
//		// 사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
//		if (imgFile.isFile()) {
//			byte[] buf = new byte[1024];
//			int readByte = 0;
//			int length = 0;
//			byte[] imgBuf = null;
//
//			FileInputStream fileInputStream = null;
//			ByteArrayOutputStream outputStream = null;
//			ServletOutputStream out = null;
//
//			fileInputStream = new FileInputStream(imgFile);
//			outputStream = new ByteArrayOutputStream();
//			out = response.getOutputStream();
//
//			while ((readByte = fileInputStream.read(buf)) != -1) {
//				outputStream.write(buf, 0, readByte);
//			}
//
//			imgBuf = outputStream.toByteArray();
//			length = imgBuf.length;
//			out.write(imgBuf, 0, length);
//			out.flush();
//		}
//	}

}
