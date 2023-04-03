import classes from "./HomePage.module.scss";

import { useState } from "react";

import HomeTitle from "./pages/HomeTitle";
import HomeSectionOne from "./pages/HomeSectionOne";

const HomePage = () => {
    return <div className={classes.home_page}>
        <HomeTitle />
        <HomeSectionOne />
    </div>
}

export default HomePage;