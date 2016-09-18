// Oh, this clumsy Rails Way...
window.onload = () => {
    const form = document.getElementById('message-form');

    // Rails assets--view problem
    if (!form) { return; }

    const messagesBlock = document.getElementById('messages-block-el');
    const messageInput = document.getElementById('message_text');
    const submitBtn = document.getElementById('submit-form-el');

    const submitForm = () => {
        if (/^(?!\s*$).+/.test(messageInput.value)) {
            form.submit();
            messageInput.value = '';
        }

        messageInput.focus();
    };

    messageInput.onkeypress = e => (e.keyCode === 13) ? e.preventDefault() | submitForm() : true;
    submitBtn.addEventListener('click', e => e.preventDefault() | submitForm());

    messagesBlock.scrollTop = messagesBlock.scrollHeight;
};
