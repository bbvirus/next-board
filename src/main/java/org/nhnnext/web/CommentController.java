package org.nhnnext.web;

import org.nhnnext.repository.BoardRepository;
import org.nhnnext.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CommentController {

	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private CommentRepository commentRepository;
	
	@RequestMapping(value="/board/{id}/comment", method=RequestMethod.POST)
	public String create(@PathVariable Long id, String contents) {
		Board board = boardRepository.findOne(id);
		Comment comment = new Comment(contents, board);
		commentRepository.save(comment);
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/board/{id}/comment/{commentId}/delete", method=RequestMethod.POST)
	public String delete(@PathVariable Long commentId){
		commentRepository.delete(commentId);
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/board/{id}/comments.json", method=RequestMethod.POST)
	public @ResponseBody Comment createAndShow(@PathVariable Long id, String contents) {
		Board board = boardRepository.findOne(id);
		Comment comment = new Comment(contents, board);
		System.out.println("djfksdjklfjslkdjflksdf");
		return commentRepository.save(comment);
	}
	
}