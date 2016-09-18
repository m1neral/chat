const Dialog = React.createClass({
    getInitialState() {
        const messages = this.props.messages;

        return { messages };
    },
    getMessages() {
        return this.state.messages.map(msg =>
            <Message author={msg.sender} text={msg.text} key={msg.id}/>);
    },
    componentDidMount() {
        this.setupSubscription();
    },
    setupSubscription() {
        const channelParams = {
            channel: 'MessagesChannel',
            sender_id: this.props.sender_id,
            receiver_id: this.props.receiver_id
        };

        App.messages = App.cable.subscriptions.create(channelParams, {
            received: data => this.updateDialog(data)
        });
    },
    updateDialog(data) {
        this.setState({ messages: [...this.state.messages, data] });

        const messagesBlock = document.getElementById('messages-block-el');
        messagesBlock.scrollTop = messagesBlock.scrollHeight;
    },
    render() {
        const messageElements = this.getMessages();

        return (
            <div>
                <div className="panel panel-default" id="messages-block-el">
                    <div className="panel-body">
                        {messageElements.length ? messageElements : <h5>No messages</h5>}
                    </div>
                </div>
            </div>
        );
    }
});