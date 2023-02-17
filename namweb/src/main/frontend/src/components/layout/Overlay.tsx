import classes from './Overlay.module.css';

const Overlay :React.FC<{onClick : () => void}> = (props) => {
    return (
        <div className={classes.overlay} onClick={props.onClick}></div>
    )
}

export default Overlay;