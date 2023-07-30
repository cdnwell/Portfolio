import { useNavigate } from "react-router";

export const SignInButton = () => {
    const navigate = useNavigate();

    return (
        <div
            onClick={() => {
                navigate("/signin");
            }}
        >
            {"Login"}
        </div>
    );
}