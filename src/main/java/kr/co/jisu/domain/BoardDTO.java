/*
 * board bean 클래스 필드 생성자 getter setter 
 * ->loombok 라이브러리로 간소화 가능 - @getter @setter @toString
 * 
 */


package kr.co.jisu.domain;

public class BoardDTO {
	private int bno;
	private String title;
	private String contents;
	private String id;
	private String regdate;
	private int readcnt;
	private String etc;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setDatetime(String regdate) {
		this.regdate = regdate;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	@Override
	public String toString() {
		return "BoardDTO [bno=" + bno + ", title=" + title + ", contents=" + contents + ", id=" + id + ", datetime="
				+ regdate + ", readcnt=" + readcnt + ", etc=" + etc + "]";
	}

}
