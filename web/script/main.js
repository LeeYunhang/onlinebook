/**
 * 2015年11月26日02:22:02 By Mrcode
*/
var node = null;
function register() {
	if(node == null)
		document.getElementById("inner_page");
	node.src = "./register.jsp";
}

function returnHome() {
	window.history.back(-1);
}

function showUserView () {
	var user = document.getElementById("lookUser");
	var userTable = document.getElementById("lookUserTable");
	var book = document.getElementById("lookBook");
	var bookTable = document.getElementById("lookBookTable");
	user.hidden = false;
	userTable.hidden = false;
	book.hidden = true;
	bookTable.hidden = true;
}

function showBookView () {
	var user = document.getElementById("lookUser");
	var userTable = document.getElementById("lookUserTable");
	var book = document.getElementById("lookBook");
	var bookTable = document.getElementById("lookBookTable");
	user.hidden = true;
	userTable.hidden = true;
	book.hidden = false;
	bookTable.hidden = false;
}

function enterBackStage() {
	window.location.href = "./back_stage.html";
}