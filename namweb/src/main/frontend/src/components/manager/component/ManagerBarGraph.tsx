import classes from "./ManagerBarGraph.module.scss";

import { useState, useEffect } from "react";
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
  { id: 2, sign: "11/1", data: 3 },
  { id: 3, sign: "11/2", data: 3 },
  { id: 4, sign: "11/3", data: 3 },
  { id: 5, sign: "11/4", data: 2 },
  { id: 6, sign: "11/5", data: 14 },
  { id: 7, sign: "11/6", data: 3 },
];

type bookDBType = {
  id: number;
  date: string;
  count: number;
}[];

type bookType = {
  id: number;
  sign: string;
  data: number;
}[];

const ManagerBarGraph = () => {
  const today: Date = new Date();

  const [bookData, setBookData] = useState<bookType>([]);

  // a. 예약 데이터 가져오기
  useEffect(() => {
    axios
      .get(`/namweb/manager/graph/book`)
      .then((response) => {
        const data: bookDBType = response.data;

        const dataArr: bookType = data.map((item, idx) => {
          return { id: idx, sign: item.date, data: item.count };
        });

        setBookData(dataArr);
      })
      .catch((error) => {
        console.log(error);
      });
  }, []);

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
  // b.1 bottom data 비어있는 데이터 추가(padding)
  const bottomDataPadding = (bookData: bookType) => {
    let date: Date;
    const dateArray = [];
    loop: for (let i = 6; i >= 0; i--) {
      date = new Date(
        today.getFullYear(),
        today.getMonth(),
        today.getDate() - i
      );
      for (let j = 0; j < bookData.length; j++) {
        const bookDate = new Date(bookData[j].sign);
        if (
          date.getFullYear() === bookDate.getFullYear() &&
          date.getMonth() === bookDate.getMonth() &&
          date.getDate() === bookDate.getDate()
        ) {
          dateArray.push({
            id: i,
            sign: `${date.getMonth() + 1}/${date.getDate()}`,
            data: bookData[j].data,
          });
          continue loop;
        }
      }
      dateArray.push({
        id: i,
        sign: `${date.getMonth() + 1}/${date.getDate()}`,
        data: 0,
      });
    }

    return dateArray;
  };
  // b.2 bottom data 변수에 값 저장
  const bottomData = bottomDataPadding(bookData);
  // b.3 bottom data 빈 데이터 추가(padding)
  const bottomDataArray = [
    { id: -1, sign: "", data: 0 },
    ...bottomData,
    { id: -2, sign: "", data: 0 },
  ];

  const bottomSignLength: number = bottomSignArray.length;
  const bottomWidth: string = "500px";
  const leftHeight: string = "320px";
  const maxData: number = Math.max(...bookData.map((item) => item.data));

  // a. Left sign calculator = 왼쪽에 표시될 '데이터' 계산
  const leftSignCalculator = (maxData: number) => {
    const signArray = [];
    // a.1 maxData가 10보다 작으면 maxData까지 표시
    if (maxData <= 10) {
      for (let i = 0; i < maxData + 1; i++) {
        signArray.push({
          id: i,
          sign: Math.floor((maxData * i) / maxData),
        });
      }

      return signArray;
    }

    // a.2 maxData가 10보다 크면 10으로 구분한다.
    for (let i = 0; i < 10 + 1; i++) {
      signArray.push({
        id: i,
        sign: Math.floor((maxData * i) / 10),
      });
    }

    return signArray;
  };

  // b. Left Sign = 왼쪽에 표시될 '데이터'
  const leftSignArray = leftSignCalculator(maxData);
  const leftSign = leftSignArray.map((item, idx) => {
    // a.1 maxData가 10보다 작으면 maxData까지 표시
    if (maxData <= 10)
      return (
        <li
          key={item.id}
          style={{
            bottom: `calc(${leftHeight} * ${idx} / ${maxData})`,
          }}
        >
          {Math.floor((maxData * idx) / maxData)}
        </li>
      );

    // a.2 maxData가 10보다 크면 10등분을 한다.
    return (
      <li
        key={item.id}
        style={{
          bottom: `calc(${leftHeight} * ${idx} / 10)`,
        }}
      >
        {Math.floor((maxData * idx) / 10)}
      </li>
    );
  });

  // c. Left Line = 왼쪽에 표시될 숫자의 '선'
  const leftLine = leftSignArray.map((item) => {
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
