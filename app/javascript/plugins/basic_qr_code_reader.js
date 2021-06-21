import { BrowserQRCodeReader } from '@zxing/library';
const basicQrCodeReader = () => {
  const qrCodeDiv = document.querySelector("#qr-code-reader")
  if (qrCodeDiv) {
    const codeReader = new BrowserQRCodeReader();
    codeReader
      .decodeFromInputVideoDevice(undefined, 'video')
      .then((result) => {
        // process the result
        console.log(result.text)

        document.getElementById('result').textContent = result.text
        window.location.href = result.text
      })
      .catch(err => console.error(err));
  }
}


export { basicQrCodeReader };
