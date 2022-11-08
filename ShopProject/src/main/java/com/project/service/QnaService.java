package com.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.dto.FileDTO;
import com.project.dto.FileImageDTO;
import com.project.dto.QnADTO;
import com.project.dto.QnaimgeDTO;
import com.project.dto.QnareplyDTO;
import com.project.mapper.MemberMapper;
import com.project.mapper.QnAMapper;

@Service
public class QnaService {
	private QnAMapper qnamapper;

	public QnaService(QnAMapper qnamapper) {
		this.qnamapper = qnamapper;
	}

	public int insertBoard(QnADTO qnadto) {
		int qno = qnamapper.selectBoardNo();
		qnadto.setQno(String.valueOf(qno));
		qnamapper.insertBoard(qnadto);
		return qno;
	}

	public int insertFileList(FileImageDTO fileDTO) {
		return qnamapper.insertFileList(fileDTO);
	}

	public List<QnADTO> Allqnalist() {
		return qnamapper.Allqnalist();
	}

	public QnADTO serqnaview(String qno) {
		return qnamapper.serqnaview(qno);
	}

	public QnADTO selectqnaDTO(int qno) {
		return qnamapper.selectqnaDTO(qno);
	}

	public List<FileDTO> selectFileList(int qno) {
		return qnamapper.selectFileList(qno);
	}

	public List<QnareplyDTO> selectqnarepiyDTO(int qno) {
		return qnamapper.selectqnarepiyDTO(qno);
	}

	public int insertqnaDTO(QnareplyDTO qnareplydto) {
		return qnamapper.insertqnaDTO(qnareplydto);

	}

	public int insertqnaComment(QnareplyDTO dto) {
		return qnamapper.insertqnaComment(dto);
	}

}
