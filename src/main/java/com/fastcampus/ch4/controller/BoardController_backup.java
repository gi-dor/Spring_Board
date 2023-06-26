package com.fastcampus.ch4.controller;

import com.fastcampus.ch4.domain.BoardDto;
import com.fastcampus.ch4.domain.PageHandler;
import com.fastcampus.ch4.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/board")
public class BoardController {
@Autowired
BoardService boardService;

    @PostMapping("/modify")
    public String modify(BoardDto boardDto, HttpSession session,Model m,RedirectAttributes rattr){
        String writer = (String)session.getAttribute("id");
        boardDto.setWriter(writer);

        try {
            int rowCnt = boardService.modify(boardDto);

            if(rowCnt!=1)
                throw new Exception("Modify failed");

            rattr.addFlashAttribute("msg","Modify_OK");

            return "redirect:/board/list";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("boardDto",boardDto);
            m.addAttribute("msg","Modify_Error");

            return "board";
        }

    }







@PostMapping("/write")
public String write(BoardDto boardDto, HttpSession session,Model m,RedirectAttributes rattr){
    String writer = (String)session.getAttribute("id");
    boardDto.setWriter(writer);

        try {
            int rowCnt = boardService.write(boardDto);

            if(rowCnt!=1)
                throw new Exception("write failed");

            rattr.addFlashAttribute("msg","Write_OK");

            return "redirect:/board/list";
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("boardDto",boardDto);
            m.addAttribute("msg","Write_Error");


            return "board";
        }

    }


@GetMapping("/write")
public String write(Model m){
    m.addAttribute("mode" , "new");

    return "board"; // 읽기와 쓰기에 사용 , 쓰기에 사용할때는 mode = new
}



@PostMapping("/remove")
public String remove(Integer bno , Integer page ,Integer pageSize , Model m,HttpSession session,RedirectAttributes rattr){
    String writer = (String)session.getAttribute("id");
    try {
        m.addAttribute("page",page);
        m.addAttribute("pageSize",pageSize);

        int rowCnt =  boardService.remove(bno,writer);

        if(rowCnt != 1)
            throw new Exception("board remove error");

            rattr.addFlashAttribute("msg","DELETE_OK");
    } catch (Exception e) {
        e.printStackTrace();
        rattr.addFlashAttribute("msg","DELETE_ERROR");
    }

    return "redirect:/board/list";
}


@GetMapping("/read")
public String read(Integer bno,Integer page , Integer pageSize ,Model m)throws Exception{
    try {
      BoardDto boardDto = boardService.read(bno);
      m.addAttribute(boardDto);
      m.addAttribute("page",page);
      m.addAttribute("pageSize",pageSize);
    } catch (Exception e) {
      e.printStackTrace();
    }

    return "board";
}

    @GetMapping("/list")
    public String list(Integer page, Integer pageSize, Model m , HttpServletRequest request){
        if(!loginCheck(request))
            return "redirect:/login/login?toURL="+request.getRequestURL();  // 로그인을 안했으면 로그인 화면으로 이동

        if (page==null) page = 1;
        if(pageSize==null) pageSize = 10;

        try {
            // 페이지 핸들러  << < 1,2,3,4,5,6,7,8,9,10 > >>
            int totalCnt = boardService.getCount();
            PageHandler pageHandler = new PageHandler(totalCnt, page, pageSize);


            Map map = new HashMap();
            map.put("offset",(page-1)*pageSize);
            map.put("pageSize",pageSize);

           List<BoardDto> list =  boardService.getPage(map);
           m.addAttribute("list",list);
           m.addAttribute("ph",pageHandler);
           m.addAttribute("page",page);
           m.addAttribute("pageSize",pageSize);
          } catch (Exception e) {
           e.printStackTrace();
        }


        return "boardList"; // 로그인을 한 상태이면, 게시판 화면으로 이동
    }

    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서
        HttpSession session = request.getSession();
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session.getAttribute("id")!=null;
    }

}
