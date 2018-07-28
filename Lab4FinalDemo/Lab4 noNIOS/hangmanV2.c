/*
 * hangMan.c
 */

#include  altera_avalon_pio_regs.h

#define TRUE 1
#define FALSE 0

#define  (char *)			leds				0x00021050
//#define  (volatile char *)	switches
#define  charReceived	(volatile int *)	0x00021040
#define  charSent		(volatile int *)	0x00021010
#define  transmitEnable	(volatile int *)	0x00021030
#define  dataReceived	(volatile char *)	0x00021000
#define	 dataToSend		(volatile char *)	0x00021020

void main(){
	//IOWR_ALTERA_AVALON_PIO_DATA(targetAddress, aValue);
	//aValue = IOWR_ALTERA_AVALON_PIO_DATA(sourceAddress);
	alt_printf("Welcome to hangman!");
	alt_printf("switch 0 is host, 9 is player.");
	while (*switches == 0) {
		//stay here if didn't pick a game mode
	}

	if (*switches % 2 == 0) { //host mode
		alt_printf("Press G to enter 4 letter word.");
		while (1){
			char start = alt_getchar();
			if (start == 71){
				getAnswer();
				sendAnswer();
			}
		}
	  } else { 				  // player mode
		alt_printf("Press G to start guess.");
		while (1){
			char start = alt_getchar();
			if (start == 71){
				playGame();
			}
		}
	 }
}

void playGame(){
	//receive the first 4 char as the answer;
	char answer[4];
	int anserIndex = 0;
	while (anserIndex < 4){
		if (*charReceived){
			answer[anserIndex] = *dataReceived;
			anserIndex++;
		}
	}

	char guess[4];
	char match[4] = {'_','_','_','_'};
	int wrongGuessCount = 0;
	int matchCount = 0;
	int gameReset = 0;
	alt_printf(" Game start! ");
	//alt_printf(" _ _ _ _ ");
	//alt_printf(""); //hangman figure



	char* hangmanFigure[];
	//hangmanFigure[0] = "      _______      /n|/      |     /n
		     	 	 	 	 
		     	 	 	 	 

	alt_printf("      _______      /n");
	alt_printf("     |/      |     /n");
	alt_printf("     |      (_)    /n");
	alt_printf("     |      \|/    /n");
	alt_printf("     |       |     /n");
	alt_printf("     |      / \\   /n");
	alt_printf("     |             /n");
	alt_printf("	_|___          /n");

	while(!gameReset){
		if (*charReceived){
			char charIn = *dataReceived;
			int matched = 0;
			for (int i = 0; i < 4; i++){
				if(charIn == answer[i]){
					match[i] = charIn;
					matched = 1;
					matchCount++;
				}
			}
			if (matchCount == 4){
				  alt_printf("You win!");
			      gameReset = 1;

			}
			if (!matched){
				wrongGuessCount++;
			    if (wrongGuessCount < 5){
			    //update hangman/LED

			    } else {
			    	//endgame
			      alt_printf("You lose!");
			      gameReset = 1;

			    }

			}

		}
	}

	alt_printf("Press G to play again!");
}

void getAnswer(){
	
}

void sendAnswer(){
	alt_printf("Please enter a 4 letter word");
	char myAnswer[4];
	myAnswer[0] = alt_getchar();
	myAnswer[1] = alt_getchar();
	myAnswer[2] = alt_getchar();
	myAnswer[3] = alt_getchar();

	int anserIndex = 0;

	while (anserIndex < 4){
		*dataToSend = myAnswer[anserIndex];
		while(!(*charSent)){
			*transmitEnable = 1;
		}
		*transmitEnable = 0;
		anserIndex++;
	}
}










