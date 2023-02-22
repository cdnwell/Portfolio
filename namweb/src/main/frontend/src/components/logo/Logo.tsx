import { Link } from 'react-router-dom';

import classes from './Logo.module.scss';

const Logo = () => {
    return (
        <div className={classes.logo}>
            <Link className={classes.logo_span} to="/">OO 스카이</Link>
        </div>
    )
}

export default Logo;