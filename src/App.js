import './App.css';
import React, {Component} from 'react';
import Person from "./Person/Person";

// stateful
class App extends Component {
    state = {
        persons: [
            {name: 'Max', age: 28},
            {name: 'Biden', age: 40},
            {name: 'Trump', age: 50}
        ],
        otherState: 'Nothing here',
        showPersons: false,
    }

    switchNameHandler = (newName) => {
        // console.log('Clicked!');
        // avoid this --> this.state.persons[0].name = "Bilal";
        this.setState({
            persons: [
                {name: newName, age: 28},
                {name: 'Biden', age: 40},
                {name: 'Trump', age: 50}
            ]
        })
    }

    nameChangedHandler = (event) => {
        this.setState({
            persons: [
                {name: 'Ahamed', age: 28},
                {name: event.target.value, age: 40},
                {name: 'Trump', age: 50}
            ]
        })
    }
    togglePersonsHandler = () => {
        const show = !this.state.showPersons;
        this.setState({
            showPersons: show
        })
    };

    render() {
        const style = {
            backgroundColor: 'white',
            font: 'inherits',
            border: '1px solid blue',
            padding: '8px',
            cursor: 'pointer'
        };
        let persons = null;
        if (this.state.showPersons) {
            persons = (
                <div>
                    {this.state.persons.map((person, index) =>
                        (<Person key={index} name={person.name} age={person.age}/>)
                    )}
                </div>
            );
        }
        return (
            <div className="App">
                <h1>Hi, Im a React App!!</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias beatae dolorum facere illum,
                    ratione suscipit tenetur? Alias, assumenda cum eum expedita facilis modi nihil possimus quas
                    quibusdam, sapiente similique velit?</p>
                <button style={style} onClick={this.togglePersonsHandler}>Toggle Persons</button>
                {persons}
            </div>
        )
        // same
        //return React.createElement('div', {className: 'App'},React.createElement('h1', null, 'Hi, Im a React App!!'))
    }
}

export default App;
