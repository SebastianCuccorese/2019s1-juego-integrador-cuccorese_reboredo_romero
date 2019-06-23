import wollok.game.*

object gameover {
	method position()= game.at(5,5)
	method image()= "gameOver.png"
	method teEncontro(persona){}
	
}


object restart{
	method position()= game.at(2,3)
	method image() = "reset.png"
	method teEncontro(persona){}
}

object youWin{
	method position()=game.at(3,5)
	method image()= "youwin.png"
	method teEncontro(persona){}
}