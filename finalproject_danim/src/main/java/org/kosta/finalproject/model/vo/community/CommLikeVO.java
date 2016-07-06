package org.kosta.finalproject.model.vo.community;

public class CommLikeVO {
	private int comm_no;
	private String id;
	private String nickname;
	private int likePosted;
	private int heart;
	private String content;
	public CommLikeVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CommLikeVO(int comm_no) {
		super();
		this.comm_no = comm_no;
	}

	public CommLikeVO(int comm_no, String id) {
		super();
		this.comm_no = comm_no;
		this.id = id;
	}

	public CommLikeVO(int comm_no, String id, int likePosted) {
		super();
		this.comm_no = comm_no;
		this.id = id;
		this.likePosted = likePosted;
	}
	
	public CommLikeVO(int comm_no, String id, String nickname, int likePosted,
			int heart, String content) {
		super();
		this.comm_no = comm_no;
		this.id = id;
		this.nickname = nickname;
		this.likePosted = likePosted;
		this.heart = heart;
		this.content = content;
	}

	public int getComm_no() {
		return comm_no;
	}
	public void setComm_no(int comm_no) {
		this.comm_no = comm_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getLikePosted() {
		return likePosted;
	}
	public void setLikePosted(int likePosted) {
		this.likePosted = likePosted;
	}
	
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getHeart() {
		return heart;
	}

	public void setHeart(int heart) {
		this.heart = heart;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "CommLikeVO [comm_no=" + comm_no + ", id=" + id + ", nickname="
				+ nickname + ", likePosted=" + likePosted + ", heart=" + heart
				+ ", content=" + content + "]";
	}

	
}
