#include <stdio.h>
#include <stdlib.h>
#include "computingRootsCalc.h"

int main() {
    struct input* parameters = getInput();
    complex_num root = calcRoot(parameters->initial_val,parameters->poly,parameters->tolerance);
    execute_print(root);
    free_input(parameters);
}
void free_input(struct input *parameters) {
    free(parameters->poly->coefficients);
    free(parameters->poly);
    free(parameters);
}
struct input *getInput() {
    struct input *parameters = calloc(1, sizeof(struct input));
    parameters->poly = calloc(1,sizeof(struct polynom));
    struct polynom *poly = parameters->poly;
    parameters->tolerance = createParamTolerance();
    poly->order = createParamOrder();
    poly->coefficients = createParamCoefficients(poly->order);
    parameters->initial_val = createInitialVal();
    return parameters;
}
long double createParamTolerance() {
    long double tolerance = 0.0 ;
    scanf("\nepsilon = %Lf\0", &tolerance);
    //printf("%Lf", tolerance);
    return tolerance;
}
int createParamOrder() {
    int order = 0;
    scanf("\norder = %d\0", &order);
    return order;
}
complex_num *createParamCoefficients(int order) {
    complex_num *coefficients = calloc((size_t) (order + 1), sizeof(complex_num));
    initCoeff(coefficients, order);
    return coefficients;
}
void initCoeff(complex_num* coeffs, int order) {
    int index;
    complex_num cmplx;
    while (order >= 0){
         scanf("\ncoeff %d = %Lf %Lf\0", &index, &cmplx.real, &cmplx.image);
         coeffs[index] = cmplx;
         order--;
    }
}
complex_num createInitialVal() {
    complex_num initial_val = {0.0 , 0.0};
    scanf("\ninitial = %Lf %Lf\0", &initial_val.real, &initial_val.image);
    return initial_val;
}
void execute_print(complex_num root) {
    printf("root = %.16Lf %.16Lf", root.real, root.image);
}
