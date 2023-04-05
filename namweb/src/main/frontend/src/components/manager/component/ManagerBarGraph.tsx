import classes from "./ManagerBarGraph.module.scss";

import { useEffect } from "react";
import axios from "../../../common/axiosInstance";

const MANAGER_BOTTOM_DUMMY = [
  { id: 0, sign: "10/29" },
  { id: 1, sign: "10/30" },
  { id: 2, sign: "11/1" },
  { id: 3, sign: "11/2" },
  { id: 4, sign: "11/3" },
  { id: 5, sign: "11/4" },
  { id: 6, sign: "11/5" },
  { id: 7, sign: "11/6" },
];

const MANAGER_LEFT_DUMMY: { id: number; sign: number }[] = [
  { id: 0, sign: 0 },
  { id: 1, sign: 1 },
  { id: 2, sign: 1 },
  { id: 3, sign: 6 },
  { id: 4, sign: 4 },
  { id: 5, sign: 3 },
  { id: 6, sign: -10 },
  { id: 7, sign: 2 },
  { id: 8, sign: 10 },
  { id: 9, sign: 2 },
  { id: 10, sign: 10 },
];

const MANAGER_DATA_DUMMY = [
  { id: 0, sign: "10/29", data: 1 },
  { id: 1, sign: "10/30", data: 2 },
  { id: 2, sign: "11/1", data: 4 },
  { id: 3, sign: "11/2", data: 5 },
  { id: 4, sign: "11/3", data: 4 },
  { id: 5, sign: "11/4", data: 2 },
  { id: 6, sign: "11/5", data: 9 },
  { id: 7, sign: "11/6", data: 9 },
];

const ManagerBarGraph = () => {
  const today: Date = new Date();

  // a. 예약 데이터 가져오기
  useEffect(()=>{
    axios.get(``)
  },[]);

  // a. bottom sign 날짜 6일 전까지 계산
  const bottomSignCalculator = () => {
    let date: Date;
    const dateArray = [];
    for (let i = 6; i >= 0; i--) {
      date = new Date(
        today.getFullYear(),
        today.getMonth(),
        today.getDate() - i
      );
      dateArray.push({
        id: i,
        sign: `${date.getMonth() + 1}/${date.getDate()}`,
      });
    }

    return dateArray;
  };
  // b. bottom sign 날짜 7일 데이터
  const bottomSignData = bottomSignCalculator();

  // a. bottom sign 빈 데이터 추가(padding)
  const bottomSignArray = [
    { id: -1, sign: "" },
    ...bottomSignData,
    { id: -2, sign: "" },
  ];
  // b. bottom data 빈 데이터 추가(padding)
  const bottomDataArray = [
    { id: -1, sign: "", data: 0 },
    ...MANAGER_DATA_DUMMY,
    { id: -2, sign: "", data: 0 },
  ];

  const bottomSignLength: number = bottomSignArray.length;
  const bottomWidth: string = "500px";
  const leftSignLength: number = MANAGER_LEFT_DUMMY.length;
  const leftHeight: string = "320px";
  const maxData: number = Math.max(...MANAGER_LEFT_DUMMY.map((item) => item.sign));

  // a. Left sign = 왼쪽에 표시될 '숫자'
  const leftSign = MANAGER_LEFT_DUMMY.map((item, idx) => {
    return (
      <li
        key={item.id}
        style={{
          bottom: `calc(${leftHeight} * ${idx} / ${leftSignLength - 1})`,
        }}
      >
        {Math.floor(maxData * idx / 10)}
      </li>
    );
  });
  // b. Left Line = 왼쪽에 표시될 숫자의 '선'
  const leftLine = MANAGER_LEFT_DUMMY.map((item) => {
    return <li key={item.id}></li>;
  });

  // a. Bottom Sign = 아래에 표시될 '날짜'
  const bottomSign = bottomSignArray.map((item, idx) => {
    return idx === 0 || idx === bottomSignLength - 1 ? (
      <li key={item.id}></li>
    ) : (
      <li
        key={item.id}
        style={{
          left: `calc(${bottomWidth} * ${idx} / ${bottomSignLength - 1})`,
        }}
      >
        {item.sign}
      </li>
    );
  });
  // b. Bottom Line = 아래에 표시될 날짜의 '선'
  const bottomLine = bottomSignArray.map((item) => {
    return <li key={item.id}></li>;
  });

  // a. Data Sign = 데이터의 '막대'
  const dataSign = bottomDataArray.map((item, idx) => {
    return idx === 0 || idx === bottomSignLength - 1 ? (
      <div key={item.id}></div>
    ) : (
      <div
        key={item.id}
        className={classes.manager_data_bar_div}
        style={{
          height: `calc(${leftHeight} * (${item.data} / ${maxData}))`,
        }}
      >
        <span
          key={item.id + 100}
          className={classes.manager_data_bar_span}
          style={{
            width: `calc(${bottomWidth} * 0.5 / ${bottomSignLength - 1})`,
            height: `inherit`,
            left: `calc(${bottomWidth} * ${idx} / ${bottomSignLength - 1})`,
          }}
        ></span>
      </div>
    );
  });

  return (
    <div className={classes.manager_bar_graph}>
      <div className={classes.manager_bar_graph_content}>
        <ul className={classes.manager_bar_graph_left_line}>{leftLine}</ul>
        <ul className={classes.manager_bar_graph_left_sign}>{leftSign}</ul>
        <ul className={classes.manager_bar_graph_bottom_line}>{bottomLine}</ul>
        <ul className={classes.manager_bar_graph_bottom_sign}>{bottomSign}</ul>
        <div className={classes.manager_data_bar}>{dataSign}</div>
      </div>
    </div>
  );
};

export default ManagerBarGraph;
