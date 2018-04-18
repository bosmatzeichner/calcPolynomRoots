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
    long double tolerance = 0.0;
    scanf("epsilon_=_ %Lf", &tolerance);
    //printf("%Lf", tolerance);
    return tolerance;
}
int createParamOrder() {
    int order = 0;
    scanf("\n order_=_%d", &order);
    return order;
}
complex_num *createParamCoefficients(int order) {
    complex_num *coefficients = calloc((size_t) (order + 1), sizeof(complex_num));
    int i = getCoeffIndex();
    while (order >= 0){
        coefficients[i] = createComplexNum();
        order--;
    }
    return coefficients;
}
int getCoeffIndex() {
    int index;
    scanf("\n coeff_%d", &index);
    return index;
}
complex_num createComplexNum() {
    complex_num cmplx;
    scanf("%Lf", &cmplx.real);
    scanf("%Lf", &cmplx.image);
    return cmplx;
}
complex_num createInitialVal() {
    complex_num initial_val;
    scanf("\n initial_=_%Lf %Lf", &initial_val.real, &initial_val.image);
    return initial_val;
}
void execute_print(complex_num root) {
    printf("root = %LG %LG", root.real, root.image);
}
