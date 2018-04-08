
// ネイティブ → WebView
function changeDisplay(val) {
  var label = document.getElementById("label");
  label.textContent = val;
}

function tappedMenuButton() {
  // WebView → ネイティブ
  webkit.messageHandlers.callbackHandler.postMessage("tappedMenuButton()");
}
