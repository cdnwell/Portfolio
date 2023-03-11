import { Link } from 'react-router-dom';

import classes from './Menu.module.scss';
import {CgMenuRound} from 'react-icons/cg';

const Menu = () => {
    return (
        <div className={classes.menu}>
            <Link to="/" >사업 소개</Link>
            <Link to="/board" >게시판</Link>
            <Link to="/book">공사 예약</Link>
            <Link to="/login"><CgMenuRound className={classes.menu_icon}/></Link>
        </div>
    )
};

export default Menu;