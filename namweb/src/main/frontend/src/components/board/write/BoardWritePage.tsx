import classes from "./BoardWritePage.module.scss";

import { useState, useRef, useMemo, useEffect } from "react";
import { useSelector as useReduxSelector } from "react-redux";

import ReactQuill from "react-quill";
import "react-quill/dist/quill.snow.css";

import axios from "../../../common/axiosInstance";

import { SERVER_URL, ADMIN_EMAIL } from "../../../common/ServerConstant";
import BackwardButton from "../../login/buttons/BackwardButton";
import { RiDatabase2Line } from "react-icons/ri";

const BACK_URL = SERVER_URL;

const BoardWritePage = () => {
  const quillRef = useRef<ReactQuill>();
  const [content, setContent] = useState("");
  const [boardNo, setBoardNo] = useState();
  const [fileName, setFileName] = useState("");
  const [file, setFile] = useState("");

  const isAdminLoggedIn =
    useReduxSelector(
      (state: { login: { email: string } }) => state.login.email
    ) === ADMIN_EMAIL
      ? true
      : false;

  useEffect(() => {
    axios
      .get("/quill/bno")
      .then((response) => {
        const boardNo = response.data;

        console.log(boardNo);
        setBoardNo(boardNo);
      })
      .catch((error) => console.log(error));
  }, []);

  const imageHandler = () => {
    const input = document.createElement("input");
    const formData = new FormData();
    input.setAttribute("type", "file");
    input.setAttribute("accept", "image/*");
    input.click();
    input.onchange = async () => {
      const file = input.files;
      if (file !== null) {
        formData.append("image", file[0]);
        try {
          const res = await axios.post("/quill/setImage", formData);
          console.log(res);
          const photoNo = res.data.photoNo;
          const url = `${BACK_URL}/board/imageDown?photoNo=${photoNo}`;
          // const range = quillRef.current?.getEditor().getSelection()?.index;
          // if (range !== null && range !== undefined) {
          //   let quill = quillRef.current?.getEditor();
          //   quill?.setSelection(range, 1);
          //   quill?.clipboard.dangerouslyPasteHTML(
          //     range,
          //     `<img src=${url} alt="이미지 태그.png" />`
          //   );
          // }
          const editor = quillRef.current?.getEditor();

          const range = editor?.getSelection();

          editor?.insertEmbed(range?.index ?? 0, "image", url);
        } catch (error) {
          console.log("실패했습니다.");
        }
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

  const onFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const fileTmp = e.target.value;

    const fileName = fileTmp.substring(fileTmp.lastIndexOf("\\")+1);
    
    setFileName(fileName);
    setFile(fileTmp);
  }

  return (
    <div className={classes.board_write_page}>
      <div className={classes.board_title_box}>
        <select className={classes.board_title_select}>
          {isAdminLoggedIn && <option value="0">공지</option>}
          <option value="1">자유</option>
          <option value="2">견적</option>
        </select>
        <input
          type="text"
          className={classes.board_title_input}
          placeholder="제목을 입력해 주세요."
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
        // modules={modules}
        theme="snow"
      />
      <div className={classes.board_file_box}>
        <label htmlFor="file" className={classes.board_file_label}>파일 업로드</label>
        <input type="file" className={classes.board_file_input} id="file" onChange={onFileChange}/>
        {fileName && <> <RiDatabase2Line className={classes.board_file_icon} /> <span className={classes.board_file_span}> { fileName } </span> </> }
      </div>
      <div>
        <button className={classes.board_write_btn}>글 작성</button>
        <BackwardButton path={"/board"} />
      </div>
    </div>
  );
};

export default BoardWritePage;
