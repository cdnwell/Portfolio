import classes from "./FindEnterCode.module.scss";

import { useState } from "react";

const FindEnterCode: React.FC<{ code: number }> = ({ code }) => {
    const [codeEntered, setCodeEntered] = useState(-1);

    const onCodeEntered = (e : React.ChangeEvent<HTMLInputElement>) => {
        let codeTmp = parseInt(e.target.value);

        setCodeEntered(codeTmp);
    }

  return <div>
    <label htmlFor="code">코드를 입력해주세요</label>
    <input type="text" onChange={onCodeEntered} />
  </div>;
};

export default FindEnterCode;
