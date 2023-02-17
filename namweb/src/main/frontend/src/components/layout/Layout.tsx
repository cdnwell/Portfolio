import classes from './Layout.module.css';

import Footer from "./Footer";
import Header from "./Header";

const Layout: React.FC<{ children?: React.ReactNode }> = (props) => {
  return (
    <>
      <Header />
      <main className={classes.main}>{props.children}</main>
      <Footer />
    </>
  );
};

export default Layout;
