// TODO normal comment
// TODO generic
// This function assumes SPECIAL order of layout!
function sendMessage(self) {
  if (event.keyCode == 13) {
    let div = document.createElement('div');
    div.className = 'sent-message alert alert-warning';

    // Never use `div.innerHTML = this.value`. It is a security vulnerabilty!!!
    let text = document.createTextNode(`${self.value}`);
    div.appendChild(text);


    let firstElementChild = self.parentNode.parentNode.firstElementChild;
    firstElementChild.appendChild(div);
    scrollToBottom(firstElementChild);

    self.value = '';
  }
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
    // TODO
  }
}
