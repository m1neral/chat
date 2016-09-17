const Message = React.createClass({
    render() {
        const author = this.props.author;
        const text = this.props.text;

        return (
            <p>
                <strong>{author}: </strong>
                {text}
            </p>
        );
    }
});