const paymentRedirect = () => {
  const paymentRedirect = document.querySelector(".pan-loader")
  if (paymentRedirect) {
    setTimeout(() => {
      window.location.href = paymentRedirect.dataset.redirect
    }, 5000)
  }
}


export { paymentRedirect };
