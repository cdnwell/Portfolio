import { useNavigate } from "react-router-dom";
import classes from "./FindIdPwPage.module.scss";

const FindIdPwPage = () => {
  const navigate = useNavigate();

  return (
    <div className={classes.find_id_pw}>
        <div>
            <p>아이디 찾기</p>
            <button>이메일로 아이디 찾기</button>
            <button>핸드폰으로 아이디 찾기</button>
        </div>
        <div>
            <p>비밀번호 찾기</p>
            <button>이메일로 비밀번호 찾기</button>
            <button>핸드폰으로 비밀번호 찾기</button>
        </div>
      <button type="button" className={classes.backward_button} onClick={() => navigate(-1)}>
        뒤로가기
      </button>
    </div>
  );
};

export default FindIdPwPage;
