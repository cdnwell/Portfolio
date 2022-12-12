import '../webapp/css/custom.css';

import React, { Component } from 'react';
import ReactDOM from 'react-dom/client';

class Page1Page extends Component {

    render() {
        return <div className='page1'>Page1 페이지</div>
    }

}

ReactDOM.createRoot(document.querySelector('#root')).render(<Page1Page/>);