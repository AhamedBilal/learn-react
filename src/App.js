import './App.css';
import React, {Component} from 'react';
import Person from "./Person/Person";
import Radium from 'radium';

// stateful
class App extends Component {
    state = {
        persons: [
            {id: '001', name: 'Ahamed', age: 28},
            {id: '002', name: 'Ado No', age: 40},
            {id: '003', name: 'Trump', age: 50}
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

    nameChangedHandler = (event, id) => {
        const personIndex = this.state.persons.findIndex(p => {
            return p.id === id;
        });
        const persons = [...this.state.persons];
        persons[personIndex].name = event.target.value;
        this.setState({persons: persons})
    }
    togglePersonsHandler = () => {
        const show = !this.state.showPersons;
        this.setState({
            showPersons: show
        })
    };
    deletePersonHandler = (personIndex) => {
        const persons = [...this.state.persons];
        // const persons = this.state.persons.slice();
        persons.splice(personIndex, 1);
        this.setState({persons: persons})
    };

    render() {
        const style = {
            backgroundColor: 'green',
            font: 'inherits',
            color: 'white',
            border: '1px solid blue',
            padding: '8px',
            cursor: 'pointer',
            ':hover': {
                backgroundColor: 'lightgreen',
                color: 'black'
            }
        };
        let persons = null;
        if (this.state.showPersons) {
            style.backgroundColor = 'red';
            style[':hover'].backgroundColor = 'salmon';
            persons = (
                <div>
                    {this.state.persons.map((person, index) =>
                        (<Person
                            // by adding a key detect the changed elements and Only rerender them, Improve speed
                            key={person.id}
                            click={() => this.deletePersonHandler(index)}
                            name={person.name}
                            age={person.age}
                            change={(event) => this.nameChangedHandler(event, person.id)}/>)
                    )}
                </div>
            );
        }
        let classes = [];
        if(this.state.persons.length <= 2) {
            classes.push('red')
        }
        if (this.state.persons.length <= 1) {
            classes.push('bold');
        }
        return (
            <div className="App">
                <h1>Hi, Im a React App!!</h1>
                <p className={classes.join(' ')}>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias beatae dolorum facere illum</p>
                <button style={style} onClick={this.togglePersonsHandler}>Toggle Persons</button>
                {persons}
            </div>
        )
        // same
        //return React.createElement('div', {className: 'App'},React.createElement('h1', null, 'Hi, Im a React App!!'))
    }
}

export default Radium(App);
