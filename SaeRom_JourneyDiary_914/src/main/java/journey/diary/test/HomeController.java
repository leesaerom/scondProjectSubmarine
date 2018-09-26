package journey.diary.test;

import java.util.List;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import journey.diary.test.DAO.PhotoMapper;
import journey.diary.test.VO.Photo;

@Controller
public class HomeController {
	@Autowired
	SqlSession sqlSession;
	
	String PHOTOUPLOADPATH = "C:\\Users\\LEE NANA\\git\\Team-Submarine3\\JourneyDiary_0913\\src\\main\\webapp\\resources\\img\\photo\\";
	String ALBUMUPLOADPATH = "C:\\Users\\LEE NANA\\git\\Team-Submarine3\\JourneyDiary_0913\\src\\main\\webapp\\resources\\img\\album\\";
	String PHOTOLINKPATH = "./resources/img/photo/";
	String ALBUMLINKPATH = "./resources/img/album/";
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		PhotoMapper manager = sqlSession.getMapper(PhotoMapper.class);
		List<Photo> photoList = manager.listAll();
		List<Photo> bestPhoto = manager.getBestPhotos();
		
		model.addAttribute("Photosrc", PHOTOLINKPATH);
		model.addAttribute("photoList", photoList);
		model.addAttribute("bestPhoto1", bestPhoto.get(0));
		model.addAttribute("bestPhoto2", bestPhoto.get(1));
		model.addAttribute("bestPhoto3", bestPhoto.get(2));
		model.addAttribute("bestPhoto4", bestPhoto.get(3));
		model.addAttribute("bestPhoto5", bestPhoto.get(4));
		model.addAttribute("bestPhoto6", bestPhoto.get(5));
		System.out.println(bestPhoto);
		
		return "index2";
	}
	
	@RequestMapping(value = "index2", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		PhotoMapper manager = sqlSession.getMapper(PhotoMapper.class);
		List<Photo> photoList = manager.listAll();
		List<Photo> bestPhoto = manager.getBestPhotos();
		model.addAttribute("Photosrc", PHOTOLINKPATH);
		model.addAttribute("photoList", photoList);
		model.addAttribute("bestPhoto1", bestPhoto.get(0));
		model.addAttribute("bestPhoto2", bestPhoto.get(1));
		model.addAttribute("bestPhoto3", bestPhoto.get(2));
		model.addAttribute("bestPhoto4", bestPhoto.get(3));
		model.addAttribute("bestPhoto5", bestPhoto.get(4));
		model.addAttribute("bestPhoto6", bestPhoto.get(5));
		
		return "index2";
	}
	/*
	@RequestMapping(value = "/moreList", method = RequestMethod.POST)
	public @ResponseBody List<Photo> moreList(Locale locale, Model model) {
		PhotoMapper manager = sqlSession.getMapper(PhotoMapper.class);
		List<Photo> photoList = manager.listAll();
		
		return photoList;
	}*/
	
	@RequestMapping(value = "allPhotoList", method = RequestMethod.GET)
	public @ResponseBody String goindex(Locale locale, Model model) {
		
		PhotoMapper manager = sqlSession.getMapper(PhotoMapper.class);
		List<Photo> photoList = manager.listAll();
		model.addAttribute("Photosrc", PHOTOLINKPATH);
		model.addAttribute("photoList", photoList);
		
		return "index2";
	}
	
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String about(Locale locale, Model model) {
		
		System.out.println("about???");
		
		return "about";
	}
	
	@RequestMapping(value = "/services", method = RequestMethod.GET)
	public String services(Locale locale, Model model) {
		
		return "services";
	}
	
}
