$(document).ready(function() {
  const elements = stripe.elements();

  const card = elements.create('card');

  card.mount('#card-element');

  const form = document.getElementById('payment-form');
  form.addEventListener('submit', function(event){
    event.preventDefault();
    // stripe.createToken(card) will make the AJAX request to generate the
    // Stripe one time user temp_token
    stripe.createToken(card).then( (result) => {
      if(result.error) {
        const errorDiv = document.getElementById('card-errors');
        errorDiv.textContent = result.error.message;
      } else {
        document.querySelector('#stripe_token').value = result.token.id;
        document.querySelector('#server-form').submit();
      }
    });
  });

});
