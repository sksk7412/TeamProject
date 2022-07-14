// 검색어에 관한 책 값 가져오기
let curpage = 1;							// 최초 페이지
function search(dir) {
	let text = $('#input').val();			// 검색어 정
	$('.result').empty();					// 검색 후 다시 검색 시 해당구역 초기화
	
	getResult(text, dir);
}

function getResult(keyword, dir) {
	if(dir === 2){							// next-button 의 value == 2
		curpage++;							// page++
	}
	else if(dir === 1 && curpage > 1){		// preview-button 의 value == 1
		curpage--;							// page--
	}
	console.log("getResult");
	$.ajax({
		method: 'get',
		url: `https://dapi.kakao.com//v3/search/book`,
		headers: {
			Authorization: 'KakaoAK 7209aad7048422200f37096c1bdde36e'
		},
		data: {
			page : `${curpage}`,
			query: keyword,
			target: 'title'
		},
		encoding: 'UTF-8',
	})
		.done(data => {
			const result = data.documents;
			const metas = data.meta;
			
			result.forEach(book => {
				const isbn = book.isbn;

				let url = `bookInfo.jsp?isbn=${isbn}`;

				let html = `<div class='book' onclick="location.href='${url}'">`;
				html += `<p><img id="thumbnail" src='${book.thumbnail}'></p>`
				html += `<div class="title">'${book.title}'</div></div>`;
				
				$('.result').append(html);
			})
			if(metas.is_end){
				curpage--;
				return;
			}
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
		result.forEach(book=>{
			console.log(book.valueOf());
			let html = `<div class="bookInfo">
							<div class="img"><img src="${book.thumbnail}"></div>
							<div class="info">
								<div class="title">${book.title}</div>
								<div class="authors">${book.authors}</div>
								<div class="publisher">${book.publisher}</div>
								
							</div>
						</div>`;
			let html2 = `<div class="contents">${book.contents}</div>`;
			
			$('.main').append(html);
			$('.main2').append(html2);
			$('.dibsBookContents').append(html);
			})
		})
}

// best_seller / new 책
function getBookstoArray(bestSeller) {
	for (let i = 0; i < bestSeller.length; i++) {
		let num = bestSeller[i];
		num = num.split(" ");

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
			result.forEach(book => {
				let isbns = book.isbn;
				
				let url = `bookInfo.jsp?isbn=${isbns}`;
				
				let html = `<div class="bookInfo" onclick="location.href='${url}'"><div class="img"><img id="thumbnail" src="${book.thumbnail}"></div><div class="info"><div class="title">${book.title}</div></div></div>`;

				$('.book').append(html);
			})
		})
	}




}