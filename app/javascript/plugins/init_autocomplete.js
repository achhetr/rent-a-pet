import places from 'places.js';

const initAutocomplete = () => {
  const locationInput = document.getElementById('user_location');
  if (locationInput) {
    places({ container: locationInput });
  }
};

export { initAutocomplete };