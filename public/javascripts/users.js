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
