import classes from "./HomePage.module.scss";

import { useState } from "react";

import HomeTitle from "./pages/HomeTitle";
import HomeSectionOne from "./pages/HomeSectionOne";
import HomeSectionTwo from "./pages/HomeSectionTwo";
import HomeSectionThree from "./pages/HomeSectionThree";

const HomePage = () => {
    return <div className={classes.home_page}>
        <HomeTitle />
        <HomeSectionOne />
        <HomeSectionTwo />
        <HomeSectionThree />
    </div>
}

export default HomePage;