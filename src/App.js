import './App.css';
import React, {Component} from 'react';

class App extends Component {
    render() {
        return (
            <div className="App">
                <h1>Hi, Im a React App!!</h1>
            </div>
        )
        // same
        //return React.createElement('div', {className: 'App'},React.createElement('h1', null, 'Hi, Im a React App!!'))
    }
}

export default App;
