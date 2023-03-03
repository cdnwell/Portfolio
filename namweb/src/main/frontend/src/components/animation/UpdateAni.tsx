import classes from "./UpdateAni.module.scss";

import ReactDOM from "react-dom";

const UpdateAni = () => {
  return (
    <>
      {ReactDOM.createPortal(
        <button className={classes.update_ani}>업데이트 완료</button>,
        document.getElementById("backdrop-item") as HTMLElement
      )}
    </>
  );
};

export default UpdateAni;
