import React from 'react';
import Person from "./Person/Person";

const persons = (props) => {
    return (
        <div>
            {props.persons.map((person, index) =>
                (<Person
                    // by adding a key detect the changed elements and Only rerender them, Improve speed
                    key={person.id}
                    click={() => this.deletePersonHandler(index)}
                    name={person.name}
                    age={person.age}
                    change={(event) => this.nameChangedHandler(event, person.id)}/>)
            )}
        </div>
    )
}
export default persons;