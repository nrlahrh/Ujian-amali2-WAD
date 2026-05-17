const form = document.getElementById('search-form');
const input = document.getElementById('search-input');
const movieContainer = document.getElementById('movie-container');
const loading = document.getElementById('loading');

<<<<<<< HEAD
form.addEventListener('submit', async (e) => {
    e.preventDefault();

    const searchValue = input.value.trim();

    if (searchValue === "") {
        loading.innerHTML = "❌ Sila masukkan carian!";
        movieContainer.innerHTML = "";
        return;
    }

    loading.innerHTML = `
        ⏳ Loading...
    `;
    movieContainer.innerHTML = "";

    try {
        const res = await fetch(
            `https://api.tvmaze.com/search/shows?q=${searchValue}`
        );

        const data = await res.json();

        loading.innerHTML = "";

        if (data.length === 0) {
            movieContainer.innerHTML = `
                <p style="grid-column:1/-1;text-align:center;">
                    ❌ Movie not found
                </p>
            `;
=======
form.addEventListener('submit', async function (e) {
    e.preventDefault();
    const searchValue = input.value.trim();

    if (searchValue === '') {
        alert('Sila masukkan carian!');
        return;
    }

    movieContainer.innerHTML = '';
    loading.innerHTML = '⏳ Loading...';

    try {
        const response = await fetch(
            `https://api.tvmaze.com/search/shows?q=batman`
        );

        const data = await response.json();
        loading.innerHTML = '';

        if (data.length === 0) {
            movieContainer.innerHTML = `
                        <p style="
                            color:white;
                            text-align:center;
                            font-size:20px;
                            grid-column:1/-1;
                        ">
                            ❌ Tiada data dijumpai
                        </p>
                    `;
>>>>>>> 65a894e (Add basic HTML structure and search form)
            return;
        }

        data.forEach(item => {
<<<<<<< HEAD
=======

>>>>>>> 65a894e (Add basic HTML structure and search form)
            const show = item.show;

            const image = show.image
                ? show.image.medium
                : 'https://via.placeholder.com/210x295?text=No+Image';

<<<<<<< HEAD
            const premiered = show.premiered || 'N/A';

            movieContainer.innerHTML += `
                <div class="card">
                    <img src="${image}" alt="movie">
                    <h2>${show.name}</h2>
                    <p>📅 ${premiered}</p>
                </div>
            `;
        });

    } catch (error) {
        loading.innerHTML = "❌ ERROR loading data";
        movieContainer.innerHTML = "";
    }
=======
            const premiered = show.premiered
                ? show.premiered
                : 'Tiada Data';

            movieContainer.innerHTML += `

                        <div class="card">

                            <img src="${image}" alt="movie">
                            <h2>${show.name}</h2>
                            <p>📅 ${premiered}</p>

                        </div>

                    `;
        });

    } catch (error) {

        loading.innerHTML = '';

        movieContainer.innerHTML = `
                    <p style="
                        color:white;
                        text-align:center;
                        font-size:20px;
                    ">
                        ⚠️ Ralat mendapatkan data
                    </p>
                `;

        console.log(error);
    }

>>>>>>> 65a894e (Add basic HTML structure and search form)
});