const express = require('express');
const bodyParser = require('body-parser');
const morgan = require('morgan');

const app = express();
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json());

// Logging
app.use(morgan('dev'));

app.get('/movies', showMovieList);
app.post('/movies', addMovie);
app.get('/movies/:id', showMovieDetail);
app.delete('/movies/:id', deleteMovie);
app.put('/movies/:id', editMovie);

app.use(showMovieList);

// // 여기까지 오면 - 그냥 목록 출력
// app.use('/', showMovieList);

app.listen(3000, function () {
	console.log('Moviest Server is listening @ 3000');
});


// 영화 ID 생성용
var lastId = 2;
var movies = [];
try {
	const fs = require('fs');
	var content = fs.readFileSync('movieData.json', 'utf8');
	movies = JSON.parse(content);
}
catch ( error ) {
	console.log('영화 데이터 읽기 에러. movieData.json 파일 확인', error);
	process.exit();
}

function getMovie(id) {
	for(var movie of movies) {
		if ( movie.id == id ) {
			return movie;
		}
	}
	return null;
}

function showMovieList(req, res) {
   var list = [];
	for (var movie of movies) {
		list.push({title:movie.title, id:movie.id});
	}

   var result = {
      count: list.length,
      data: list
   };   
   return res.json(result);
}

function addMovie(req, res) {

   var title = req.body.title;
	// 제목이 없으면 에러
	if (!title) {
		res.status(400).send({ msg: 'Error : 영화 제목 없음' });
      return;
	}

	var newItem = {
		id : ++lastId,
		title: title
	};

   var director = req.body.director;
	if (director) {
		newItem['director'] = director;
	}

	var yearStr = req.body.year;
	if (yearStr) {
		var year = parseInt(req.body.year);
		// 연도는 숫자로만
		if (!year) {
			res.status(400).send({ msg: 'Error : year는 숫자만 입력' });
			return;
		}
		newItem['year'] = year;
	}

	var synopsis = req.body.synopsis;
	if (synopsis) {
		newItem['synopsis'] = synopsis;
	}

	movies.push(newItem);

	res.json({msg:'새 영화 추가 성공', data : newItem});
}

function showMovieDetail(req, res) {
	const id = req.params.id;
	const movie = getMovie(id);
	if ( ! movie ) {
		res.status(404).send({ msg: 'Not Found' });
		return;
	}

	res.status(200).json(movie);
}

// 영화 삭제
function deleteMovie(req, res) {
	const id = req.params.id;

	for(var i = 0 ; i < movies.length ; i++) {
		const movie = movies[i];
		if ( movie.id == id) {
			movies.splice(i, 1);
			res.status(200).send({msg:'삭제 성공', data:movie});
			return;
		}
	}

	// 없는 영화 ID면 400번 에러
	res.status(404).send({ msg: 'Not Found' });
}

function editMovie(req, res) {
	const id = req.params.id;
	var movie = getMovie(id);

	if ( ! movie ) {
		res.status(404).send({ msg: 'Error : 수정하려는 영화 정보 없음' });
		return;
	}

	// 감독 정보 수정
	var director = req.body.director;
	if (director) {
		movie['director'] = director;
	}

	// 연도 수정
	var yearStr = req.body.year;
	if (yearStr) {
		var year = parseInt(req.body.year);
		// 연도는 숫자로만
		if (!year) {
			res.status(400).send({ msg: 'year는 int 타입' });
			return;
		}
		movie['year'] = year;
	}

	// 시놉시스 수정
	var synopsis = req.body.synopsis;
	if (synopsis) {
		movie['synopsis'] = synopsis;
	}
	
	res.send({msg:'수정 성공', data:movie});
}
