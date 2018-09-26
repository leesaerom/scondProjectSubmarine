package journey.diary.test.controllers;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import journey.diary.test.DAO.AlbumMapper;
import journey.diary.test.DAO.PhotoMapper;
import journey.diary.test.VO.Album;
import journey.diary.test.VO.Photo;
import journey.diary.test.VO.Uploadimage;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AlbumController {
	
	@Autowired
	SqlSession sqlSession;
		
	String PHOTOUPLOADPATH = "C:\\Users\\LEE NANA\\git\\Team-Submarine3\\JourneyDiary_0913\\src\\main\\webapp\\resources\\img\\photo\\";
	String ALBUMUPLOADPATH = "C:\\Users\\LEE NANA\\git\\Team-Submarine3\\JourneyDiary_0913\\src\\main\\webapp\\resources\\img\\album\\";
	String PHOTOLINKPATH = "./resources/img/photo/";
	String ALBUMLINKPATH = "./resources/img/album/";
	
	
		@RequestMapping(value = "/showAlbum", method = RequestMethod.GET)
		public String intro(Locale locale, Model model, HttpSession session) {
			

			int userno = (Integer) session.getAttribute("userno");

			AlbumMapper albumMapper = sqlSession.getMapper(AlbumMapper.class);
			ArrayList<Album> albumList = new ArrayList<Album>();
			albumList = albumMapper.getAlbumList(userno);

			model.addAttribute("albumList", albumList);
			model.addAttribute("albumsrc", ALBUMLINKPATH);
			
			return "album/albumList";

		}
		
		@RequestMapping(value = "/createAlbum", method = RequestMethod.GET)
		public String createAlbum(Locale locale, Model model, HttpSession session) {
			
			return "album/createAlbum";

		}
		
		
		@RequestMapping(value = "/createAlbum", produces = "application/text; charset=utf8", method = RequestMethod.POST)
		public String makeAlbum(HttpSession session, Album album, MultipartFile uploadfile) {
			
			int userno = (int)session.getAttribute("userno");
			
			
			AlbumMapper albumMapper = sqlSession.getMapper(AlbumMapper.class);
			
			UUID uuid = UUID.randomUUID();
			
			String saveFileName = uuid + "_" + uploadfile.getOriginalFilename();
			
			File saveFile = new File(ALBUMUPLOADPATH, saveFileName);
			
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
			album.setUserno(userno);
			album.setAlbumimg(saveFileName);
			
			albumMapper.createAlbum(album);
			return "redirect:/showAlbum";

		}
		
		
		@RequestMapping(value = "/myPhotoList", method = RequestMethod.GET)
		public String photoList(Locale locale, Model model, HttpSession session, int albumno) {
			
			PhotoMapper manager = sqlSession.getMapper(PhotoMapper.class);
			List<Photo> photoList = manager.getAlbumPhoto(albumno);
			
			model.addAttribute("albumno", albumno);
			model.addAttribute("photoList", photoList);
			model.addAttribute("Photosrc", PHOTOLINKPATH);
			
			return "photo/photoList";

		}
		
		
		@RequestMapping(value = "/alterAlbum", method = RequestMethod.GET)
		public String alterAlbum(Locale locale, Model model, HttpSession session, int albumno) {
			
			int userno = (int)session.getAttribute("userno");
			
			AlbumMapper manager = sqlSession.getMapper(AlbumMapper.class);
			Album album = new Album();
			album.setAlbumno(albumno);
			album.setUserno(userno);
			
			Album result = manager.getAlbum(album);
			model.addAttribute("Albumsrc", ALBUMLINKPATH);
			model.addAttribute("Album", result);
			

			return "album/alterAlbum";

		}
		
		@RequestMapping(value = "/alterAlbum", method = RequestMethod.POST)
		public String changeAlbum(Locale locale, Model model, HttpSession session, Album album, MultipartFile uploadfile) {
			
			int userno = (int)session.getAttribute("userno");
			
			AlbumMapper manager = sqlSession.getMapper(AlbumMapper.class);
			album.setUserno(userno);
			
			UUID uuid = UUID.randomUUID();
			
			String saveFileName = uuid + "_" + uploadfile.getOriginalFilename();
			
			File saveFile = new File(ALBUMUPLOADPATH, saveFileName);
			
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
			album.setAlbumimg(saveFileName);
			
			
			
			manager.alterAlbum(album);

			return "redirect:showAlbum";

		}
		
		
		@RequestMapping(value = "/deleteAlbum", method = RequestMethod.GET)
		public String deleteAlbum(Locale locale, Model model, HttpSession session, int albumno) {
			
			int userno = (int)session.getAttribute("userno");
			
			int result = 0;
			AlbumMapper albumMapper = sqlSession.getMapper(AlbumMapper.class);
		    result = albumMapper.deleteAlbum(albumno);
		    
		    List<Album> albumList = albumMapper.getAlbumList(userno);
		    
		    model.addAttribute("albumList", albumList);
			return "redirect:showAlbum";

		}
		
	}
