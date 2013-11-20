package org.nhnnext.web;

import java.util.Collections;
import java.util.List;

import org.nhnnext.repository.BoardRepository;
import org.nhnnext.support.FileUploader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/board")
public class BoardController {
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardRepository boardRepository;
	
	// 글쓰기 창으로 넘어가게 해준다.
	@RequestMapping("/form")
	public String form() {
		return "form";
	}
	
	// 글쓰기 창에서 입력한 내용(board의 title, contents, file)을 전달받아
	// 1. file을 업로드하고
	// 2. board를 boardRepository에 저장시킨다.
	@RequestMapping(value="", method=RequestMethod.POST)
	public String create(Board board, MultipartFile firstFile, MultipartFile secondFile) {
		log.warn("board : {}", board);
		String firstFileName = FileUploader.upload(firstFile);
		String secondFileName = FileUploader.upload(secondFile);
		board.setFirstFileName(firstFileName);
		board.setSecondFileName(secondFileName);
		boardRepository.save(board);
		return "redirect:/board/list";
	}
	
	// 글의 id값을 인자로 받아서 글 내용을 보여주는 창으로 넘어가게 해준다.
	@RequestMapping("/{id}")
	public String show(@PathVariable Long id, Model model){
		Board loadedBoard = boardRepository.findOne(id);
		model.addAttribute("board", loadedBoard);
		return "show";
	}
	
	// 리스트 페이지를 열기 위해서 boardRepository에서 모든 글들을 꺼내와서
	// model을 통해 넘겨주고 list.jsp를 연다.
	@RequestMapping("/list")
	public String list(Model model) {
		List<Board> boardList = (List<Board>) boardRepository.findAll();
		Collections.reverse(boardList);
		model.addAttribute("boardList", boardList);
		return "list";
	}
	
	// 해당되는 id의 글을 수정하도록, modify페이지를 열게 해준다.
	@RequestMapping("/{id}/modify")
	public String modify(@PathVariable Long id, Model model){
		Board loadedBoard = boardRepository.findOne(id);
		model.addAttribute("board", loadedBoard);
		return "modify";
	}
	
	// 수정된 내용이 새롭게 반영되도록 작성된 내용들을 다시 저장한다.
	@RequestMapping("/{id}/modifyForm")
	public String modifyForm(@PathVariable Long id, Board board, MultipartFile firstFile, MultipartFile secondFile){
		String newFirstFileName = FileUploader.upload(firstFile);
		String newSecondFileName = FileUploader.upload(secondFile);
		Board srcBoard = boardRepository.findOne(id);
		
		srcBoard.setTitle(board.getTitle());
		srcBoard.setContents(board.getContents());
		srcBoard.setFirstFileName(newFirstFileName);
		srcBoard.setSecondFileName(newSecondFileName);
		
		boardRepository.save(srcBoard);
		
		return "redirect:/board/" + id;
	}
	
	// 글을 삭제한다.
	@RequestMapping("/{id}/delete")
	public String delete(@PathVariable Long id){
		boardRepository.delete(id);
		return "redirect:/board/list";
	}
	
}