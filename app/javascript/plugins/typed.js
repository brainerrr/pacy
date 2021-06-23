import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Welcome to Pacy.", "Scan the QR code.", "Order.", "Include shared items.", "Enjoy your meal.", "Pay.", "Easy.", "Pacy"],
    typeSpeed: 100,
    loop: true
  });
}

export { loadDynamicBannerText };
