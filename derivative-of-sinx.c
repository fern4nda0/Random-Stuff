#include <stdio.h>
#include <math.h>

// delta_x is a very small value 
#define delta_x 0.00000000000000000000000000000000000000000000000000000000000000000001

double find_derivative_sin(double x) {  
/*
 * lets say y = sin(x) we need to prove  dy/dx = cos(x)
 *  From the first principles  y + delta_y  = sin(x + delta_x)
 *  delta_y =  sin(x +delta_x) - y
 *  but y = sin(x) therefore
 *  delta_y = sin(x+delta_x) -sin(x)
 *  we got the formula = 2cos(C+D/2)sin(C-D/2)
 *  delta_y = 2cos((2x+ delta_x)/2)sin(delta_x/2)
 *  we divide both sides by delta_x  so that 
 *  delta_y/delta_x = (cos(((2*x)+delta_x)/2)/delta_x) -(sin(delta_x/2)/(delta_x/2))
 *    Theory: sin(∅)/∅ =1
 *  lim delta_x --> 0   
 *  delta_y/delta_x = cos(2x/2) 
    therefore dy/dx = cos(x)
 */

  double derivative = (cos(((2*x)+delta_x)/2)/delta_x) -(sin(delta_x/2)/(delta_x/2));
    return derivative;
}

int main() {
    // Test the function at x = 1.0
    double x;
  printf("Enter the value of x:");
scanf("%lf", &x);
    printf("Dy/Dx of sin(x) at x = %.2f is %.2f\n", x, find_derivative_sin(x));
    double s =  find_derivative_sin(x)* delta_x;
    printf("Dy/Dx of sin(x) at x = %.2f is %.2f\n", x, s);
    printf("Value of cos(x) at x = %.2f is %.2f\n", x, cos(x));
if(s == cos(x)){
printf("Proof correct\n");  
}

    return 0;
}

