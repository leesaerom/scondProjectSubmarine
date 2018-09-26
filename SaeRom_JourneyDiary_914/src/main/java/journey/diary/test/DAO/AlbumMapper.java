package journey.diary.test.DAO;


import java.util.ArrayList;

import journey.diary.test.VO.Album;


public interface AlbumMapper {

	public ArrayList<Album> getAlbumList(int memberno);
	public int createAlbum(Album album);
	public Album getAlbum (Album album);
	public int alterAlbum(Album album);
	public int deleteAlbum(int albumno);
}
