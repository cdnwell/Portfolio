import React, {useEffect, useState} from 'react';
import axios from 'axios';
import Header from './component/Header.jsx';
import MainImage from './component/main/MainImage.jsx';

function App() {
   const [hello, setHello] = useState('');

    useEffect(() => {
        axios.get('/api/hello')
        .then(response => setHello(response.data))
        .catch(error => console.log(error))
    }, []);

    return (
        <>
          <Header />
          <MainImage />
        </>
    );
}

export default App;