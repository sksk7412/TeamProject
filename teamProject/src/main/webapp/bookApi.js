function search(form){
	let text = $('#input').val();
	console.log(text);
	getResult(text);
}

function getResult(keyword){
	$.ajax({
        method : 'get',
        url :`https://dapi.kakao.com//v3/search/book`,
        headers: {
            Authorization : 'KakaoAK ee5ab286710874c6781a0342217d1328'
        },
        data: {
            query: keyword,
            target: 'title'
        },
        encoding: 'UTF-8',
    })
    .done(data =>{
        const result = data.documents;
		
		console.log(data.meta.pageable_count);
		result.forEach(book=>{
		console.log(book);
		
		let html = `<div class='bookIMG'>`;
		html += `<p><img onclick ='getInfo(book)' src='${book.thumbnail}'</p></div>`;
		
		$('.result').append(html);
        })
    })
	
}

