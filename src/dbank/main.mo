import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  // persistent and stable variable
  stable var currentValue: Float = 300;
  // currentValue := 300;

  stable var startTime = Time.now();
  startTime:= Time.now();

  Debug.print(debug_show(startTime));


  public func topUp(amount: Float) {
    currentValue +=amount;
    Debug.print(debug_show(currentValue));
  };

  public func withDraw(amount: Float){
    let temp : Float =currentValue-amount;
    if(temp>=0){
      currentValue-=amount;
      Debug.print(debug_show(currentValue));
    }
    else{
      Debug.print("Amount exceeds currentValue");
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  };

  public func compound() {
    let currentTime= Time.now();
    let timeElapsedns = currentTime-startTime;
    let timeElapsed = timeElapsedns/1000000000;

    currentValue := currentValue * (0.05 ** Float.fromInt(timeElapsed));
    startTime := currentTime;

  }
  

}