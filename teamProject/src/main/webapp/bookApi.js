// 검색어에 관한 책 값 가져오기
function search(form) {
	let text = $('#input').val();
	getResult(text);
}

function getResult(keyword) {
	$.ajax({
		method: 'get',
		url: `https://dapi.kakao.com//v3/search/book`,
		headers: {
			Authorization: 'KakaoAK 7209aad7048422200f37096c1bdde36e'
		},
		data: {
			query: keyword,
			target: 'title'
		},
		encoding: 'UTF-8',
	})
		.done(data => {
			const result = data.documents;

			$('.result').empty();
			result.forEach(book => {
				const isbn = book.isbn;

				let url = `bookInfo.jsp?isbn=${isbn}`;

				let html = `<div class='book' onclick="location.href='${url}'">`;
				html += `<p><img id="thumbnail" src='${book.thumbnail}'></p>`
				html += `<span id="title">'${book.title}'</span></div>`;

				$('.result').append(html);
			})
		})
}

// isbn을 이용해서 값 가져오기
function getBookForIsbn(isbn) {

	let isbns = isbn.split(" ");

	$.ajax({
		method: 'get',
		url: `https://dapi.kakao.com//v3/search/book`,
		headers: {
			Authorization: 'KakaoAK 7209aad7048422200f37096c1bdde36e'
		},
		data: {
			query: isbns[0],
			target: 'isbn'
		},
		encoding: 'UTF-8',
	})
		.done(data => {
			const result = data.documents;
			result.forEach(book => {
				let html = `<div class="bookInfo"><div class="img"><img id="thumbnail" src="${book.thumbnail}"></div><div class="info"><div class="title">${book.title}</div><div class="contents">${book.contents}</div></div></div>`;

				$('.book').append(html);
			})
		})
}

// 베스트셀러의 값 가져오기
function getBookstoArray(bestSeller) {
	for (let i = 0; i < bestSeller.length; i++) {
		let num = bestSeller[i];
		num = num.split(" ");
		console.log(num);

		$.ajax({
			method: 'get',
			url: `https://dapi.kakao.com//v3/search/book`,
			headers: {
				Authorization: 'KakaoAK 7209aad7048422200f37096c1bdde36e'
			},
			data: {
				query: num,
				target: 'isbn'
			},
			encoding: 'UTF-8',
		}).done(data => {
			const result = data.documents;
			console.log(result);
			result.forEach(book => {
				
				let html = `<div class="bookInfo"><div class="img"><img id="thumbnail" src="${book.thumbnail}"></div><div class="info"><div class="title">${book.title}</div></div></div>`;

				$('.book').append(html);
			})
		})
	}




}