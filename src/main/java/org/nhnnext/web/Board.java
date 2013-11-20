package org.nhnnext.web;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Board{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long id;
	
	@Column(length=100, nullable=false)
	private String title;
	
	@Column(length=5000, nullable=false)
	private String contents;
	
	@Column(length=300)
	private String firstFileName;
	
	@Column(length=300)
	private String secondFileName;
	
	public String getFirstFileName() {
		return firstFileName;
	}

	public void setFirstFileName(String firstFileName) {
		this.firstFileName = firstFileName;
	}

	public String getSecondFileName() {
		return secondFileName;
	}

	public void setSecondFileName(String secondFileName) {
		this.secondFileName = secondFileName;
	}

	@OneToMany(mappedBy = "board", fetch = FetchType.EAGER)
	private List<Comment> commentList;
	
	public void setCommentList(Comment newComment){
		commentList.add(newComment);
	}
	
	public List<Comment> getCommentList(){
		return commentList;
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
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	@Override
	public String toString() {
		return "Board [title=" + title + ", contents=" + contents + "]";
	}
	
}
