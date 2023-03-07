import BackwardButton from "../../buttons/BackwardButton";
import classes from "./FindIdPage.module.scss";

const FindIdPage = () => {
  return (
    <div className={classes.find_id}>
      <div className={classes.find_id_div}>
        <p className={classes.find_id_p}>아이디 찾기</p>
        <div className={classes.find_id_span_div}>
          <label className={classes.find_id_span}>이메일(E-mail)</label>
        </div>
        <input
          type="text"
          className={classes.find_id_input}
          placeholder="이메일을 입력해주세요."
        />
        <div className={classes.find_id_button_div}>
          <button className={classes.find_id_button}>아이디 찾기</button>
          <BackwardButton path="/login/find-id-pw" />
        </div>
      </div>
    </div>
  );
};

export default FindIdPage;
