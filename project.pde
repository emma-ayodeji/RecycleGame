
//SoundFile file;
import ddf.minim.analysis.*;
import ddf.minim.*;
Minim       minim;
AudioPlayer jingle;
//audio code and file taken from lab 3





PImage bin, ric1, ric2, ric3, ric4, ric5, ric6, ric7, sky, cherub, cherub2;
int bin_x, bin_y, bin_count; //Store coordinates for bin
int ric1_x, ric1_y, ric1_count; //Store coordinates for ric1
int ric2_x, ric2_y, ric2_count; //Store coordinates for ric2
int ric3_x, ric3_y, ric3_count; //Store coordinates for ric3
int ric4_x, ric4_y, ric4_count; //Store coordinates for ric4
int ric5_x, ric5_y, ric5_count; //Store coordinates for ric5
int ric6_x, ric6_y, ric6_count; //Store coordinates for ric6
int ric7_x, ric7_y, ric7_count; //Store coordinates for ric7
int cherub_x, cherub_y, cherub_count; //Store coordinates for ric7
int cherub2_x, cherub2_y, cherub2_count; //Store coordinates for ric7

int x = 400;
int y = 500;

int x2 = 400;
int y2 = 700;

int x3 = 800;
int y3 = 500;

int x4 = 1000;
int y4 = 500;

int x5 = 500;
int y5 = 700;

int x6 = 700;
int y6 = 700;

int x7 = 900;
int y7 = 700;

int xcherub = 120;
int ycherub = -80;

int xcherub2 = 120;
int ycherub2 = 500;



boolean ric1_dragging = false;
boolean ric2_dragging = false;
boolean ric3_dragging = false;
boolean ric4_dragging = false;
boolean ric5_dragging = false;
boolean ric6_dragging = false;
boolean ric7_dragging = false;




boolean ric1_draw=true;
boolean ric2_draw=true;
boolean ric3_draw=true;
boolean ric4_draw=true;
boolean ric5_draw=true;
boolean ric6_draw=true;
boolean ric7_draw=true;

boolean holding = false;

int score =0; 

int timer = 60; //60 seconds
int t = timer-int(millis()/1000);

void setup() {

  size(1600, 1000, P2D); //Create window
  // Load a soundfile from the data folder of the sketch and play it back in a loop
  minim = new Minim(this);
  jingle = minim.loadFile("music.wav");   // load the music file into memory
  jingle.loop();

  sky= loadImage("sky.jpeg");
  size(1600, 1000);


  textFont(createFont("Cursive", 100));

  bin = loadImage("scene.png"); //Load bin into data structure
  bin.resize(180, 180); //Resize once
  bin_x = 150; //Positioning of bin
  bin_y = 220;

  ric1 = loadImage("ric1.png"); //Load ric1 into data structure
  ric1.resize(100, 130); //Resize once
  ric1_x = x; //Positioning of ric1
  ric1_y = y;
  ric1_count = 0;

  ric2 = loadImage("ric2.png"); //load ric2 into data structure
  ric2.resize(100, 130);
  ric2_x = x2;  //positioning of ric2
  ric2_y = y2;
  ric2_count = 0;

  ric3 = loadImage("ric3.png"); //load ric3 into data structure
  ric3.resize(100, 130);
  ric3_x = x3;  //positioning of ric3
  ric3_y = y3;
  ric3_count = 0;


  ric4 = loadImage("ric4.png"); //load ric4 into data structure
  ric4.resize(100, 130);
  ric4_x = x4;  //positioning of ric4
  ric4_y = y4;
  ric4_count = 0;



  ric5 = loadImage("ric5.png"); //load ric5 into data structure
  ric5.resize(100, 130);
  ric5_x = x5;  //positioning of ric5
  ric5_y = y5;
  ric5_count = 0;


  ric6 = loadImage("ric6.png"); //load ric6 into data structure
  ric6.resize(100, 130);
  ric6_x = x6;  //positioning of ric6
  ric6_y = y6;
  ric6_count = 0;

  ric7 = loadImage("ric7.png"); //load ric7 into data structure
  ric7.resize(100, 130);
  ric7_x = x7;  //positioning of ric7
  ric7_y = y7;
  ric7_count = 0;


  cherub = loadImage("cherub.png"); //load cherub into data structure
  cherub.resize(200, 230);
  cherub_x = xcherub;  //positioning of ric7
  cherub_y = ycherub;
  cherub_count = 0;

  cherub2 = loadImage("cherub2.png"); //load cherub2 into data structure
  cherub2.resize(200, 230);
  cherub2_x = xcherub2;
  cherub2_y = ycherub2;
  cherub2_count = 0;
 
}

