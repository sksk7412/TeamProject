// 검색어에 관한 책 값 가져오기
function search() {
	
	// 파라미터 page 존재여부 확인 후
	
	let text = $('#input').val();
	$('.result').empty();
	getResult(text, $("input#page").val());
}
<<<<<<< HEAD

	function getResult(keyword) {
		$.ajax({
	
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
	
=======
function getResult(keyword, p) {
>>>>>>> refs/remotes/origin/#04_dongho
	$.ajax({
<<<<<<< HEAD
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
=======
		method: 'get',
		url: `https://dapi.kakao.com//v3/search/book`,
		headers: {
			Authorization: 'KakaoAK 7209aad7048422200f37096c1bdde36e'
		},
		data: {
			query: keyword,
			target: 'title',
			page: p
		},
		encoding: 'UTF-8',
	})
>>>>>>> refs/remotes/origin/#04_dongho
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
			let html = `<div class="bookList"><img src = "${book.thumbnail}"></div>`;
			html += `<div class="bookList">${book.title}</div>`;
			html += `<div class="bookList">${book.authors}</div>`;
			
			$('.main').append(html);
			$('.main2').append(html2);
			$('.dibsBookContents').append(html);
        })
    })
}

<<<<<<< HEAD
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
			
        })
    })

			$('.result').empty();
=======
			
>>>>>>> refs/remotes/origin/#04_dongho
			result.forEach(book => {
				const isbn = book.isbn;

				let url = `bookInfo.jsp?isbn=${isbn}`;

				let html = `<div class='book' onclick="location.href='${url}'">`;
				html += `<p><img id="thumbnail" src='${book.thumbnail}'></p>`
				html += `<span id="title">'${book.title}'</span></div>`;

				$('.result').append(html);
			})
<<<<<<< HEAD
		

=======
			console.log(data.meta.is_end);
			/*
			if(!data.meta.is_end){
				return getResult(keyword, ++p);				
			}
			else{
				return;
			}
			*/
		})
}
>>>>>>> refs/remotes/origin/#04_dongho

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
}