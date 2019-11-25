<!DOCTYPE>
<html>
<head>
    <meta charset ="utf-8">
        <title>Weterynajnia</title>
    <link rel="stylesheet" href="stylowanie.css">
    </head>
<body>
    
    <header class="baner">
        <h1>Weterynarz</h1>
    </header>
    
    <div class="lewy">
        <ul>
            <li>Strona główna</li>
            <li>Nagłówek</li>
            <li>Informacje</li>
            <li>Dane usługi</li>
        </ul>
    </div>
    
    <div class="srodek">
        <img src="kot.jpg" height="400px" width="500px">
        <img src="pies.jpg" height="400px" width="600px">
        <img>
    </div>
    
    <div class="prawy">
        <form>
            Imie :
            <input type="text" name="imie"><br/>
            Nazwisko :
            <input type="text" name="nazwisko"><br/>
            E-mail :
            <input type="text" name="e-mail"><br/>
        </form>
    </div>
    
    <footer class="stopka">
        &copy;Weterynarz 2019
    </footer>
    
    <?PHP
    
    $con=mysqli_connect("localhost","root","","weterynarz");
    
    if(mysqli_connect())
        {
            echo "Failed to connect to MySQl"
        }

?>
    
    </body>
</html>