void draw() {


  background(sky);
  imageMode(CENTER);
  text("Timer:" +t, 360, 60);
  if(t ==0)
  {
    text("Game over", width/2, height/2); 
  }
  else
  {
    t=timer -int(millis()/1000); //timer code taken from cs171 labs
  
  //Draw bin
  image(bin, bin_x + 900, bin_y - 50);
  image(bin, bin_x + 900, bin_y + 200);
  image(bin, bin_x + 900, bin_y + 450);
  
  fill(0, 0, 0);
  text("Score:"+score, 920, 20);


   image(cherub, cherub_x, cherub_y + 200);
  image(cherub2, cherub2_x, cherub2_y + 200);


  /*used these rectangles to locate the area above the entry of the bins 
  rect(980, 40, 140, 90);  for bin 1
  rect(980, 290, 140, 90); for bin2
  rect(980, 540, 140, 90); for bin 3
  */

 //got assistance from a demo in the CSC to formulate the logic for dragging
  //Draw ric1 without additional offset
  if (ric1_dragging) {
    ric1_x = mouseX;
    ric1_y = mouseY;
  }

    if ( (mouseX > 980) && (mouseX <1120) &&  (mouseY >40) &&   (mouseY < 130) && ric1_dragging) {
    if (ric1_dragging == true && ric1_draw==true)
    {
    score ++;
  
     ric1_dragging = false;
     holding = false;
    }
    ric1_draw=false; // for dragging to bin 1
    
    }

    if ( (mouseX > 980 ) && (mouseX <1120 ) &&  (mouseY >290  ) &&   (mouseY < 380) && ric1_dragging && ric1_draw) {
    ric1_draw=false; //for dragging to bin 2
 
    }
    if ( (mouseX > 980 ) && (mouseX <1120 ) &&  (mouseY >540  ) &&   (mouseY < 630) && ric1_dragging && ric1_draw) {
    ric1_draw=false; //for dragging to bin 3

    }

    // if( (ric1_x > 970 + 160/2) && (ric1_x <970 -160/2 ) &&  (ric1_y >210 + 20/2 ) &&   (ric1_y < 210 -20/2))
    if (ric1_draw)
    {
      image(ric1, ric1_x, ric1_y);
   
    }



  //dragging ric2
  if (ric2_dragging) {
    ric2_x = mouseX;
    ric2_y = mouseY;
    }

    if ( (mouseX > 980) && (mouseX <1120) &&  (mouseY >40) &&   (mouseY < 130) && ric2_dragging) {
    if (ric2_dragging == true && ric2_draw==true)
    {
      score ++;
    
      ric2_dragging = false;
      holding = false;
    }
    ric2_draw=false; // for dragging to bin 1
    }


    if ( (mouseX > 980 - 140/2) && (mouseX <980 +140/2 ) &&  (mouseY >290 - 80/2 ) &&   (mouseY < 290 +80/2) && ric2_dragging && ric2_draw) {
    ric2_draw=false;     //for dragging to bin 2

    }
    if ( (mouseX > 980 - 140/2) && (mouseX <980 +140/2 ) &&  (mouseY >540 - 80/2 ) &&   (mouseY < 540 +80/2) && ric2_dragging && ric2_draw) {
    ric2_draw=false; //for dragging to bin 3
 
    }
    // if( (ric1_x > 970 + 160/2) && (ric1_x <970 -160/2 ) &&  (ric1_y >210 + 20/2 ) &&   (ric1_y < 210 -20/2))
    if (ric2_draw)

    {
    image(ric2, ric2_x, ric2_y);
    }


    //dragging ric3
    if (ric3_dragging) {
    ric3_x = mouseX;
    ric3_y = mouseY;
    }

    if ( (mouseX > 980) && (mouseX <1120) &&  (mouseY >40) &&   (mouseY < 130) && ric3_dragging && ric3_draw) {
    ric3_draw=false; // for dragging to bin 1

    }

    if ( (mouseX > 980 ) && (mouseX <1120 ) &&  (mouseY >290  ) &&   (mouseY < 380) && ric3_dragging && ric3_draw) {
    ric3_draw=false; //for dragging to bin 2
    
    }
    if ( (mouseX > 980 ) && (mouseX <1120 ) &&  (mouseY >540  ) &&   (mouseY < 630) && ric3_dragging) {
    if (ric3_dragging == true && ric3_draw==true)
    {
      score ++;
   
      ric3_dragging = false;
      holding = false;
    }
    ric3_draw=false; //for dragging to bin 3
    }


    if (ric3_draw)
    {
    image(ric3, ric3_x, ric3_y);
    }



    //dragging ric4
    if (ric4_dragging) {
    ric4_x = mouseX;
    ric4_y = mouseY;
    }

    if ( (mouseX > 980) && (mouseX <1120) &&  (mouseY >40) &&   (mouseY < 130) && ric4_dragging && ric4_draw) {
    ric4_draw=false; // for dragging to bin 1
   
    }

    if ( (mouseX > 980 ) && (mouseX <1120 ) &&  (mouseY >290  ) &&   (mouseY < 380) && ric4_dragging && ric4_draw) {
    ric4_draw=false; //for dragging to bin 2

    }
    if ( (mouseX > 980 ) && (mouseX <1120 ) &&  (mouseY >540  ) &&   (mouseY < 630) && ric4_dragging) {
    if (ric4_dragging == true && ric4_draw==true)
    {
      score ++;
      
      ric4_dragging = false;
      holding = false;
      
    }
    ric4_draw=false; //for dragging to bin 3
    }
    if (ric4_draw)
    {
    image(ric4, ric4_x, ric4_y);
    }




    //dragging ric5
    if (ric5_dragging) {
      ric5_x = mouseX;
      ric5_y = mouseY;
     }

    if ((mouseX > 980) && (mouseX <1120) &&  (mouseY >40) &&   (mouseY < 130) && ric5_dragging && ric5_draw) {
    ric5_draw=false; // for dragging to bin 1
    
    }

    if ((mouseX > 980 ) && (mouseX <1120 ) &&  (mouseY >290  ) &&   (mouseY < 380) && ric5_dragging && ric5_draw) {
    ric5_draw=false; //for dragging to bin 2
    
    }
    if ( (mouseX > 980 ) && (mouseX <1120 ) &&  (mouseY >540  ) &&   (mouseY < 630) && ric5_dragging) {
    if (ric5_dragging == true && ric5_draw==true)
    {
      score ++;
    
      ric5_dragging = false;
      holding = false;
    }
    ric5_draw=false; //for dragging to bin 3
    }


    if (ric5_draw)
    {
    image(ric5, ric5_x, ric5_y);
    }



    //dragging ric6
    if (ric6_dragging) {
    ric6_x = mouseX;
    ric6_y = mouseY;
    }

    if ( (mouseX > 980) && (mouseX <1120) &&  (mouseY >40) &&   (mouseY < 130) && ric6_dragging && ric6_draw) {
    ric6_draw=false; // for dragging to bin 1

    }

    if ( (mouseX > 980 ) && (mouseX <1120 ) &&  (mouseY >290  ) &&   (mouseY < 380) && ric6_dragging && ric6_draw) {
    ric6_draw=false; //for dragging to bin 2

    }
    if ( (mouseX > 980 ) && (mouseX <1120 ) &&  (mouseY >540  ) &&   (mouseY < 630) && ric6_dragging) {
      if (ric6_dragging == true && ric6_draw==true)
    {
      score ++;
     
      ric6_dragging = false;
      holding = false;
    }
    ric6_draw=false; //for dragging to bin 3
    }


    if (ric6_draw)
    {
    image(ric6, ric6_x, ric6_y);
    }
  




  //dragging ric7
  if (ric7_dragging) {
    ric7_x = mouseX;
    ric7_y = mouseY;
  }

  if ( (mouseX > 980) && (mouseX <1120) &&  (mouseY >40) &&   (mouseY < 130) && ric7_dragging && ric7_draw) {
    ric7_draw=false; // for dragging to bin 1
   
  }

  if ( (mouseX > 980 ) && (mouseX <1120 ) &&  (mouseY >290  ) &&   (mouseY < 380) && ric7_dragging) {
    if (ric7_dragging == true && ric7_draw==true)
      score ++;

      ric7_dragging = false;
      holding = false;
    }
    ric7_draw=false; //for dragging to bin 2
  }


  if ( (mouseX > 980 ) && (mouseX <1120 ) &&  (mouseY >540  ) &&   (mouseY < 630) && ric7_dragging && ric7_draw) {
    ric7_draw=false; //for dragging to bin 3

  }


  if (ric7_draw)
  {
    image(ric7, ric7_x, ric7_y);
  }













if(score >4)
{ rect(0, 0, 1600, 1000);
fill(255);
  text("You've won! Score: " + score + "/7", 520, 400);

}

  textSize(22);
  fill(0, 0, 0);
  text("Recycle at Home", 1170, 130); //Specify a z-axis value //no need
  text("Not Recyclable", 1200, 400); //Default depth, no z-value specified
  text("Recycle at Specialist Points", 1150, 650); //Default depth, no z-value specified
  //used ChatGPT for something to do with the coordinates for this
}







