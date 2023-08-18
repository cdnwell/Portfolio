import classes from "./LoginBox.module.scss";

import { useState } from "react";
import { useNavigate } from "react-router-dom";

import { GiBearFace, GiDolphin } from "react-icons/gi";
import { LuBird } from "react-icons/lu";
import { PiDogFill } from "react-icons/pi";

const LoginBox = () => {
  const [onButtonHover, setOnButtonHover] = useState(0);

  const navigate = useNavigate();

  const goToChat = () => {
    navigate("/Chat");
  };

  return (
    <div className={classes.login_div}>
      <div className={classes.first_login_btn_div}>
        <button
          className={`${classes.login_btn} ${classes.first_login_btn}`}
          onMouseEnter={() => setOnButtonHover(1)}
          onMouseLeave={() => setOnButtonHover(0)}
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
          onClick={goToChat}
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
