import { Link, useNavigate } from "react-router-dom";
import axios from "../../../common/axiosInstance";
import BackwardButton from "../buttons/BackwardButton";
import classes from "./FindIdPwPage.module.scss";

const FindIdPwPage = () => {
  const navigate = useNavigate();

  const onEmailFindClick = () => {
    axios
      .get("/login/find-id-pw/find-by-email")
      .then((response) => {
        console.log(response);
        console.log("이메일이 보내졌습니다.");
      })
      .catch((error) => {
        console.log(error);
        console.log("이메일 보내기에 실패하였습니다.");
      });
  };

  return (
    <div className={classes.find_id_pw}>
      <p className={classes.find_id_pw_p}>아이디 / 비밀번호 찾기</p>
      <div className={classes.find_id_div}>
        <p>아이디 찾기</p>
        <Link to={"/login/find-id-pw/find-id"} className={classes.email_id_link} onClick={onEmailFindClick}>이메일로 아이디 찾기</Link>
      </div>
      <div className={classes.find_pw_div}>
        <p>비밀번호 찾기</p>
        <Link to={"/login/find-id-pw/find-pw"} className={classes.email_pw_link}>이메일로 비밀번호 찾기</Link>
      </div>
      <BackwardButton path="/login" />
    </div>
  );
};

export default FindIdPwPage;
