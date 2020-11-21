import React from 'react';
import styles from './Cockpit.module.css'
import Auxx from "../../hoc/Auxx";

const cockpit = (props) => {
    let classes = [];
    let btnClass = styles.Button;

    if (props.persons.length <= 2) {
        classes.push(styles.red)
    }
    if (props.persons.length <= 1) {
        classes.push(styles.bold);
    }
    if (props.showPersons) {
        btnClass = [styles.red, styles.Button].join(' ');
    }

    return(
        // hoc
        <Auxx>
            <h1>{props.children}</h1>
            <p className={classes.join(' ')}>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias
                beatae dolorum facere illum</p>
            <button className={btnClass} onClick={props.click}>Toggle Persons</button>
        </Auxx>
    )
}
export default cockpit;