
function initPage(){
	countComments();
	registerEvents();
	addListener();
}

function countComments(){
	var commentAreaList = document.querySelectorAll('.commentArea');
	for(var i=0; i<commentAreaList.length; i++){
		var currentNode = commentAreaList[i];
		var numOfEachComment = currentNode.querySelectorAll('#eachComment').length;
		currentNode.parentNode.childNodes[12].textContent = numOfEachComment + "개의 댓글";
	}
}

function registerEvents(){
	var eleList = document.getElementsByClassName("numOfComment");
	for(var i=0; i<eleList.length; i++){
		eleList[i].addEventListener('click', toggleComments, false);
	}	
}

function toggleComments(e) {
	var commentBodyNode = e.target.nextElementSibling;
	var currentStyle = window.getComputedStyle(commentBodyNode).getPropertyValue("display");
	if(currentStyle === "none"){
		commentBodyNode.style.display = "inline";
	}
	else if(currentStyle === "inline"){
		commentBodyNode.style.display = "none";
	}
}

function addListener(){
	var formList = document.querySelectorAll(".commentWrite .button");
	
	for ( var j=0 ; j < formList.length ; j++) {
		formList[j].addEventListener('click', writeComments, false);
	}
}

function writeComments(e){
	e.preventDefault(); //submit 이 자동으로 동작하는 것을 막는다.
	var eleForm = e.currentTarget.form; //form element
	var oFormData = new FormData(eleForm); //form data들을 자동으로 묶어준다.
	var sID = eleForm[0].value;
	var url = "/board/" +sID + "/comments.json";
	var request = new XMLHttpRequest();
	request.open("POST" , url, true);
	
	request.onreadystatechange = function(){
		
		if(request.readyState == 4 && request.status == 200){
			var obj = JSON.parse(request.responseText);
			console.log(obj);
			var htmlSource =
				"<div id='eachComment'>" + obj.contents +
				"<form action = '/board/" + obj.id +
				"/comment/" + obj.commntId +
				"/delete' method='post'>" +
				"<input type='submit' value='댓글삭제'>" +
				"</form> <br /></div>";
			console.log(e);
			var commentArea = e.currentTarget.parentNode.parentNode.previousElementSibling;
			
			commentArea.insertAdjacentHTML('beforeend', htmlSource);
		}
		
	}
	
	request.send(oFormData);
}

window.onload = initPage;