import React from 'react';
import Person from "./Person/Person";

const persons = (props) => (props.persons.map((person, index) =>
                (<Person
                    // by adding a key detect the changed elements and Only rerender them, Improve speed
                    key={person.id}
                    click={() => props.click(index)}
                    name={person.name}
                    age={person.age}
                    change={(event) => props.changed(event, person.id)}/>)
            ));

export default persons;