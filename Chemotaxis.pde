  Bacteria [] colony;
 Food energy;
 Food toxin;
 void setup()   
 {     
 	size(600,600);
 	colony = new Bacteria[200];
    for(int i =0; i < colony.length ; i ++)
    {
    	colony[i] = new Bacteria();
    }
 	energy = new Food();
 	toxin  = new Food();
 }   
 void draw()   
 {    
 	background(0); 
    for(int i = 0;i < colony.length; i++)
    {
    	colony[i].move();
    	colony[i].show();
    }
    energy.show();
    toxin.show();

 }  
 class Bacteria    
 {     
 	//lots of java!  
 	int bacteriaX, bacteriaY, bacteriaR, bacteriaG, bacteriaB;
 	Bacteria()
 	{
 		bacteriaX = (int)(Math.random()*500) + 50;
 		bacteriaY = (int)(Math.random()*500) + 50;
 		bacteriaR = (int)(Math.random()*150) + 50;
 		bacteriaG = (int)(Math.random()*150) + 50;
 		bacteriaB = (int)(Math.random()*150) + 50;
 	} 
 	void move()
 	{

 	  bacteriaX = bacteriaX + (int)(Math.random()*9) - 4;
      bacteriaY = bacteriaY + (int)(Math.random()*9) - 4;

      if(energy.foodX > bacteriaX && dist(energy.foodX,energy.foodY,bacteriaX,bacteriaY) < 100)//food
      {
       bacteriaX = bacteriaX + (int)(Math.random()*5);
      }
      else
      {
       bacteriaX = bacteriaX - (int)(Math.random()*5);
      }
      if(energy.foodY > bacteriaY && dist(energy.foodX,energy.foodY,bacteriaX,bacteriaY) < 100)
      {
     	bacteriaY = bacteriaY + (int)(Math.random()*5);
      }
      else 
      {
     	bacteriaY = bacteriaY - (int)(Math.random()*5);
      }
      if(toxin.poisonX > bacteriaX && dist(toxin.poisonX,toxin.poisonY,bacteriaX,bacteriaY) < 100)// poison
      {
      bacteriaX = bacteriaX - (int)(Math.random()*5);
      }
      else
      {
       bacteriaX = bacteriaX + (int)(Math.random()*5);
      }
      if(toxin.poisonY > bacteriaY && dist(toxin.poisonX,toxin.poisonY,bacteriaX,bacteriaY) < 100)
      {
     	bacteriaY = bacteriaY - (int)(Math.random()*5);
      }
      else 
      {
     	bacteriaY = bacteriaY + (int)(Math.random()*5);
      }
    
 	}
 	void show()
 	{
     strokeWeight(2);
     stroke(bacteriaR,bacteriaG,bacteriaB);
     noFill();
     ellipse(bacteriaX,bacteriaY,12,12);
 	}
 } 
 class Food
 {
 	int foodX, foodY, poisonX, poisonY;
     Food()
     {
   	   foodX = -20;
   	   foodY = -20;
   	   poisonX = -20;
   	   poisonY = -20;
     }
     void show()
     {
     	if(mousePressed && mouseButton == LEFT)
 	   {
 		foodX = mouseX;
 		foodY = mouseY;

 	   }
     	fill(255,255,255);
     	ellipse(foodX,foodY,20,20);
       if(mousePressed && mouseButton == RIGHT)
       {
        poisonX = mouseX;
        poisonY = mouseY;

       }
     	fill(250,10,10);
     	ellipse(poisonX,poisonY,20,20);	
     }
 } 
