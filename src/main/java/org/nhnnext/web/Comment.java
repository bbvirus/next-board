package org.nhnnext.web;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.codehaus.jackson.annotate.JsonIgnore;

@Entity
public class Comment {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private long id;
	
	@Column(length=5000, nullable=false)
	private String contents;
	
	@ManyToOne
	@JsonIgnore
	private Board board;
	
	public Comment(){}
	
	public Comment(String contents, Board board) {
		this.contents = contents;
		this. board = board;
	}

	public Long getId(){
		return this.id;
	}
	
	public Board getBoard(){
		return board;
	}
	
	public void setContents(String contents){
		this.contents = contents;
	}
	public String getContents(){
		return contents;
	}
	
}