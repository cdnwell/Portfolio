import classes from "./ManagerBarGraph.module.scss";

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
  { id: 1, sign: 15 },
  { id: 2, sign: 110 },
  { id: 3, sign: 115 },
  { id: 4, sign: 1120 },
  { id: 5, sign: 1125 },
  { id: 6, sign: 11130 },
  { id: 7, sign: 11135 },
];

const MANAGER_DATA_DUMMY = [
  { id: 0, sign: "10/29", data: 1200 },
  { id: 1, sign: "10/30", data: 10000 },
  { id: 2, sign: "11/1", data: 11000 },
  { id: 3, sign: "11/2", data: 1500 },
  { id: 4, sign: "11/3", data: 7600 },
  { id: 5, sign: "11/4", data: 5700 },
  { id: 6, sign: "11/5", data: 3700 },
  { id: 7, sign: "11/6", data: 800 },
];

const ManagerBarGraph = () => {
  const bottomSignLength: number = MANAGER_BOTTOM_DUMMY.length;
  const bottomWidth: string = "500px";
  const leftSignLength: number = MANAGER_LEFT_DUMMY.length;
  const leftSignData: number = Math.floor(
    (MANAGER_LEFT_DUMMY[leftSignLength - 1].sign - MANAGER_LEFT_DUMMY[0].sign) /
      (leftSignLength - 1)
  );
  const leftHeight: string = "320px";
  const maxData: number = MANAGER_LEFT_DUMMY[leftSignLength - 1].sign;

  const leftSign = MANAGER_LEFT_DUMMY.map((item, idx) => {
    return (
      <li
        key={item.id}
        style={{
          bottom: `calc(${leftHeight} * ${idx} / ${leftSignLength - 1})`,
        }}
      >
        {leftSignData * idx}
      </li>
    );
  });
  const leftLine = MANAGER_LEFT_DUMMY.map((item) => {
    return <li key={item.id}></li>;
  });

  const bottomSign = MANAGER_BOTTOM_DUMMY.map((item, idx) => {
    return idx === 0 || idx === bottomSignLength - 1 ? (
      <></>
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
  const bottomLine = MANAGER_BOTTOM_DUMMY.map((item) => {
    return <li key={item.id}></li>;
  });

  const dataSign = MANAGER_DATA_DUMMY.map((item, idx) => {
    return idx === 0 || idx === bottomSignLength - 1 ? (
      <></>
    ) : (
      <div
        key={item.id}
        className={classes.manager_data_bar_div}
        style={{
          height: `calc(${leftHeight} * (${item.data} / ${maxData}))`,
          left: `calc(${bottomWidth} * ${idx} / ${bottomSignLength - 1})`,
        }}
      ></div>
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
