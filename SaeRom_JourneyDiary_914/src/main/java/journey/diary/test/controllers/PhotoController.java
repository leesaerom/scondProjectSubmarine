package journey.diary.test.controllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.LocationInfo;
import com.google.cloud.vision.v1.WebDetection;
import com.google.cloud.vision.v1.WebDetection.WebLabel;
import com.google.protobuf.ByteString;

import journey.diary.test.DAO.PhotoMapper;
import journey.diary.test.VO.Photo;
import journey.diary.test.VO.PhotoPager;
import journey.diary.test.VO.Uploadimage;

@Controller
public class PhotoController {
	
	@Autowired
	SqlSession sqlSession;
	

	String PHOTOUPLOADPATH = "C:\\Users\\LEE NANA\\git\\Team-Submarine3\\JourneyDiary_0913\\src\\main\\webapp\\resources\\img\\photo\\";
	String ALBUMUPLOADPATH = "C:\\Users\\LEE NANA\\git\\Team-Submarine3\\JourneyDiary_0913\\src\\main\\webapp\\resources\\img\\album\\";
	String PHOTOLINKPATH = "./resources/img/photo/";
	String ALBUMLINKPATH = "./resources/img/album/";
	
	final int countPerPage = 9;
	final int pagePerGroup = 5;
		
	@RequestMapping(value = "/createPhoto", method = RequestMethod.GET)
	public String createPhoto(Model model, int albumno) {
		model.addAttribute("albumno", albumno);
		return "photo/createPhoto";
	}
	
	@RequestMapping(value = "/createPhoto", method = RequestMethod.POST)
	public String makePhoto(Model model, HttpSession session, Photo photo, MultipartFile uploadfile) {
		int userno = (int)session.getAttribute("userno");
		PhotoMapper manager = sqlSession.getMapper(PhotoMapper.class);
		photo.setUserno(userno);
		manager.photoUpload(photo);
		
		return "redirect: photoList?albumno=" + photo.getAlbumno();
	}
	
	
	@RequestMapping(value = "/ajaximage", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	public @ResponseBody String ajaximage(MultipartFile uploadfile) {

		UUID uuid = UUID.randomUUID();
		String saveFileName = uuid + "_" + uploadfile.getOriginalFilename();

		File saveFile = new File(PHOTOUPLOADPATH, saveFileName);

		PhotoMapper photoManager = sqlSession.getMapper(PhotoMapper.class);

		try {
			uploadfile.transferTo(saveFile);
			Uploadimage image = new Uploadimage();
			image.setOriginalfilename(uploadfile.getOriginalFilename());
			image.setSavedfilename(saveFileName);
			photoManager.uploadimg(image);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return saveFileName;
	}
	
	@RequestMapping(value = "/imageAnalysis", produces = "application/text; charset=utf8", method = RequestMethod.POST)
	public @ResponseBody String imageAnalysis(String tempImg) {

		String photo = PHOTOUPLOADPATH + tempImg;
		
		System.out.println(photo);
		
		Map<String, String> landmark = null;
		String landmarkLabel = "";
		
		try {
			landmark = detectLandmarks(photo);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		if(!(landmark.get("mark").equals("Fail"))) {
			return landmark.get("mark") + ";" + landmark.get("lat") + ";" + landmark.get("lng");
		}else {		
			try {
				landmarkLabel = detectWebDetections(photo);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return landmarkLabel;
		}
		
	}
	

	// 로컬 랜드마크 감지

	public static Map<String, String> detectLandmarks(String filePath) throws Exception, IOException {
		List<AnnotateImageRequest> requests = new ArrayList<>();
		ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));

		Image img = Image.newBuilder().setContent(imgBytes).build();
		Feature feat = Feature.newBuilder().setType(Type.LANDMARK_DETECTION).build();
		AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		requests.add(request);

		Map<String, String> landmark = new HashMap<String, String>();
		
		
		try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
			BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = response.getResponsesList();

			for (AnnotateImageResponse res : responses) {
				if (res.hasError()) {
					System.out.println("Error: " + res.getError().getMessage());
					landmark.put("mark", "Fail");
					return landmark;
				}

				// For full list of available annotations, see http://g.co/cloud/vision/docs
				for (EntityAnnotation annotation : res.getLandmarkAnnotationsList()) {
					LocationInfo info = annotation.getLocationsList().listIterator().next();
					System.out.println("Landmark: " + annotation.getDescription() + info.getLatLng());
					landmark.put("mark", annotation.getDescription());
					landmark.put("lat", info.getLatLng().getLatitude() + "");
					landmark.put("lng", info.getLatLng().getLongitude() + "");
					return landmark;
				}
			}
		}
		
		landmark.put("mark", "Fail");
		return landmark;
		
	}

	// 로컬 이미지 감지
	public static String detectWebDetections(String filePath) throws Exception, IOException {

		List<AnnotateImageRequest> requests = new ArrayList<>();

		ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));

