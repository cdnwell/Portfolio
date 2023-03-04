import classes from "./UpdateAni.module.scss";

import ReactDOM from "react-dom";

const UpdateAni : React.FC<{content : string}> = ({content}) => {
  return (
    <>
      {ReactDOM.createPortal(
        <button className={classes.update_ani}>{content}</button>,
        document.getElementById("backdrop-item") as HTMLElement
      )}
    </>
  );
};

export default UpdateAni;
