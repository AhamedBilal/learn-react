import './App.css';
import React, {Component} from 'react';
import Person from "./Person/Person";

class App extends Component {
    render() {
        return (
            <div className="App">
                <h1>Hi, Im a React App!!</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias beatae dolorum facere illum,
                    ratione suscipit tenetur? Alias, assumenda cum eum expedita facilis modi nihil possimus quas
                    quibusdam, sapiente similique velit?</p>
                <Person name="Joe" age="28"/>
                <Person name="Biden" age="14"/>
                <Person name="Trump" age="50"/>
            </div>
        )
        // same
        //return React.createElement('div', {className: 'App'},React.createElement('h1', null, 'Hi, Im a React App!!'))
    }
}

export default App;
