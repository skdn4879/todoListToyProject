const add = document.querySelector(".btn-new-todo");

function getUserName(){
	const name_input = add.querySelector("input");

	const USER_LS = "currentUser";
	const userName = localStorage.getItem(USER_LS);
	
	if(userName == null){
		name_input.value = ""
	} else{
		name_input.value = userName;
	}
	document.addForm.submit();
}

add.addEventListener("click", getUserName);