package org.kosta.finalproject.model.vo.message;

import org.kosta.finalproject.model.vo.member.MemberVO;

public class MessageVO {
	private int message_no;
	private String title;
	private String content;
	private MemberVO recvVO;
	private MemberVO sendVO;
	private String mess_date;
	private int read_acc;
	private String read_del;
	private String send_del;
	
	public MessageVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MessageVO(int message_no, String title, String content,
			MemberVO recvVO, MemberVO sendVO, String mess_date, int read_acc,
			String read_del, String send_del) {
		super();
		this.message_no = message_no;
		this.title = title;
		this.content = content;
		this.recvVO = recvVO;
		this.sendVO = sendVO;
		this.mess_date = mess_date;
		this.read_acc = read_acc;
		this.read_del = read_del;
		this.send_del = send_del;
	}

	public int getMessage_no() {
		return message_no;
	}

	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public MemberVO getRecvVO() {
		return recvVO;
	}

	public void setRecvVO(MemberVO recvVO) {
		this.recvVO = recvVO;
	}

	public MemberVO getSendVO() {
		return sendVO;
	}

	public void setSendVO(MemberVO sendVO) {
		this.sendVO = sendVO;
	}

	public String getMess_date() {
		return mess_date;
	}

	public void setMess_date(String mess_date) {
		this.mess_date = mess_date;
	}

	public int getRead_acc() {
		return read_acc;
	}

	public void setRead_acc(int read_acc) {
		this.read_acc = read_acc;
	}

	public String getRead_del() {
		return read_del;
	}

	public void setRead_del(String read_del) {
		this.read_del = read_del;
	}

	public String getSend_del() {
		return send_del;
	}

	public void setSend_del(String send_del) {
		this.send_del = send_del;
	}

	@Override
	public String toString() {
		return "MessageVO [message_no=" + message_no + ", title=" + title
				+ ", content=" + content + ", recvVO=" + recvVO + ", sendVO="
				+ sendVO + ", mess_date=" + mess_date + ", read_acc="
				+ read_acc + ", read_del=" + read_del + ", send_del="
				+ send_del + "]";
	}
	
	
}
