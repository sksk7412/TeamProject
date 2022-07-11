function search(form){
	let text = $('#input').val();
	console.log(text);
	getResult(text);
}

function getResult(keyword){
	console.log(keyword);
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
		
		result.forEach(book=>{
		
		let html = `<div class='book' onclick="_0.detail.jsp">`;
		html += `<p><img src='${book.thumbnail}'></p>`;
		html += `<span>'${book}'</span></div>`;
		
		$('.result').append(html);
        })
    })
	
}