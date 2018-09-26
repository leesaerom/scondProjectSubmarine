package journey.diary.test.VO;

/*
 * 임시 VO 
 * */

public class Uploadimage {
	private int imgseq;
	private String originalfilename;
	private String savedfilename;

	public Uploadimage() {
	}

	public Uploadimage(int imgseq, String originalfilename, String savedfilename) {
		super();
		this.imgseq = imgseq;
		this.originalfilename = originalfilename;
		this.savedfilename = savedfilename;
	}

	public int getImgseq() {
		return imgseq;
	}

	public void setImgseq(int imgseq) {
		this.imgseq = imgseq;
	}

	public String getOriginalfilename() {
		return originalfilename;
	}

	public void setOriginalfilename(String originalfilename) {
		this.originalfilename = originalfilename;
	}

	public String getSavedfilename() {
		return savedfilename;
	}

	public void setSavedfilename(String savedfilename) {
		this.savedfilename = savedfilename;
	}

	@Override
	public String toString() {
		return "Image [imgseq=" + imgseq + ", originalfilename=" + originalfilename + ", savedfilename=" + savedfilename
				+ "]";
	}

}
