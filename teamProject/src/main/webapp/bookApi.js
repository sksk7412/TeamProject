// 검색어에 관한 책 값 가져오기
function search(form) {
	let text = $('#input').val();
	getResult(text);
}

function getResult(keyword) {
	$.ajax({
<<<<<<< HEAD
        method : 'get',
        url :`https://dapi.kakao.com//v3/search/book`,
        headers: {
            Authorization : 'KakaoAK 7209aad7048422200f37096c1bdde36e'
        },
        data: {
           query: keyword,
           target: 'title'
        },
        encoding: 'UTF-8',
    })
    .done(data =>{
        const result = data.documents;


		result.forEach(book=>{

			console.log(book.valueOf());
		const title = book.title;
		const img = book.thumbnail;
		const contents = book.contents;
		const authors = book.authors;


		const isbn = book.isbn;
		
		let url = `bookInfo.jsp?isbn=${isbn}`;
		
		let html = `<div class='book' onclick="location.href='${url}'">`;
	
		html += `<p><img src='${book.thumbnail}'></p>`;
		
		$('.result').append(html);
        })
    })
}

function getBookForIsbn(isbn){


	let isbns = isbn.split(" ");
	
	$.ajax({
        method : 'get',
        url :`https://dapi.kakao.com//v3/search/book`,
        headers: {
            Authorization : 'KakaoAK 7209aad7048422200f37096c1bdde36e'
        },
        data: {
           query: isbns[0],
           target: 'isbn'
        },
        encoding: 'UTF-8',
    })
    .done(data =>{
        const result = data.documents;
=======
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
>>>>>>> refs/remotes/origin/#04_dongho

<<<<<<< HEAD
		result.forEach(book=>{
			console.log(book.valueOf());
<<<<<<< HEAD
			let html = `<div class="bookInfo">
							<div class="img"><img src="${book.thumbnail}"></div>
							<div class="info">
								<div class="title">${book.title}</div>
								<div class="authors">${book.authors}</div>
								<div class="publisher">${book.publisher}</div>
								
							</div>
						</div>`;
			let html2 = `<div class="contents">${book.contents}</div>`;
=======
			let html = `<div class="bookList"><img src = "${book.thumbnail}"></div>`;
			html += `<div class="bookList">${book.title}</div>`;
			html += `<div class="bookList">${book.authors}</div>`;
>>>>>>> refs/remotes/origin/#02-NaYeon
			
<<<<<<< HEAD
			$('.main').append(html);
			$('.main2').append(html2);
=======
			$('.dibsBookContents').append(html);
        })
    })
}
function getLibraryForIsbn(isbn){
	
	let isbns = isbn.split(" ");
	
	$.ajax({
        method : 'get',
        url :`https://dapi.kakao.com//v3/search/book`,
        headers: {
            Authorization : 'KakaoAK 7209aad7048422200f37096c1bdde36e'
        },
        data: {
           query: isbns[0],
           target: 'isbn'
        },
        encoding: 'UTF-8',
    })
    .done(data =>{
        const result = data.documents;

		result.forEach(book=>{
			console.log(book.valueOf());
			let htmlThum = `<div class="LibraryList"><img src = "${book.thumbnail}"></div>`;
			let htmlTitle = `<div class="LibraryList">${book.title}</div>`;
			let htmlAu = `<div class="LibraryList">${book.authors}</div>`;
			let htmlCon = `<div class="LibraryList">${book.contents}</div>`;
			
			$('.bookThumnail').append(htmlThum);
			$('.bookTitle').append(htmlTitle);
			$('.bookAuthor').append(htmlAu);
			$('.bookContent').append(htmlCon);
			
>>>>>>> refs/remotes/origin/#02-NaYeon
        })
    })

=======
			$('.result').empty();
			result.forEach(book => {
				const isbn = book.isbn;
				console.log(book.valueOf());

				let url = `bookInfo.jsp?isbn=${isbn}`;

				let html = `<div class='book' onclick="location.href='${url}'">`;
				html += `<p><img id="thumbnail" src='${book.thumbnail}'></p>`;

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




>>>>>>> refs/remotes/origin/#04_dongho
}