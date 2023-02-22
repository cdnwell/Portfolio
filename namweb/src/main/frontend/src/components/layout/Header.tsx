import classes from './Header.module.scss';

import Logo from "../logo/Logo";
import Menu from "../menu/Menu";

const Header = () => {
  return (
    <header className={classes.header}>
      <Logo />
      <Menu />
    </header>
  );
};

export default Header;
