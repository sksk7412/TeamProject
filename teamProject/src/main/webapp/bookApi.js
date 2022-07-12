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

		result.forEach(book=>{

			console.log(book.valueOf());
		const title = book.title;
		const img = book.thumbnail;
		const contents = book.contents;
		const authors = book.authors;

		const isbn = book.isbn;
		

		
		let html = `<div class='book' onclick="location.href='_0.detail.jsp?title=${title}&img=${img}&contents=${contents}&authors=${authors}&isbn=${isbn}'">`;

		let url = `bookInfo.jsp?isbn=${isbn}`;
		
		html = `<div class='book' onclick="location.href='${url}'">`;

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
        })
    })

}
