import './Person.css';
//functions are stateless
const person = (props) => {
    return (
        <div className='Person'>
            <p onClick={props.click}>Im {props.name}!, Im {props.age} yrs old</p>
            <p>{props.children}</p>
            <input type="text" onChange={props.change} value={props.name}/>
        </div>
    )
}
export default person;
