import classes from "./BoardWritePage.module.scss";

import { useState, useRef, useMemo, useEffect } from "react";

import ReactQuill from "react-quill";
import "react-quill/dist/quill.snow.css";
import axios from "../../../common/axiosInstance";

const BoardWritePage = () => {
  const QuillRef = useRef<ReactQuill>();
  const [content, setContent] = useState("");

  useEffect(() => {
    if (QuillRef.current?.editor) {
      QuillRef.current?.editor.setContents(
        QuillRef.current?.editor.getContents()
      );
    }
  }, [QuillRef.current]);

  const imageHandler = () => {
    // const input = document.createElement("input");
    // const formData = new FormData();
    // let url = "";
    // input.setAttribute("type", "file");
    // input.setAttribute("accept", "image/*");
    // input.click();
    // input.onchange = async () => {
    //   const file = input.files;
    //   if (file !== null) {
    //     formData.append("image", file[0]);
    //     try {
    //       const res = await axios.post("/quill/setupImage", formData);
    //       url = res.data.url;
    //       const range = QuillRef.current?.getEditor().getSelection()?.index;
    //       if (range !== null && range !== undefined) {
    //         let quill = QuillRef.current?.getEditor();
    //         quill?.setSelection(range, 1);
    //         quill?.clipboard.dangerouslyPasteHTML(
    //           range,
    //           `<img src=${url} alt="이미지 태그.png" />`
    //         );
    //       }
    //       return true;
    //     } catch (error) {
    //       const err = error;
    //       return false;
    //     }
    //   }
    // };
  };

  const modules = useMemo(
    () => ({
      toolbar: {
        containers: [
          ["bold", "italic", "underline", "strike", "blockquote"],
          [{ size: ["small", false, "large", "huge"] }, { color: [] }],
          [
            { list: "ordered" },
            { list: "bullet" },
            { indent: "-1" },
            { indent: "+1" },
            { align: [] },
          ],
          ["image", "video"],
        ],
        handlers: {
          "image": imageHandler,
        },
      },
    }),
    []
  );
  return (
    <div className={classes.board_write_page}>
      <ReactQuill
        className={classes.react_quill}
        ref={(element) => {
          if (element !== null) {
            QuillRef.current = element;
          }
        }}
        value={content}
        onChange={setContent}
        modules={modules}
        theme="snow"
      />
    </div>
  );
};

export default BoardWritePage;
