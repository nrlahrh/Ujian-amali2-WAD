const form = document.getElementById('search-form');
const input = document.getElementById('search-input');
const movieContainer = document.getElementById('movie-container');
const loading = document.getElementById('loading');

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
            return;
        }

        data.forEach(item => {
            const show = item.show;

            const image = show.image
                ? show.image.medium
                : 'https://via.placeholder.com/210x295?text=No+Image';

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
});