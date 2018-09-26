package journey.diary.test.DAO;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import journey.diary.test.VO.Photo;
import journey.diary.test.VO.Uploadimage;

public interface PhotoMapper {
	public List<Photo> getPhotoList(Photo searchText, RowBounds rb);
	public List<Photo> getPhotoListTwo(int photono);
	public List<Photo> listAll();
	public List<Photo> getAlbumPhoto(int albumno);
	public Photo selectOnePhoto(int photono);
	public int photoUpload(Photo photo);
	public int uploadimg(Uploadimage image);
	public int alterPhoto(Photo photo);
	public int deletePhoto(int photono);
	public int getTotalCount(Photo searchText);
	public List<Photo> getBestPhotos();
	public int hitCount(int photono);
	public int likeCount(int photono);
}
