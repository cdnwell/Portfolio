import '../webapp/css/custom.css';

import React, { Component } from 'react';
import ReactDOM from 'react-dom/client';

class MainPage extends Component {
    render(){
        return <div className='main'>hello world!</div>;
    }
}

ReactDOM.createRoot(document.querySelector('#root')).render(<MainPage/>);