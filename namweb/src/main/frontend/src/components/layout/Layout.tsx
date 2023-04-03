import classes from "./Layout.module.scss";

import { useState, useEffect } from "react";
import { useSelector } from "react-redux";

import Footer from "./Footer";
import Header from "./Header";

type LayoutType = {
  children: React.ReactNode;
};

type ReduxBackgroundType = {
  background: {
    path: string;
  };
};

type ReduxBackgroundRgbType = {
  background: {
    background : string; 
  };
};

const Layout = (props: LayoutType) => {
  const [backgroundImage, setBackgroundImage] = useState("");
  const [background, setBackground] = useState("");

  const backgroundPath = useSelector(
    (state: ReduxBackgroundType) => state.background.path
  );
  const backgroundRgb = useSelector((state : ReduxBackgroundRgbType) => state.background.background);

  useEffect(() => {
    setBackgroundImage(backgroundPath);
    setBackground(backgroundRgb);

    console.log('working :',backgroundPath);
    console.log('working :',backgroundRgb);
  }, [backgroundPath, backgroundRgb]);

  return (
    <div className={classes.layout_root} style={{ backgroundColor : background, backgroundImage: `url(${backgroundImage})`, width: "100%", height: "100%" }}>
      <Header />
      <section className={classes.layout_section}>
        {props.children}
      </section>
      <Footer />
    </div>
  );
};

export default Layout;
