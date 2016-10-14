// TODO namespaces !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1111
// TODO normal comment
// TODO generic
// This function assumes SPECIAL order of layout!
function createSentMessage(self) {
  let sentMessage = document.createElement('div');
  sentMessage.className = 'sent-message alert alert-warning';

  // Never use `div.innerHTML = this.value`. It is a security vulnerabilty!!!
  let messageText = document.createTextNode(`${self.value}`);
  sentMessage.appendChild(messageText);

  return sentMessage;
}

function scrollToBottom(node) {
  // TODO if mouse down on scroll
  node.scrollTop = node.scrollHeight;
}

/* -------------------------------------------------------------------------- */

function changeDestructionConditionLabel(self) {
  // use `children` instead of `childNodes` to exclude text and comment nodes
  if (self.value == 'Visits remaining') {
    self.parentNode.children[3].innerHTML = 'Destruct after: (visits)';
  } else if (self.value == 'Time remaining') {
    self.parentNode.children[3].innerHTML = 'Destruct after: (seconds)';
  } else {
    // TODO remove
    console.log('Can not change destruction condition label...');
  }
}

/* -------------------------------------------------------------------------- */

function keydownMessageText(self, event) {
  // event.preventDefault(); outside if prevents all keys and key combinations
  if (event.keyCode == 13 && event.shiftKey) {
    event.preventDefault();
    self.value += '\n'
  } else if (event.keyCode == 13) {
    event.preventDefault();
    let sentMessage = createSentMessage(self);

    let firstElementChild = self.parentNode.parentNode.parentNode.firstElementChild;
    firstElementChild.appendChild(sentMessage);

    scrollToBottom(firstElementChild);
    clearValue(self);
    // TODO sent Message to server to
  }
}

function clearValue(self) {
  self.value = '';
}


function clickStartDialog() {
  createConversation('conv12', 'conv12');
}

/* -------------------------------------------------------------------------- */
/* <div id="message-input"> ... </div> generation */
// TODO refactor ~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11

function createConversation(conversationId, tabName) {
  // TODO conversationId
  if (document.getElementById(conversationId) == null) {
    let uniqueConversationId = `${conversationId}` // TODO !!!!!!!!!!!!!!!!!!!!!!!

    let conversationsTab = createConversationTab(uniqueConversationId, tabName);

    let conversationsTabs = document.getElementById('conversations-tabs');
    conversationsTabs.appendChild(conversationsTab);

    let uniqueConversationTabPane = createUniqueConversationTabPane(uniqueConversationId);

    let conversationsTabContent = document.getElementById('conversations-tab-content');
    conversationsTabContent.appendChild(uniqueConversationTabPane);
  } else {
    // TODO remove
    console.log(`Conversation with id = '${conversationId}' already exists`);
  }
}

function createConversationTab(uniqueConversationId, tabName) {
  let a = document.createElement('a');
  a.href = `#${uniqueConversationId}`;
  a.setAttribute('data-toggle', 'tab');
  a.innerHTML = tabName;

  let conversationTab = document.createElement('li');
  conversationTab.appendChild(a);

  return conversationTab;
}

function createConversationMessages() {
  let conversationsMessages = document.createElement('div');
  conversationsMessages.className = 'conversations-messages';

  return conversationsMessages;
}

function createUniqueConversationTabPane(uniqueConversationId) {
  let conversationsMessages = createConversationMessages();
  let messageInput = createMessageInput();

  let uniqueConversationTabPane = document.createElement('div');
  uniqueConversationTabPane.id = uniqueConversationId;
  uniqueConversationTabPane.className = 'tab-pane fade';
  uniqueConversationTabPane.appendChild(conversationsMessages);
  uniqueConversationTabPane.appendChild(messageInput);

  return uniqueConversationTabPane;
}

/* -------------------------------------------------------------------------- */
/* <div id="message-input"> ... </div> generation */

function createMessageInput() {
  let messageDestructionInput = createMessageDestructionInput();
  let messageTextInput = createMessageTextInput();

  let messageInput = document.createElement('div');
  messageInput.id = 'message-input'
  messageInput.appendChild(messageDestructionInput);
  messageInput.appendChild(messageTextInput);

  return messageInput;
}

function createMessageDestructionInput() {
  let destructionType = createDestructionType();
  let labelForDestructionType = createLabel(destructionType.id, 'Destruction type:');
  let destructionCondition = createDestructionCondition();
  let labelForDestructionCondition = createLabel(destructionCondition.id, 'Destruct after: (visits)');

  let messageDestructionInput = document.createElement('div');
  messageDestructionInput.id = 'message-destruction-input';
  messageDestructionInput.appendChild(labelForDestructionType);
  messageDestructionInput.appendChild(lineBreak());
  messageDestructionInput.appendChild(destructionType);
  messageDestructionInput.appendChild(labelForDestructionCondition);
  messageDestructionInput.appendChild(lineBreak());
  messageDestructionInput.appendChild(destructionCondition);

  return messageDestructionInput;
}

function createDestructionType() {
  let firstOption = createOption('Visits remaining');
  let secondOption = createOption('Time remaining');

  let destructionType = document.createElement('select');
  destructionType.id = 'destruction-type';
  destructionType.className = 'form-control';
  destructionType.name = 'destruction_type';
  destructionType.onchange = () => { changeDestructionConditionLabel(destructionType); };
  destructionType.appendChild(firstOption);
  destructionType.appendChild(secondOption);

  return destructionType;
}

function createDestructionCondition() {
  let destructionCondition = document.createElement('input');
  destructionCondition.id = 'destruction-condition';
  destructionCondition.className = 'form-control'
  destructionCondition.name = 'destruction_condition';

  return destructionCondition;
}

function createMessageTextInput() {
  let messageText = createMessageText();
  let messageTextInputTip = createMessageTextInputTip();
  let labelForMessageText = createLabelWithChildren(
    messageText.id,
    document.createTextNode('Message text:'),
    messageTextInputTip
  );

  let messageTextInput = document.createElement('div');
  messageTextInput.id = 'message-text-input';
  messageTextInput.appendChild(labelForMessageText);
  messageTextInput.appendChild(lineBreak());
  messageTextInput.appendChild(messageText);

  return messageTextInput;
}

function createMessageText() {
  let messageText = document.createElement('textarea');
  // class="form-control" before id="message-text" !!!
  messageText.className = 'form-control';
  messageText.id = 'message-text';
  messageText.onkeydown = () => { keydownMessageText(messageText, event); }

  return messageText;
}

function createMessageTextInputTip() {
  let messageTextInputTip = document.createElement('span');
  messageTextInputTip.className = 'message-text-input-tip';
  messageTextInputTip.title = '`Enter` - publish message&#010;`Shift+Enter` - new line';
  messageTextInputTip.innerHTML = '?';

  return messageTextInputTip;
}

/* -------------------------------------------------------------------------- */
// Generation helpers
function lineBreak() {
  return document.createElement('br');
}

function createLabel(htmlFor, innerHTML) {
  let label = document.createElement('label');
  label.htmlFor = htmlFor;
  label.innerHTML = innerHTML;

  return label;
}

function createLabelWithChildren(htmlFor, ...children) {
  let label = document.createElement('label');
  label.htmlFor = htmlFor;
  for (let i in children) { label.appendChild(children[i]); }

  return label;
}

function createOption(innerHTML) {
  let option = document.createElement('option');
  option.innerHTML = innerHTML;
  return option;
}
