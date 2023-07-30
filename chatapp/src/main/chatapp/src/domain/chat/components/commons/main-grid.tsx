import { Grid } from "@mui/material";
import { ReactNode } from "react";

interface IMainGrid {
    children: ReactNode;
}

export const MainGrid = ({ children }: IMainGrid) => {
    return(
        <Grid
            container
            height={"100vh"}
            paddingTop={"50px"}
            paddingLeft={"100px"}
            paddingRight={"50px"}
            paddingBottom={"100px"}
            bgcolor={"#e5e5e5"}
            direction={{ lg: "row", md: "row", sm: "column", xs: "column" }}
        >
            <div>{children}</div>
        </Grid>
    )
}