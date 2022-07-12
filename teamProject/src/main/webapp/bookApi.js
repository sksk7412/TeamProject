function search(form){
	let text = $('#input').val();
	getResult(text);
}

function getResult(keyword){
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
	
		$('.result').empty();
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
			let html = `<div class="bookList"><img src = "${book.thumbnail}"></div>`;
			html += `<div class="bookList">${book.title}</div>`;
			html += `<div class="bookList">${book.authors}</div>`;
			
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
			
        })
    })
}