import classes from "./BoardWritePage.module.scss";

import { useState, useRef, useMemo, useEffect } from "react";
import { useSelector as useReduxSelector } from "react-redux";

import ReactQuill from "react-quill";
import "react-quill/dist/quill.snow.css";

import axios from "../../../common/axiosInstance";

import { SERVER_URL, ADMIN_EMAIL } from "../../../common/ServerConstant";
import BackwardButton from "../../login/buttons/BackwardButton";
import { RiDatabase2Line } from "react-icons/ri";
import { createSearchParams } from "react-router-dom";
import base64toFormData from "../../../common/base64toFormData";

const BACK_URL = SERVER_URL;

const BoardWritePage = () => {
  const quillRef = useRef<ReactQuill>();

  const [title, setTitle] = useState("");
  // category : 1 = 자유
  const [category, setCategory] = useState(1);
  const [content, setContent] = useState("");
  const [boardNo, setBoardNo] = useState();
  const [fileName, setFileName] = useState("");
  const [file, setFile] = useState<React.ChangeEvent<HTMLInputElement>>();

  const isAdminLoggedIn =
    useReduxSelector(
      (state: { login: { email: string } }) => state.login.email
    ) === ADMIN_EMAIL
      ? true
      : false;
  const userEmail = useReduxSelector(
    (state: { login: { email: string } }) => state.login.email
  );
  const userName = useReduxSelector(
    (state: { login: { name: string } }) => state.login.name
  );

  useEffect(() => {
    axios
      .get("/quill/bno")
      .then((response) => {
        const boardNo = response.data;

        setBoardNo(boardNo);
      })
      .catch((error) => {});
  }, []);

  // quill 에디터의 image 업로드 기능 함수
  const imageHandler = () => {
    const input = document.createElement("input");
    input.setAttribute("type", "file");
    input.setAttribute("accept", "image/*");
    input.click();
    input.onchange = async () => {
      const file = input.files;
      if (file !== null) {
        try {
          // *.파일을 base64로 변환
          const fileReader = new FileReader();
          fileReader.readAsDataURL(file[0]);

          fileReader.onload = async () => {
            let base64 = "";
            if (typeof fileReader.result === "string")
              base64 = fileReader.result;

            let url: string = base64;

            const editor = quillRef.current?.getEditor();

            const range = editor?.getSelection()?.index;

            editor?.insertEmbed(range ?? 0, "image", url);
          };
        } catch (error) {}
      }
    };
  };

  const modules = useMemo(() => {
    return {
      toolbar: {
        container: [
          ["image"],
          [{ header: [1, 2, 3, false] }],
          ["bold", "italic", "underline", "strike", "blockquote"],
        ],
        handlers: {
          image: imageHandler,
        },
      },
    };
  }, []);

  // File input - 변경 함수
  const onFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const fileTmp = e.target.value;

    const fileName = fileTmp.substring(fileTmp.lastIndexOf("\\") + 1);

    // 1. 파일 이름 저장
    setFileName(fileName);
    // 2. 파일 저장
    setFile(e);
  };

  // Title input - 변경 함수
  const onTitleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const titleTmp = e.target.value;

    // 제목이 50글자 넘을 경우 입력 중단
    if (titleTmp.length > 50) return;

    setTitle(titleTmp);
  };

  // Select input - 변경 함수
  const onCategoryChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    const categoryTmp = parseInt(e.target.value);

    // console.log("category",categoryTmp);

    setCategory(categoryTmp);
  };

  const onWriteSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    // 1.1. 제목이 비어있을 경우 submit 중지
    if (title.trim().length === 0) {
      alert("제목을 입력해주세요.");
      return;
    }

    // 1.2. 내용이 비어있을 경우 submit 중지
    if (content.trim().length === 0) {
      alert("내용을 입력해주세요.");
      return;
    }

    const confirmSelect = confirm("게시글을 작성하시겠습니까?");
    if(!confirmSelect) return;

    // 2. 이미지 photoNo 모두 한 배열에 담기
    const photoNoArr = new Array();
    let index = 0;
    let contentChanged = content;
    while (true) {
      let startIndex = contentChanged.indexOf("<img src=", index + 1);
      if (startIndex === -1) break;
      let endIndex = contentChanged.indexOf(">", startIndex);

      let imgStr = contentChanged.substring(startIndex, endIndex + 1);

      let srcIdx = imgStr.indexOf("src=") + 5;
      let srcEndIdx = imgStr.indexOf('"', srcIdx);
      let base64 = imgStr.substring(srcIdx, srcEndIdx);

      const formData = base64toFormData(base64);

      const response = await axios.post("/quill/image", formData);
      const photoNo = response.data.photoNo;
      const image = `<img src="${BACK_URL}/board/imageDown?photoNo=${photoNo}" />`;

      contentChanged =
        contentChanged.substring(0, startIndex) +
        image +
        contentChanged.substring(endIndex + 1);

      photoNoArr.push(photoNo);
      index = startIndex;
    }

    // 3. boardNo 와 photoNo 연결하기
    if (photoNoArr.length !== 0) {
      axios
        .put(`/quill/imageNo`, {
          boardNo,
          photoNo: JSON.stringify(photoNoArr),
        })
        .then((response) => {
          // console.log(response);
        })
        .catch((error) => {
          // console.log(error)
        });
    }

    // 4. file 업로드하기
    //  - 파일이 있을 경우 업로드(fileName이 사라진 경우 업로드 중단)
    // fileNo = 파일이 있을 경우 파일 번호를 받아서 처리하기.
    let fileNo: number | undefined;
    const formDataFile = new FormData();
    if (file?.target.files) formDataFile.append("file", file?.target.files[0]);
    if (file && fileName) {
      const response = await axios.post("/quill/file", formDataFile);
      fileNo = response.data;
    }

    // 5. fileNo와 boardNo 연결해서 업로드하기
    if (fileNo) {
      axios
        .put("/quill/fileNo", {
          boardNo,
          fileNo,
        })
        .then((response) => {
          // console.log(response);
        })
        .catch((error) => {
          // console.log(error);
        });
    }

    // 6. 내용 db에 전송
    axios
      .post("/quill/board", {
        boardNo,
        category,
        title,
        content : contentChanged,
        name: userName,
        email: userEmail,
      })
      .then((response) => {
        // console.log(response);
        alert("게시글을 작성하였습니다.");

        //navigate해서 게시글 보기 페이지로 이동하기.

      })
      .catch((error) => {
        // console.log(error);
      });
  };

  return (
    <form className={classes.board_write_page} onSubmit={onWriteSubmit}>
      <div className={classes.board_title_box}>
        <select
          className={classes.board_title_select}
          onChange={onCategoryChange}
          value={category}
        >
          {isAdminLoggedIn && <option value="0">공지</option>}
          <option value="1">자유</option>
          <option value="2">견적</option>
        </select>
        <input
          type="text"
          className={classes.board_title_input}
          placeholder="제목을 입력해 주세요."
          onChange={onTitleChange}
          value={title}
        />
      </div>
      <ReactQuill
        className={classes.react_quill}
        ref={(element) => {
          if (element !== null) {
            quillRef.current = element;
          }
        }}
        value={content}
        onChange={setContent}
        modules={modules}
        theme="snow"
      />
      <div className={classes.board_file_box}>
        <label htmlFor="file" className={classes.board_file_label}>
          파일 업로드
        </label>
        <input
          type="file"
          className={classes.board_file_input}
          id="file"
          onChange={onFileChange}
        />
        {fileName && (
          <>
            {" "}
            <RiDatabase2Line className={classes.board_file_icon} />{" "}
            <span className={classes.board_file_span}> {fileName} </span>{" "}
          </>
        )}
      </div>
      <div>
        <button className={classes.board_write_btn}>글 작성</button>
        <BackwardButton path={"/board"} />
      </div>
    </form>
  );
};

export default BoardWritePage;
