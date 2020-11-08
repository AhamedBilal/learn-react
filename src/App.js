import './App.css';
import React, {Component} from 'react';
import Person from "./Person/Person";

class App extends Component {
    state = {
        persons: [
            {name: 'Max', age: 28},
            {name: 'Biden', age: 40},
            {name: 'Trump', age: 50}
        ]
    }

    switchNameHandler = () => {
        // console.log('Clicked!');
        // avoid this  this.state.persons[0].name = "Bilal";
        this.setState({
            persons: [
                {name: 'Ahamed', age: 28},
                {name: 'Biden', age: 40},
                {name: 'Trump', age: 50}
            ]
        })
    }

    render() {
        return (
            <div className="App">
                <h1>Hi, Im a React App!!</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias beatae dolorum facere illum,
                    ratione suscipit tenetur? Alias, assumenda cum eum expedita facilis modi nihil possimus quas
                    quibusdam, sapiente similique velit?</p>
                <button onClick={this.switchNameHandler}>Switch Name</button>
                <Person name={this.state.persons[0].name} age={this.state.persons[0].age}/>
                <Person name={this.state.persons[1].name} age={this.state.persons[1].age}/>
                <Person name={this.state.persons[2].name} age={this.state.persons[2].age}/>
            </div>
        )
        // same
        //return React.createElement('div', {className: 'App'},React.createElement('h1', null, 'Hi, Im a React App!!'))
    }
}

export default App;
