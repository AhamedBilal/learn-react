import './App.css';
import styles from './App.module.css';
import React, {PureComponent} from 'react';
import Persons from "../components/Persons/Persons";
import Cockpit from "../components/Cockpit/Cockpit";
import Auxx from "../hoc/Auxx";
import withClass from "../hoc/withClass";

// stateful

class App extends PureComponent {

    constructor(props) {
        super(props);
        console.log('[App.js component const]', props);
    }

    UNSAFE_componentWillMount() {
        console.log('Component wil mount');
    }

    componentDidMount() {
        console.log('Component Did mount, Rendered');
    }

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
        console.log('Rendering')
        let persons = null;
        if (this.state.showPersons) {
            // style.backgroundColor = 'red';
            persons = <Persons persons={this.state.persons}
                               click={this.deletePersonHandler}
                               changed={this.nameChangedHandler}/>;
        }

        return (
            <Auxx>
                <Cockpit click={this.togglePersonsHandler}
                         persons={this.state.persons}
                         showPersons={this.state.showPersons}>{this.props.title}</Cockpit>
                {persons}
            </Auxx>
        )
        // same
        //return React.createElement('div', {className: 'App'},React.createElement('h1', null, 'Hi, Im a React App!!'))
    }
}

export default withClass(App, styles.App);
