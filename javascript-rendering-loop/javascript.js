/* Javascript canvas rendering template
 * has a basic game loop
 *
 *
*/

//  Global variables used by the renderer
var canvas = document.getElementById("myCanvas");
var ctx = canvas.getContext("2d");
var width = canvas.width;
var height = canvas.height;
var MyState = {       //  global object that has the requestAnimationFrame
  stopMain : ""
}
var tFrame            // time since started
var tNow = window.performance.now();
var FPScounter = 0
var FPSOutput = 0


// Main rendering loop
;(function () {
  function main( tFrame ) {
    MyState.stopMain = window.requestAnimationFrame( main );
    ctx.clearRect(0,0,width,height);
    // Your main loop contents
    // tFrame, from "function main ( tFrame )", is now a DOMHighResTimeStamp provided by rAF.
    render(tFrame)
  }

  main(); // Start the cycle
})();

// all rendering goes here
function render(tFrame) {
  printFPS(tFrame)
}

// simple text function
function write(text, width, height) {
    ctx.font = "30px Arial";
    ctx.fillText(text, width, height);  
}

// prints the fps in the corner
function printFPS(timeSinceStarted){
  FPScounter++;
  if (timeSinceStarted - tNow > 1000) {
    tNow = timeSinceStarted
    FPSOutput = FPScounter
    FPScounter = 0
  }
  ctx.font = "10px Arial";
  let textOutput = "FPS: " + FPSOutput
  ctx.fillText(textOutput, 0, 10);  
}

// code for the button to stop the animation
function btnStop() {
  window.cancelAnimationFrame( MyState.stopMain );
  write("stopped", width/2, height/2)
}
