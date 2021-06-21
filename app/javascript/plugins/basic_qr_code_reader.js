import { BrowserQRCodeReader } from '@zxing/library';
const basicQrCodeReader = () => {
  const codeReader = new BrowserQRCodeReader();
console.log("hello world!!!")
  codeReader
    .decodeFromInputVideoDevice(undefined, 'video')
    .then((result) => {
      // process the result
      console.log(result.text)

      document.getElementById('result').textContent = result.text
    })
    .catch(err => console.error(err));
}


export { basicQrCodeReader };
