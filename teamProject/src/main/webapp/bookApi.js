// 검색어에 관한 책 값 가져오기
let curpage = 1;							// 최초 페이지
function search(dir) {
	let text = $('#input').val();			// 검색어 정
	$('.result').empty();					// 검색 후 다시 검색 시 해당구역 초기화
	$('.left_arrow').empty();
	$('.right_arrow').empty();
	$('.page_buttons').empty();
	getResult(text, dir);
}


function getResult(keyword, dir) {
	if (dir === 2) {							// next-button 의 value == 2
		curpage++;							// page++
	}
	else if (dir === 1 && curpage > 1) {		// preview-button 의 value == 1
		curpage--;							// page--
	}
	$.ajax({
		method: 'get',
		url: `https://dapi.kakao.com//v3/search/book`,
		headers: {
			Authorization: 'KakaoAK 7209aad7048422200f37096c1bdde36e'
		},
		data: {
			page: `${curpage}`,
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

				if (book.thumbnail !== "") {

					let url = `bookInfo.jsp?isbn=${isbn}`;

					let html = `<div class='book' onclick="location.href='${url}'">`;
					html += `<p><img id="thumbnail" src='${book.thumbnail}'></p>`
					html += `<div class="title">'${book.title}'</div></div>`;


					$('.result').append(html);
				}
			})

			let maxPage = Math.ceil(metas.pageable_count / 10);

			let left_arrow = `<img src="image/left_arrow.png" id="arrow">`
			let right_arrow = `<img src="image/right_arrow.png" id="arrow">`
			$('.left_arrow').append(left_arrow);
			$('.right_arrow').append(right_arrow);

			if (metas.is_end && curpage > maxPage) {
				curpage--;
				return;
			}
			let pageButton = `<p id='nowP'></p>`
			pageButton += `<p>/</p>`
			pageButton += `<p id='totalP'></p>`

			$('.page_buttons').append(pageButton);
			$('#nowP').text(curpage);
			$('#totalP').text(maxPage);
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

// 찜하기에 책 불러오기
function getDibs(isbns) {
	for (let i = 0; i < isbns.length; i++) {
		/*	let ib =isbn[i];*/
		console.log(isbns[i]);
		let isbn = isbns[i].split(" ");

		$.ajax({
			method: 'get',
			url: `https://dapi.kakao.com//v3/search/book`,
			headers: {
				Authorization: 'KakaoAK 7209aad7048422200f37096c1bdde36e'
			},
			data: {
				query: isbn,
				target: 'isbn'
			},
			encoding: 'UTF-8',
		})

			.done(data => {
				const result = data.documents;
				result.forEach(book => {
					console.log(book.valueOf());

					let html = `<div class="bookInfo">
							<div class="img" onclick="view()"><img src="${book.thumbnail}"></div>
							<div class="info">
							<input type="hidden" value="${isbn}" name="isbn">
								<div class="title">${book.title}</div>
								<div class="authors">${book.authors}</div>
								<div class="publisher">${book.publisher}</div>
								<input type="IMAGE" src="image/trashcan.png" class="delbtn" name="submit" value="submit">
							</div>
						</div>`;
					let html2 = `<tr>
							<td class="bookThumbnail"><img src = "${book.thumbnail}"></td>
							<td class="bookTitle">${book.title}</td>
							<td class="bookAuthor">${book.authors}</td>
							<td class="bookContent">${book.contents}</td>
							<input type="hidden" value=${book.isbn} name="isbn">
							<td class="delete"><input type="IMAGE" src="image/trashcan.png" class="delbtn1" name="submit" value="submit"></td>
						</tr>
						`;

					$('.main').append(html);
					$('.results').append(html);
					$('.LibraryList').append(html2);
				})
			})
	}
}

function view() {
	$('.del').prop('value', 'addLibrary');
	$('.results').submit();

}

// review페이지 책 하나 불러오기 
function bookForReview(isbn) {
	$.ajax({
		method: 'get',
		url: `https://dapi.kakao.com//v3/search/book`,
		headers: {
			Authorization: 'KakaoAK 7209aad7048422200f37096c1bdde36e'
		},
		data: {
			query: isbn,
			target: 'isbn'
		},
		encoding: 'UTF-8',
	}).done(data => {
		const result = data.documents;
		result.forEach(book => {
			let reviewForm = `
								<input type="hidden" value='${isbn}' name='isbn'>
								<a class="img"><img src="${book.thumbnail}"></a>
								<a class="title">${book.title}</a>
								<a class="authors">${book.authors}</a>
								<a class="publisher">${book.publisher}</a>
								`;
			$('.bookInfo').append(reviewForm);
		})
	})
}

// my review
function getMyLb(myLb) {
	for (let i = 0; i < myLb.length; i++) {
		let targetIsbn = myLb[i];
		$.ajax({
			method: 'get',
			url: `https://dapi.kakao.com//v3/search/book`,
			headers: {
				Authorization: 'KakaoAK 7209aad7048422200f37096c1bdde36e'
			},
			data: {
				query: targetIsbn,
				target: 'isbn'
			},
			encoding: 'UTF-8',
		}).done(data => {
			const result = data.documents;
			result.forEach(book => {
				let thumbnail = book.thumbnail;
				let title = book.title;
				let authors = book.authors;

				let html = "<div class='bookInfo'>"
				html += `<a class='thumbnail'><img src=${thumbnail}></a>`
				html += `<a class='title'>${title}</a>`
				html += `<a class='authors'>'${authors}'</a>`
				html += `<a><a href= './write?isbn=${targetIsbn}' target="_top"> <button class="writeBtn">리뷰쓰기</button></a></a></div>`;

				$('.reviewTable').append(html);
			})
		})
	}
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