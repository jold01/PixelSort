
PImage img;
int[][] pCoords;

final int COLORCOMPLIGHT = 180;
final int COLORCOMPDARK = 125;

void setup(){
  size(1600,900);
  
  img = loadImage("outside.jpg");
  img.resize(1600, 0);
  
  loadPixels();
 
  pCoords = new int[img.height][img.width];
  int counter = pixels.length;
  

  for(int i=img.height-200; i>0; i--){
    
    for(int j=img.width-50; j>0; j--){
      color c = img.pixels[i*img.width-j];
      
      float rmod = red(c);
      float gmod = green(c);
      float bmod = blue(c);
      
      float rand = random(1,2);
      
      float mtotal = (rmod+gmod-bmod)*rand*.5;
      
      if(rmod > COLORCOMPDARK && gmod > COLORCOMPDARK && bmod > COLORCOMPDARK && rmod < COLORCOMPLIGHT && gmod < COLORCOMPLIGHT && bmod < COLORCOMPLIGHT){
        for(int k=0; k<mtotal; k++){
           int sum = i+k;
           
           float r = red(c);
           float g = green(c);
           float b = blue(c);
           
          if(sum >= img.height){
            
            break;
          }
          else if(r < 80){
            
          }
          else{
            if(k <= mtotal/2){
              img.pixels[sum*img.width-j] = c;
            }
            else{
               if(r > g && r > b){
                 c = color(r-1.25, g-2, b-2);
                 img.pixels[sum*img.width-j] = c;
                 
               }
               else if(g > r && g > b){
                 c = color(r-1.25, g-2, b-2);
                 img.pixels[sum*img.width-j] = c;
                 
               }
               else if(b > r && b > g){
                 c = color(r-1.25, g-2, b-2);
                 img.pixels[sum*img.width-j] = c;
                 
               }
               else{
                 c = color(r-1.25, g-2, b-2);
                 img.pixels[sum*img.width-j] = c;
               }
            }
          }
        }
      }
    }
    //counter= counter-img.width;
    
  }
  
 

  
  
  updatePixels();
  
}

void draw() {
  background(0);
  // Draw the image to the screen at coordinate (0,0)
  image(img,0,0);
  
  //img.save("supAfter/sup.png");
}
