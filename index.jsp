
<html>
    <style>
        body{
            background-color: black;
            font: 20px verdana;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content:center;
            align-items:center;
            width:95%;
            height:95%
        }
        #login{
            width:500px;
            height:250px;
            display: flex;
            flex-direction: column;
            align-items:center;
            border: 1px solid white
        }
        #LoginInput{
            padding:10px;
        }
    </style>
    <head>
        <title>Application1</title>
    </head>

    <body>

        <div id="login">
            
            <%
                    if (session.getAttribute("mail") != null) {
                        response.sendRedirect("home");
                    }
            %>
            <h3>LOGIN</h3>
            <div id="LoginInput">
                <label>MAIl ID   : </label>
                <input type="text" id="loginInputMail"/> 
            </div>
            <div id="LoginInput">
                <label>PASSWORD : </label>
                <input type="password" id="loginInputPassword"/> 
            </div>
            <h1 id="response"></h1>
             


        </div>
 <button onclick="checkUser()">SUBMIIIT</button>        
        <script>

            const checkUser = () => {
                const http = new XMLHttpRequest();
                var enteredMail = document.getElementById("loginInputMail");
                var enteredPassword = document.getElementById("loginInputPassword");

                var mail = enteredMail.value;
                var password = enteredPassword.value;
               
                http.onreadystatechange = function () {
                    const validation = this.responseText;
                    if (this.readyState == 4 && this.status == 200) {
                        location.href="home";
                    } else {
                        document.getElementById("response").innerHTML = validation;
                    }
                }
                var data = 'email=' + mail + '&' + 'password=' + password;
                console.log(data);
                http.open("POST", "login",true);
                http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                http.send(data);
            }
        </script>
    </body>
</html>