void mousePressed() {
  //Check if the mouse is over ric1
  if (mouseX > ric1_x - 50 && mouseX < ric1_x + 50 && mouseY > ric1_y - 65 && mouseY < ric1_y + 65 && holding == false) {
    ric1_dragging = true;
    holding = true;
  }
  //Check if the mouse is over ric2
  if (mouseX > ric2_x - 50 && mouseX < ric2_x + 50 && mouseY > ric2_y - 65 && mouseY < ric2_y + 65) {
    ric2_dragging = true;
  }
  //Check if the mouse is over ric3
  if (mouseX > ric3_x - 50 && mouseX < ric3_x + 50 && mouseY > ric3_y - 65 && mouseY < ric3_y + 65) {
    ric3_dragging = true;
  }
  //Check if the mouse is over ric4
  if (mouseX > ric4_x - 50 && mouseX < ric4_x + 50 && mouseY > ric4_y - 65 && mouseY < ric4_y + 65) {
    ric4_dragging = true;
  }
  //Check if the mouse is over ric5
  if (mouseX > ric5_x - 50 && mouseX < ric5_x + 50 && mouseY > ric5_y - 65 && mouseY < ric5_y + 65) {
    ric5_dragging = true;
  }
  //Check if the mouse is over ric6
  if (mouseX > ric6_x - 50 && mouseX < ric6_x + 50 && mouseY > ric6_y - 65 && mouseY < ric6_y + 65) {
    ric6_dragging = true;
  }
  //Check if the mouse is over ric7
  if (mouseX > ric7_x - 50 && mouseX < ric7_x + 50 && mouseY > ric7_y - 65 && mouseY < ric7_y + 65) {
    ric7_dragging = true;
    
 
  }
  
}
