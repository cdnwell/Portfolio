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

const MANAGER_LEFT_DUMMY = [
  { id: 0, sign: 0 },
  { id: 1, sign: 15 },
  { id: 2, sign: 110 },
  { id: 3, sign: 115 },
  { id: 4, sign: 1120 },
  { id: 5, sign: 1125 },
  { id: 6, sign: 11130 },
  { id: 7, sign: 11135 },
];

const ManagerBarGraph = () => {
  const bottomSignLength = MANAGER_BOTTOM_DUMMY.length;
  const bottomWidth = "500px";
  const leftSignLength = MANAGER_LEFT_DUMMY.length;
  const leftHeight = "320px";

  const leftSign = MANAGER_LEFT_DUMMY.map((item, idx) => {
    return (
      <li
        key={item.id}
        style={{
          bottom: `calc(${leftHeight} * ${idx} / ${leftSignLength - 1})`,
        }}
      >
        {item.sign}
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

  return (
    <div className={classes.manager_bar_graph}>
      <div className={classes.manager_bar_graph_content}>
        <ul className={classes.manager_bar_graph_left_line}>{leftLine}</ul>
        <ul className={classes.manager_bar_graph_left_sign}>{leftSign}</ul>
        <ul className={classes.manager_bar_graph_bottom_line}>{bottomLine}</ul>
        <ul className={classes.manager_bar_graph_bottom_sign}>{bottomSign}</ul>
      </div>
    </div>
  );
};

export default ManagerBarGraph;
