function login(){
    console.log('Login...');
    //create request object 
    var x = new XMLHttpRequest();
    //prepare request
    x.open('GET',apiUrl + 'user/');
    //request headers
    x.setRequestHeader('username' ,document.getElementById('username').value);
    x.setRequestHeader('password' ,document.getElementById('password').value);
    //send request 
    x.send();
    //onreadystatechange event handler
    x.onreadystatechange = function(){
        //readyState = 4 :back with info
        //status =200:Ok 
        //status =404:page not found(check API URL)
        //status =500:Request denied by server(check APIacess-Control-Allow-On)
        if(x.readyState ==4 & x.status == 200){
            //console.log(x.responseText); show in Json simple
            //parse response to JSON
            var jsonResponse = JSON.parse(x.responseText);
            //Json format 
            //console.log(jsonResponse);
            //grant access
            if(jsonResponse.status == 0){
               // console.log('Accessing');
                //grant access
                console.log(jsonResponse);
                sessionStorage.authenticated = true;
                sessionStorage.user= JSON.stringify(jsonResponse.user);
                sessionStorage.token = jsonResponse.token;
                window.location = 'index.html';
            }
            else {
            //access denied
                document.getElementById('error').innerHTML = jsonResponse.errorMessage;
                document.getElementById('error').style.display = 'block';
            }
        }
    }
}