		Image img = Image.newBuilder().setContent(imgBytes).build();
		Feature feat = Feature.newBuilder().setType(Type.WEB_DETECTION).build();
		AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		requests.add(request);

		try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
			BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = response.getResponsesList();

			for (AnnotateImageResponse res : responses) {
				if (res.hasError()) {
					System.out.printf("Error: %s\n", res.getError().getMessage());
					return "Fail";
				}

				// Search the web for usages of the image. You could use these signals later
				// for user input moderation or linking external references.
				// For a full list of available annotations, see http://g.co/cloud/vision/docs
				WebDetection annotation = res.getWebDetection();
				System.out.println("Entity:Id:Score");
				System.out.println("===============");
				int i = 0;
				for (WebLabel label : annotation.getBestGuessLabelsList()) {
					System.out.format("\nBest guess label: %s", label.getLabel());
					return label.getLabel();
				}
			}
			return "Fail";
		}
	}

	
	
	
	
	/*@RequestMapping(value = "/registerPhoto", method = RequestMethod.POST)
	public String RegisterPhoto(Model model, HttpSession session, Photo photo, String userKeyword, int albumno) {

		int userno = (int) session.getAttribute("userno");

		PhotoMapper photoManager = sqlSession.getMapper(PhotoMapper.class);

		photo.setUserno(userno);

		if (userKeyword != null) {

			String keywordStr = makeToken(userKeyword, ",");

			photo.setKeyword(keywordStr);
		} else {
			photo.setKeyword("#" + photo.getKeyword());
		}

		String realPath = photo.getPhotoimg();
		
		String imgPath = realPath.substring(PHOTOLINKPATH.length(), realPath.length());
		photo.setPhotoimg(PHOTOLINKPATH + imgPath);

		
		photoManager.photoUpload(photo);

		return 
	}*/

	// 글자 잘라주는 메소드
	public String makeToken(String message, String cuttingStr) {

		StringTokenizer st = new StringTokenizer(message, cuttingStr);
		String[] keywordArray = new String[st.countTokens()];
		int i = 0;
		String keywordStr = "";
		while (st.hasMoreElements()) {
			keywordArray[i++] = st.nextToken();
		}
		for (int j = 0; j < keywordArray.length; j++) {
			keywordStr += "#" + keywordArray[j].trim() + " ";
		}

		return keywordStr;
	}
	///////////////////////////////////////////////////////////////
	
	@RequestMapping(value = "/photoList", method = RequestMethod.GET)
	public String goindex(Locale locale, Model model
			, @RequestParam(value="page", defaultValue="1") int page
			, @RequestParam(value="searchText", defaultValue="") String searchText
			,@RequestParam(value="selected", defaultValue="") String selected) {
		
		PhotoMapper manager = sqlSession.getMapper(PhotoMapper.class);
		Photo photo = new Photo();
		int count = 0;
		List<Photo> photoList = null;
		
		if(selected.equals("landMark") && searchText.length() !=0) {
			photo.setLandmark(searchText);
		}
		
		count = manager.getTotalCount(photo);
		
		PhotoPager photoPager = new PhotoPager(countPerPage, pagePerGroup, page, count);
		
		RowBounds rb = new RowBounds(photoPager.getStartRecord(), photoPager.getCountPerPage());
		
		photoList = manager.getPhotoList(photo, rb);
		
		model.addAttribute("Photosrc", PHOTOLINKPATH);
		model.addAttribute("select" , selected);
		model.addAttribute("searchText", searchText);
		model.addAttribute("photoList", photoList);
		model.addAttribute("pagedate", photoPager);
		
		return "photo/photoList";
	}
	
	
	/*public String photoList(Locale locale, Model model, HttpSession session, Criteria cri) {
		
		PhotoMapper manager = sqlSession.getMapper(PhotoMapper.class);
		List<Photo> photoList = manager.getPhotoList(cri);
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		
		int totalNum;
		try {
			totalNum = manager.TotalCount();
			pageMaker.setTotalCount(totalNum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("photoList", photoList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("Photosrc", PHOTOLINKPATH);
		
		return "photo/photoList";
	}
	*/
	/*@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public String listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
	       //  커맨드 객체로 Criteria를 매개변수로 넣어줘, 넘어오는 page와 perPageNum정보를 받습니다.
	       // 해당 cri 를 이용해서 service->dao->mapper.xml 순으로 접근하면서 DB처리를 해 cri 전달된
	       // 현재 페이지 정보를 기준으로 BoardVO 객체를 담은 ArrayList가 반환될 것입니다.
	PhotoMapper manager = sqlSession.getMapper(PhotoMapper.class);
	List<Photo> photoList = manager.
	
	}*/
		
	@RequestMapping(value = "/photoDetails", method = RequestMethod.GET)
	public String publicPhoto(Model model, HttpSession session, int photono) {
		
		PhotoMapper manager = sqlSession.getMapper(PhotoMapper.class);
		Photo photo = manager.selectOnePhoto(photono);
		session.setAttribute("photono", photono);
		
		model.addAttribute("photo", photo);
		model.addAttribute("Photosrc", PHOTOLINKPATH);
		
		return "photo/photoDetails";
	}
	
	@RequestMapping(value = "/alterPhoto", method = RequestMethod.GET)
	public String updatePhoto(Model model, int photono) {

		PhotoMapper photoManager = sqlSession.getMapper(PhotoMapper.class);
		Photo photo = photoManager.selectOnePhoto(photono);

		model.addAttribute("Photosrc", PHOTOLINKPATH);
		model.addAttribute("Photo", photo);

		return "photo/alterPhoto";
	}
	
	
	@RequestMapping(value = "/alterPhoto", method = RequestMethod.POST)
	public String changePhoto(Model model, Photo photo, MultipartFile uploadfile, HttpSession session) {
		
		PhotoMapper photoManager = sqlSession.getMapper(PhotoMapper.class);
		
		int userno = (int)session.getAttribute("userno");
		
		photo.setUserno(userno);
		
		photoManager.alterPhoto(photo);

		List<Photo> photoList = photoManager.getAlbumPhoto(photo.getAlbumno());

		model.addAttribute("photoList", photoList);
		model.addAttribute("albumno", photo.getAlbumno());

		
		return "redirect:photoList";
	}

	@RequestMapping(value = "/deletePhoto", method = RequestMethod.GET)
	public String deletePhoto(Model model, int photono) {
		
		PhotoMapper photoManager = sqlSession.getMapper(PhotoMapper.class);

		photoManager.deletePhoto(photono);

		return "redirect:showAlbum";
	}
	
	// Directions - 샒 테스트
	@RequestMapping(value = "/directions", method = RequestMethod.GET)
	public String directions(Model model, HttpSession session) {
		PhotoMapper photoManager = sqlSession.getMapper(PhotoMapper.class);
		Photo photo = new Photo();
		int photono = (int) session.getAttribute("photono");
		photo = photoManager.selectOnePhoto(photono);
		
		model.addAttribute("photoDetail", photo);
		model.addAttribute("Photosrc", PHOTOLINKPATH);
		
		return "photo/directions";
	}
	
	@RequestMapping(value = "/directions2", method = RequestMethod.GET)
	public String directions2(Model model, HttpSession session) {
		
		return "photo/directions2";
	}
}
