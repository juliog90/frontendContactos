//API URLs
var apiUrl ='http://localhost/jsonarrays/user/'
var user;
//init
function init(){
    console.log('Initializing page...')
    //check authentication
    
    if(sessionStorage.authenticated !='true') window.location = 'login.html'
    //console.log(sessionStorage.user);
    //console.log(sessionStorage.token);

    user = JSON.parse(sessionStorage.user);
    document.getElementById('userphoto').src = user.photo;
    document.getElementById('username').innerHTML = user.name;
    document.getElementById('userrole').innerHTML = user.role.name;
    //get Contacts
    getContacts();

}

//function logOut(){
 //   var y = new XMLHttpRequest();
//}
function getContacts() {
    var x = new XMLHttpRequest();
    x.open('GET',apiUrl + 'contacts/');
    x.setRequestHeader('username',user.id);
    x.setRequestHeader('token',sessionStorage.token);
    x.send();
    x.onreadystatechange = function(){
        if(x.onreadystatechange == 4 && x.status ==200){
            var jsonData = JSON.parse(x.responseText);
            console.log(jsonData);
        }
    }

}
