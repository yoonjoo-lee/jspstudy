package jspstudy.controller;

import java.io.IOException;
import java.net.InetAddress;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jspstudy.domain.BoardVo;
import jspstudy.domain.Criteria;
import jspstudy.domain.PageMaker;
import jspstudy.service.BoardDao;


@WebServlet("/BoardController")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String uri = request.getRequestURI();		
		String pj= request.getContextPath();	
		String command= uri.substring(pj.length());
		System.out.println("command:"+command);
		
		if (command.equals("/board/boardWrite.do")){
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardWrite.jsp");
			rd.forward(request, response);
			
		}else if (command.equals("/board/boardWriteAction.do")) {
			
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String writer = request.getParameter("writer");
			System.out.println(subject);
			String ip = InetAddress.getLocalHost().getHostAddress();
			
			HttpSession session = request.getSession();
			int midx = (int)session.getAttribute("midx");
			
			BoardDao bd = new BoardDao();
			int value = bd.insertBoard(subject, content, writer, ip, midx);
			System.out.println(value);
			if (value ==1) {
				response.sendRedirect(request.getContextPath()+"/index.jsp");				
			}else {
				response.sendRedirect(request.getContextPath()+"/board/boardWrite.do");				
			}			
		}else if (command.equals("/board/boardList.do")) {
			System.out.println("리스트 들어왔음");
			
			String page = request.getParameter("page");
			if (page == null) page ="1";
			int pagex= Integer.parseInt(page);
			
			//처리			
			BoardDao bd = new BoardDao();
			int cnt = bd.boardTotal();
			
			Criteria cri = new Criteria();
			cri.setPage(pagex);
			
			PageMaker pm = new PageMaker();
			pm.setCri(cri);
			pm.setTotalCount(cnt);			
			
			ArrayList<BoardVo> alist = bd.boardSelectAll(cri);
			request.setAttribute("alist", alist);   //데이터(자원) 공유
			request.setAttribute("pm", pm);
			
			
			//이동
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardList.jsp");					
			rd.forward(request, response);
			
		}else if (command.equals("/board/boardContent.do")) {
			System.out.println("내용보기 들어왔음");
			//1.파라미터가 넘어옴
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);
			
			//2. 처리함
			BoardDao bd = new BoardDao();
			BoardVo bv = bd.boardSelectOne(bidx_);
			
			request.setAttribute("bv", bv);		//내부적으로 자원공유	
			
			//3.이동함			
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardContent.jsp");					
			rd.forward(request, response);
			
		}else if (command.equals("/board/boardModify.do")) {
			
			System.out.println("수정 들어왔음");
			//1.파라미터가 넘어옴
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);
			
			//2. 처리함
			BoardDao bd = new BoardDao();
			BoardVo bv = bd.boardSelectOne(bidx_);
			
			request.setAttribute("bv", bv);		//내부적으로 자원공유	
			
			//3.이동함			
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardModify.jsp");					
			rd.forward(request, response);		
			
		}else if (command.equals("/board/boardModifyAction.do")) {
			
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String writer = request.getParameter("writer");
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);
			
			String ip = InetAddress.getLocalHost().getHostAddress();
			HttpSession session = request.getSession();
			int midx = (int)session.getAttribute("midx");
			
			BoardDao bd = new BoardDao();
			int value = bd.updateBoard(subject, content, writer, ip, midx,bidx_);
			System.out.println(value);
			if (value ==1) {
				response.sendRedirect(request.getContextPath()+"/board/boardContent.do?bidx="+bidx);				
			}else {
				response.sendRedirect(request.getContextPath()+"/board/boardModify.do?bidx="+bidx);				
			}	
			
			
		}else if (command.equals("/board/boardDelete.do")) {
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);
			
			request.setAttribute("bidx", bidx);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardDelete.jsp");					
			rd.forward(request, response);
			
		}else if (command.equals("/board/boardDeleteAction.do")) {
			
		
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);
						
			BoardDao bd = new BoardDao();
			int value = bd.deleteBoard(bidx_);
	
			if (value ==1) {
				response.sendRedirect(request.getContextPath()+"/board/boardList.do");				
			}else {
				response.sendRedirect(request.getContextPath()+"/board/boardContent.do?bidx="+bidx);				
			}	
		}else if (command.equals("/board/boardReply.do")) {
			
			String bidx = request.getParameter("bidx");
			String originbidx = request.getParameter("originbidx");
			String depth = request.getParameter("depth");
			String level_ = request.getParameter("level_");
			
			BoardVo bv = new BoardVo();
			bv.setBidx(Integer.parseInt(bidx));
			bv.setOriginbidx(Integer.parseInt(originbidx));
			bv.setDepth(Integer.parseInt(depth));
			bv.setLevel_(Integer.parseInt(level_));
			
			request.setAttribute("bv", bv);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardReply.jsp");					
			rd.forward(request, response);
			
		} else if (command.equals("/board/boardReplyAction.do")) {
			
			String bidx = request.getParameter("bidx");
			String originbidx = request.getParameter("originbidx");
			String depth = request.getParameter("depth");
			String level_ = request.getParameter("level_");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			String writer = request.getParameter("writer");
			String ip = InetAddress.getLocalHost().getHostAddress();
			HttpSession session = request.getSession();
			int midx = (int)session.getAttribute("midx");
			
			BoardVo bv = new BoardVo();
			bv.setBidx(Integer.parseInt(bidx));
			bv.setOriginbidx(Integer.parseInt(originbidx));
			bv.setDepth(Integer.parseInt(depth));
			bv.setLevel_(Integer.parseInt(level_));
			bv.setSubject(subject);
			bv.setContent(content);
			bv.setWriter(writer);
			bv.setIp(ip);
			bv.setMidx(midx);
			
			BoardDao bd = new BoardDao();
			int value = bd.replyBoard(bv);
			
			if (value ==1) {
				response.sendRedirect(request.getContextPath()+"/board/boardList.do");
			} else {
				response.sendRedirect(request.getContextPath()+"/board/boardContent.do?bidx="+bidx);
			}
			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
