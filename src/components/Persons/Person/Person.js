import './Person.css';
import React, {Component} from 'react';
import withClass from "../../../hoc/withClass";
import styles from "../../../containers/App.module.css";
import Auxx from "../../../hoc/Auxx";
import PropTypes from 'prop-types';

//functions are stateless
class Person extends Component {
    render() {
        return (
            <Auxx>
                <p onClick={this.props.click}>Im {this.props.name}!, Im {this.props.age} yrs old</p>
                <p>{this.props.children}</p>
                <input type="text" onChange={this.props.change} value={this.props.name}/>
            </Auxx>
        );
    }
}

Person.propTypes = {
    click: PropTypes.func,
    name: PropTypes.string,
    age: PropTypes.number,
    change: PropTypes.func
}

export default withClass(Person, styles.Person);
