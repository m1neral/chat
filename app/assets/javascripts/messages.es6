// Oh, this clumsy Rails Way...
window.onload = () => {
    const form = document.getElementById('message-form');

    // Rails assets--view problem
    if (!form) { return; }

    const messageInput = document.getElementById('message_text');
    const submitBtn = document.getElementById('submit-form-el');

    const submitForm = () => {
        if (/^(?!\s*$).+/.test(messageInput.value)) {
            form.submit();
            messageInput.value = '';
        }

        messageInput.focus();
    };

    messageInput.onkeypress = e => (e.key === 'Enter') ? e.preventDefault() | submitForm() : true;
    submitBtn.addEventListener('click', e => e.preventDefault() | submitForm());
};
