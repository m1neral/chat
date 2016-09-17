const Dialog = React.createClass({
    getInitialState() {
        const messages = this.props.messages;

        return { messages };
    },
    getMessages() {
        return this.state.messages.map(msg =>
            <Message author={msg.sender} text={msg.text} key={msg.id}/>);
    },
    render() {
        const messageElements = this.getMessages();

        return (
            <div>
                <div className="panel panel-default">
                    <div className="panel-body">
                        {messageElements.length ? messageElements : <h5>No messages</h5>}
                    </div>
                </div>
            </div>
        );
    }
});