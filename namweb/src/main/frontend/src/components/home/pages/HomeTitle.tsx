import classes from "./HomeTitle.module.scss";
import sky_background_title from "../../../assets/images/background/sky/dominik-schroder-FIKD9t5_5zQ-unsplash.jpg";

const HomeTitle = () => {
  const title = "OO 스카이";
  const p1 =
    "스카이는 높은 작업 공간에서의 안전하고 효율적인 작업을 위해 설계되었으며, 다양한 모델과 사양으로 제공됩니다.";
  const p2 =
    "스카이는 주로 건물 유리창 청소, 전선 및 파이프 설치, 풍력발전기 유지보수 등 높은 작업 공간에서 필요한 작업에 사용됩니다.";
  const p3 =
    "스카이는 안전 기능이 매우 우수하여, 안정적인 작업 환경을 제공합니다. 또한 조작이 쉽고 이동이 간편하며, 좁은 작업 공간에서도 자유롭게 움직일 수 있습니다.";
  const screenHeight = screen.height - 60;

  return (
    <div className={classes.home_title} style={{ height : screenHeight,backgroundImage : `url(${sky_background_title})`}}>
      <p className={classes.home_title_p}>{title}</p>
      <p className={classes.home_p1}>{p1}</p>
      <p className={classes.home_p2}>{p2}</p>
      <p className={classes.home_p3}>{p3}</p>
    </div>
  );
};

export default HomeTitle;
