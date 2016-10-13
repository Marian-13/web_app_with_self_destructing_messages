function focusOn(id) {
  if (event.keyCode == 13) {
    // TODO using this?
    event.preventDefault();
    document.getElementById(id).focus();
  }
}
