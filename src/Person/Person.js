//functions are stateless
const person = (props) => {
    return (
        <div>
            <p>Im {props.name}!, Im {props.age} yrs old</p>
            <p>{props.children}</p>
        </div>
    )
}
export default person;
