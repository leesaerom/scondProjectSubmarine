package journey.diary.test.VO;

public class Photo {
	private int photono;
	private int albumno;
	private int userno;
	private String privacy;
	private String photoimg;
	private String photocontent;
	private String keyword;
	private String landmark;
	private String hashtag;
	private String dateoftravel; //여행기간
	private String lat;
	private String lng;
	private int hitcount;
	private int likecount;

	public Photo() {
	}

	public int getPhotono() {
		return photono;
	}

	public void setPhotono(int photono) {
		this.photono = photono;
	}

	public int getAlbumno() {
		return albumno;
	}

	public void setAlbumno(int albumno) {
		this.albumno = albumno;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getPrivacy() {
		return privacy;
	}

	public void setPrivacy(String privacy) {
		this.privacy = privacy;
	}

	public String getPhotoimg() {
		return photoimg;
	}

	public void setPhotoimg(String photoimg) {
		this.photoimg = photoimg;
	}

	public String getPhotocontent() {
		return photocontent;
	}

	public void setPhotocontent(String photocontent) {
		this.photocontent = photocontent;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getLandmark() {
		return landmark;
	}

	public void setLandmark(String landmark) {
		this.landmark = landmark;
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

	public String getDateoftravel() {
		return dateoftravel;
	}

	public void setDateoftravel(String dateoftravel) {
		this.dateoftravel = dateoftravel;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public int getHitcount() {
		return hitcount;
	}

	public void setHitcount(int hitcount) {
		this.hitcount = hitcount;
	}

	public int getLikecount() {
		return likecount;
	}

	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}

	@Override
	public String toString() {
		return "Photo [photono=" + photono + ", albumno=" + albumno + ", userno=" + userno + ", privacy=" + privacy
				+ ", photoimg=" + photoimg + ", photocontent=" + photocontent + ", keyword=" + keyword + ", landmark="
				+ landmark + ", hashtag=" + hashtag + ", dateoftravel=" + dateoftravel + ", lat=" + lat + ", lng=" + lng
				+ ", hitcount=" + hitcount + ", likecount=" + likecount + "]";
	}

	
	
	
}


