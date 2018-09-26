package journey.diary.test.VO;

public class Album {
	private int albumno;
	private int userno;
	private String albumtitle;
	private String albumintro;
	private String privacy;
	private String albumimg;
	private String startdate;
	private String enddate;
	private String regdate;
	
	public Album() {
		
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

	public String getAlbumtitle() {
		return albumtitle;
	}

	public void setAlbumtitle(String albumtitle) {
		this.albumtitle = albumtitle;
	}

	public String getAlbumintro() {
		return albumintro;
	}

	public void setAlbumintro(String albumintro) {
		this.albumintro = albumintro;
	}

	public String getPrivacy() {
		return privacy;
	}

	public void setPrivacy(String privacy) {
		this.privacy = privacy;
	}

	public String getAlbumimg() {
		return albumimg;
	}

	public void setAlbumimg(String albumimg) {
		this.albumimg = albumimg;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "Album [albumno=" + albumno + ", userno=" + userno + ", albumtitle=" + albumtitle + ", albumintro="
				+ albumintro + ", privacy=" + privacy + ", albumimg=" + albumimg + ", startdate=" + startdate
				+ ", enddate=" + enddate + ", regdate=" + regdate + "]";
	}


	
	
}
