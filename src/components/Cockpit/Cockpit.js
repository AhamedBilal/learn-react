import React from 'react';
import styles from './Cockpit.module.css'

const cockpit = (props) => {
    let classes = [];
    let btnClass = '';

    if (props.persons.length <= 2) {
        classes.push(styles.red)
    }
    if (props.persons.length <= 1) {
        classes.push(styles.bold);
    }
    if (props.showPersons) {
        btnClass = styles.red;
    }

    return(
        <div className={styles.Cockpit}>
            <h1>{props.children}</h1>
            <p className={classes.join(' ')}>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias
                beatae dolorum facere illum</p>
            <button className={btnClass} onClick={props.click}>Toggle Persons</button>
        </div>
    )
}
export default cockpit;