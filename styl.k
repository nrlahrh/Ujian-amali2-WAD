*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, Helvetica, sans-serif;
}

body{
    background-image: url('img/gambar4.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    min-height: 100vh;
    padding: 30px;
}


.container{
    width: 100%;
    max-width: 1200px;
    margin: auto;
}


h1{
    text-align: center;
    color: white;
    margin-bottom: 25px;
    font-size: 40px;
}


#search-form{
    display: flex;
    justify-content: center;
    gap: 10px;
    margin-bottom: 40px;
    flex-wrap: wrap;
}


#search-input{
    width: 350px;
    padding: 14px;
    border: none;
    border-radius: 10px;
    font-size: 16px;
    outline: none;
}

button{
    padding: 14px 24px;
    border: none;
    border-radius: 10px;
    background: #ff3d00;
    color: white;
    font-size: 16px;
    cursor: pointer;
    transition: 0.3s;
}

button:hover{
    background: #e63600;
    transform: scale(1.05);
}


.card-container{
    display: grid;

    /* Responsive Grid */
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));

    gap: 25px;
}


.card{
    background: rgba(255,255,255,0.15);
    backdrop-filter: blur(8px);

    border-radius: 15px;
    overflow: hidden;

    text-align: center;
    padding-bottom: 15px;

    transition: 0.3s;
}

.card:hover{
    transform: translateY(-5px);
}


/* .card img{
    width: 100%;
    height: 320px;
    object-fit: cover; 
}  */


.card h2{
    color: white;
    font-size: 20px;
    margin: 15px 10px 10px;
}

.card p{
    color: white;
    font-size: 15px;
}

/* Responsive Mobile */
@media(max-width: 600px){

    h1{
        font-size: 28px;
    }

    #search-input{
        width: 100%;
    }

    button{
        width: 100%;
    }
}


<!DOCTYPE html>
<html lang="ms">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MovieFinder</title>

    <style>

        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        }

        body{
            background-image: url('img/gambar4.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            min-height: 100vh;
            padding: 30px;
        }

        .container{
            max-width: 1200px;
            margin: auto;
        }

        h1{
            text-align: center;
            color: white;
            margin-bottom: 25px;
            font-size: 40px;
        }

        /* SEARCH */
        #search-form{
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 40px;
            flex-wrap: wrap;
        }

        #search-input{
            width: 350px;
            padding: 14px;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            outline: none;
        }

        button{
            padding: 14px 24px;
            border: none;
            border-radius: 10px;
            background: #ff3d00;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }

        button:hover{
            background: #e63600;
            transform: scale(1.05);
        }

        /* LOADING */
        #loading{
            text-align: center;
            color: white;
            font-size: 20px;
            margin-bottom: 20px;
        }

        /* CARD CONTAINER */
        .card-container{
            display: grid;

            /* Responsive Grid */
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));

            gap: 25px;
        }

        /* CARD */
        .card{
            background: rgba(255,255,255,0.15);
            backdrop-filter: blur(8px);

            border-radius: 15px;
            overflow: hidden;

            text-align: center;
            padding-bottom: 15px;

            transition: 0.3s;
        }

        .card:hover{
            transform: translateY(-5px);
        }

        .card img{
            width: 100%;
            height: 320px;
            object-fit: cover;
        }

        .card h2{
            color: white;
            font-size: 20px;
            margin: 15px 10px 10px;
        }

        .card p{
            color: white;
            font-size: 15px;
        }

        /* MOBILE */
        @media(max-width: 600px){

            h1{
                font-size: 28px;
            }

            #search-input{
                width: 100%;
            }

            button{
                width: 100%;
            }
        }

    </style>
</head>
<body>

    <div class="container">

        <h1>🎬 MovieFinder</h1>

        <!-- SEARCH -->
        <form id="search-form">

            <input 
                type="text" 
                id="search-input"
                placeholder="Cari movie atau show..."
            >

            <button type="submit">
                🔍 Search
            </button>

        </form>

        <!-- LOADING -->
        <div id="loading"></div>

        <!-- CARD -->
        <div class="card-container" id="movie-container"></div>

    </div>

    <script>

        const form = document.getElementById('search-form');
        const input = document.getElementById('search-input');
        const movieContainer = document.getElementById('movie-container');
        const loading = document.getElementById('loading');

        form.addEventListener('submit', async function(e){

            e.preventDefault();

            const searchValue = input.value.trim();

            // INPUT KOSONG
            if(searchValue === ''){
                alert('Sila masukkan carian!');
                return;
            }

            movieContainer.innerHTML = '';
            loading.innerHTML = '⏳ Loading...';

            try{

                // FETCH API
                const response = await fetch(
                    `https://api.tvmaze.com/search/shows?q=${searchValue}`
                );

                const data = await response.json();

                loading.innerHTML = '';

                // TIADA DATA
                if(data.length === 0){
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
                    return;
                }

                // LOOP DATA
                data.forEach(item => {

                    const show = item.show;

                    const image = show.image
                        ? show.image.medium
                        : 'https://via.placeholder.com/210x295?text=No+Image';

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

            }catch(error){

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

        });

    </script>

</body>
</html>