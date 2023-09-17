import classes from "./LoginBox.module.scss";

import { useState } from "react";
import { useNavigate } from "react-router-dom";

import { GiBearFace, GiDolphin } from "react-icons/gi";
import { LuBird } from "react-icons/lu";
import { PiDogFill } from "react-icons/pi";
import { USER_TYPE } from "../../global/uniontypes/user-type";
import { useDispatch } from "react-redux";
import { userActions } from "../../global/reducers";

const LoginBox = () => {
  const [onButtonHover, setOnButtonHover] = useState(0);
  
  const dispatch = useDispatch();
  const navigate = useNavigate();

  // const goToChat = () => {
  //   navigate("/Chat");
  // };

  // 1. 먼저 리덕스에 어떤 유저를 정했는지 데이터를 전한다.
  // - 채팅창에서 리덕스의 값을 참조해서 배경생을 정한다.
  // 2. navigate chat으로 이동

  const onLoginBtnClick = (userAnimal : USER_TYPE) => {
    dispatch(userActions.setUserAnimal(userAnimal));
    dispatch(userActions.setUserId(undefined));
    navigate("/Chat");
  }

  return (
    <div className={classes.login_div}>
      <div className={classes.first_login_btn_div}>
        <button
          className={`${classes.login_btn} ${classes.first_login_btn}`}
          onMouseEnter={() => setOnButtonHover(1)}
          onMouseLeave={() => setOnButtonHover(0)}
          onClick={() => onLoginBtnClick('Bear')}
        >
          {onButtonHover === 1 ? (
            <p className={classes.common_login_p}>
              <GiBearFace className={classes.common_login_icon} />
              <span className={classes.common_login_span}>Bear on login</span>
            </p>
          ) : (
            <GiBearFace />
          )}
        </button>
      </div>
      <div className={classes.second_login_btn_div}>
        <button
          className={`${classes.login_btn} ${classes.second_login_btn}`}
          onMouseEnter={() => setOnButtonHover(2)}
          onMouseLeave={() => setOnButtonHover(0)}
          onClick={() => onLoginBtnClick('Bird')}
        >
          {onButtonHover === 2 ? (
            <p className={classes.common_login_p}>
              <LuBird className={classes.common_login_icon} />
              <span className={classes.common_login_span}>Bird on login</span>
            </p>
          ) : (
            <LuBird />
          )}
        </button>
      </div>
      <div className={classes.third_login_btn_div}>
        <button
          className={`${classes.login_btn} ${classes.third_login_btn}`}
          onMouseEnter={() => setOnButtonHover(3)}
          onMouseLeave={() => setOnButtonHover(0)}
          onClick={() => onLoginBtnClick('Dog')}
        >
          {onButtonHover === 3 ? (
            <p className={classes.common_login_p}>
              <PiDogFill className={classes.common_login_icon} />
              <span className={classes.common_login_span}>Pig on login</span>
            </p>
          ) : (
            <PiDogFill />
          )}
        </button>
      </div>
      <div className={classes.fourth_login_btn_div}>
        <button
          className={`${classes.login_btn} ${classes.fourth_login_btn}`}
          onMouseEnter={() => setOnButtonHover(4)}
          onMouseLeave={() => setOnButtonHover(0)}
          onClick={() => onLoginBtnClick('Dolphin')}
        >
          {onButtonHover === 4 ? (
            <p className={classes.common_login_p}>
              <GiDolphin className={classes.common_login_icon} />
              <span className={classes.common_login_span}>
                Dolphin on login
              </span>
            </p>
          ) : (
            <GiDolphin />
          )}
        </button>
      </div>
    </div>
  );
};

export default LoginBox;
