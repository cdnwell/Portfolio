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
  const [content, setContent] = useState("");
  const [boardNo, setBoardNo] = useState();
  const [fileName, setFileName] = useState("");
  const [file, setFile] = useState("");
  const [photoNumber, setPhotoNumber] = useState<number[]>([]);

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
          // 1. base64 이전 작업

          // 2. axios post : image 저장
          // const res = await axios.post("/quill/setImage", formData);
          // console.log(res);

          // const url = `${BACK_URL}/board/imageDown?photoNo=${photoNo}`;
          // setPhotoNumber((prevState) => [...prevState, photoNo]);

          // * 파일을 base64로 변환
          const fileReader = new FileReader();
          fileReader.readAsDataURL(file[0]);
          
          fileReader.onload = async () => {
            let base64 = "";
            if(typeof fileReader.result === "string")
              base64 = fileReader.result;
            // console.log("base64:\n", base64);

            // const res = await axios.get("/quill/image/photoNo");
            // const photoNo = res.data;
            // console.log("photo no :", photoNo);

            let url : string = base64;

            // console.log(url);

            const editor = quillRef.current?.getEditor();

            const range = editor?.getSelection()?.index;

            editor?.insertEmbed(range ?? 0, "image", url);

            // if (range !== null && range !== undefined) {
            //   editor?.clipboard.dangerouslyPasteHTML(
            //     range,
            //     `<img src=${url}/>`
            //   );
            // }

            // const replacedUrl = url.replace(/data:image\/jpeg;base64,/, "");
            // const byteString : string = window.atob(replacedUrl);
            // const arrayBuffer = new ArrayBuffer(byteString.length);
            // const int8Array = new Uint8Array(arrayBuffer);
            // for (let i =0;i<byteString.length;i++) {
            //   int8Array[i] = byteString.charCodeAt(i);
            // }
            // const blob = new Blob([int8Array], { type : "image/png" });

            // const formDataBlob = new FormData();
            // formDataBlob.append('image',blob);
            // url = url.split(",")[1];
            // url = JSON.stringify(url);
            console.log('url\n',url);

            // *. base64를 FormData로 바꿔줌
            const formData = base64toFormData(url);

            const response = await axios.post("/quill/image/convert", formData);
            console.log('response',response);

            const result = response.data;
            console.log('result',result);
          };

          // console.log(url);

          // const range = quillRef.current?.getEditor().getSelection()?.index;
          // if (range !== null && range !== undefined) {
          //   let quill = quillRef.current?.getEditor();
          //   quill?.setSelection(range, 1);
          //   quill?.clipboard.dangerouslyPasteHTML(
          //     range,
          //     `<img src=${url} alt="이미지 태그.png" />`
          //   );
          // }
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

    const fileName = fileTmp.substring(fileTmp.lastIndexOf("\\") + 1);

    setFileName(fileName);
    setFile(fileTmp);
  };

  const onWriteSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();

    // console.log("content", content);

    // 1. 이미지 photoNo 모두 한 배열에 담기
    const photoNoArr = new Array();
    let index = 0;
    let contentChanged = content;
    while (true) {
      let startIndex = contentChanged.indexOf("<img src=", index + 1);
      if (startIndex === -1) break;
      let endIndex = contentChanged.indexOf(">", startIndex);

      let imgStr = contentChanged.substring(startIndex, endIndex + 1);
      // console.log("imgStr", imgStr);

      let srcIdx = imgStr.indexOf("src=") + 5;
      let srcEndIdx = imgStr.indexOf('"', srcIdx);
      let base64 = imgStr.substring(srcIdx, srcEndIdx);

      console.log("base64 :", base64);

      const formData = base64toFormData(base64);

      contentChanged = contentChanged.substring(0,startIndex) + contentChanged.substring(endIndex + 1);

      const response = await axios.post("/quill/setImage", formData);
      const photoNo = response.data.photoNo;
      photoNoArr.push(photoNo);
      const image = `<img src="${BACK_URL}/board/imageDown?photoNo=${photoNo}" />`;
      console.log('image',image);

      contentChanged = contentChanged.substring(0,startIndex) + image + contentChanged.substring(startIndex);

      index = startIndex;
    }

    console.log('before changed\n',content);
    setContent(contentChanged);
    console.log('after changed\n',contentChanged);
    
    console.log(photoNoArr);

    // console.log("photoNoArr", photoNoArr);

    // 2. 작성되지 않은 photo 삭제 위한 배열 작업
    // photoNumber : 모든 photo No.
    // photoNoArr : 글에만 있는 photo No.
    // -> photoNumberArr : 삭제할 photo No.
    // let photoNumberArr = [...photoNumber];
    // photoNumberArr = photoNumberArr.filter((item) => {
    //   for (let num of photoNoArr) {
    //     if (item === num) return false;
    //   }
    //   return true;
    // });

    // 3. 내용에 없는 photo 삭제
    // if (photoNumberArr.length !== 0) {
    //   axios
    //     .delete(`quill/image?photoNo=${photoNumberArr}`)
    //     .then((response) => {
    //       // console.log(response);
    //     })
    //     .catch((error) => console.log(error));
    // }

    // 4. boardNo와 photoNo 연결하기
    // if (photoNoArr.length !== 0) {
    //   axios
    //     .post(`/quill/image/link`, {
    //       boardNo,
    //       photoNo: JSON.stringify(photoNoArr),
    //     })
    //     .then((response) => {
    //       // console.log(response);
    //     })
    //     .catch((error) => console.log(error));
    // }

    // 5.
  };

  return (
    <form className={classes.board_write_page} onSubmit={onWriteSubmit}>
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
