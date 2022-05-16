<html class=""><link type="text/css" id="dark-mode" rel="stylesheet" href=""><style type="text/css" id="dark-mode-custom-style"></style><style type="text/css" id="dark-mode-theme-changer-style"></style><head><script type="text/javascript" src="/static/js/hello.js"></script>
<link rel="shortcut icon" type="image/png" href="/static/images/favicon.ico">

    <script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
    <style>

    * {
      margin: 0;
      padding: 0;
    }

    html {
      font-family: 'Lato', Arial, Helvetica, sans-serif;
      font-size: 10px;
      font-weight: 400;
    }

    body {
      min-height: 100vh;
      min-width: 100vw;
      background-image: -webkit-linear-gradient(45deg, #00acee 0%, #00acee 100%);
      background-image: -moz-linear-gradient(45deg, #00acee 0%, #00acee 100%);
      background-image: linear-gradient(45deg, #00acee 0%, #00acee 100%);
      display: flex;
      justify-content: center;
      align-items: center;
    }

    #signup-box {
      background-color: #fff;
      border-radius: 30px;
      -webkit-box-shadow: 0px 0px 76px 0px rgba(0, 0, 0, 0.20);
      -moz-box-shadow: 0px 0px 76px 0px rgba(0, 0, 0, 0.20);
      box-shadow: 0px 0px 76px 0px rgba(0, 0, 0, 0.20);
      text-align: center;
      height: 100%;
      max-width: 422px;
      width: 45%;
    }

    #signup-box h1 {
      color: #00acee;
      font-size: 1.8rem;
      font-weight: 700;
      margin-top: 40px;
    }

    #signup-box p {
      color: #222;
      font-size: 1.6rem;
      margin: 5px 0 30px 0;
      padding: 0 15%;
    }

    #signup-form {
      width: 70%;
      margin: auto;
      text-align: left;
      font-size: 14px;
    }

    #signup-form label {
      color: #222;
      font-weight: 700;
      padding-left: 10px;
    }

    #signup-form input {
      height: 35px;
      width: calc(100% - 10px);
      border: 1px solid #b4b4b4;
      border-radius: 5px;
      margin: 6px 0 20px 0;
      padding-left: 10px;
      outline: none;
    }

    #signup-form input::placeholder {
      color: #b4b4b4;
    }

    #signup-form button {
      background-image: -webkit-linear-gradient(-45deg, #00acee 0%, #00acee 100%);
      background-image: -moz-linear-gradient(-45deg, #00acee 0%, #00acee 100%);
      background-image: linear-gradient(-45deg, #00acee 0%, #00acee 100%);
      border: none;
      border-radius: 30px;
      color: #fff;
      cursor: pointer;
      outline: none;
      height: 45px;
      width: 100px;
      display: block;
      margin: auto;
      margin-bottom: 40px;
      text-transform: uppercase;
      font-size: 1.6rem;
      font-weight: 900;
    }

    #signup-form button:hover {
      background-image: -webkit-linear-gradient(45deg, #00acee 0%, #00acee 100%);
      background-image: -moz-linear-gradient(45deg, #00acee 0%, #00acee 100%);
      background-image: linear-gradient(45deg, #00acee 0%, #00acee 100%);
      -webkit-box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.3);
      -moz-box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.3);
      box-shadow: 0px 0px 20px 0px rgba(0, 0, 0, 0.3);
    }

    @media screen and (max-width: 800px) {
      #signup-box {
        width: 70%;
      }
    }

    @media screen and (max-width: 600px) {
      #signup-box {
        max-width: none;
        width: 100%;
        border-radius: unset;
        box-shadow: none;
      }
    }
    </style>
    <script src="https://code.jquery.com/jquery-3.5.0.min.js" integrity="sha256-xNzN2a4ltkB44Mc/Jz3pT4iU1cmeR0FkXs4pru/JxaQ=" crossorigin="anonymous"></script>
</head>
<body>
 <section id="signup-box">
  <h1>congratulations!!</h1>
  <br>
  <p style="color:#FF0000">--Your Account Created--<p>
  <p><i>Welcome to social network of coders by Mission Helix</i></p>
  <br>
  <p>The Social Network of Coders by  Mission Helix <br><b>Aim</b> To Connect All Coders in India <br>one of fastest growing Community of Coders<br> CodingClub India</p>
  <p style="text-align:right;"><b>Founder:-<i>@Rishabh Jain<br>#CodingClub<i></b></p>
     <form id="signup-form" method="get" action="/login/welcome">
       <button type="submit">Continue</button>
     </form>
</section>

<script>

<button onclick="window.location.href='/login/welcome'">Continue</button>
        </script>



        </body></html>