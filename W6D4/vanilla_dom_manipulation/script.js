document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants
  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });

  // adding SF places as list items

  // --- your code here!

  const addListItem = (e) => {
    e.preventDefault();
    let input = document.querySelector('.favorite-input');
    let text = input.value;
    input.value = "";
    let ul = document.querySelector('#sf-places');
    let li = document.createElement('li');
    li.textContent = text;
    ul.appendChild(li);
  };

  document.querySelectorAll('.list-container form').forEach((form) => {
    form.addEventListener('submit', addListItem);
  });


  // adding new photos

  // --- your code here!

  const togglePhotoForm = e => {
    e.preventDefault();
    let div = document.querySelector('.photo-form-container');
    div.classList.toggle('hidden');
  };

  document.querySelectorAll('.photo-show-button').forEach((button) => {
    button.addEventListener('click', togglePhotoForm);
  });

  const addPhoto = e => {
    e.preventDefault();
    let li = document.createElement('li');
    let img = document.createElement('img');
    let ul = document.querySelector('.dog-photos');
    let input = document.querySelector('.photo-url-input');
    let text = input.value;

    input.value = "";
    img.src = text;
    li.appendChild(img);
    ul.appendChild(li);
  };

  document.querySelectorAll('.photo-form-container').forEach(form => {
    form.addEventListener('submit', addPhoto);
  });
});
