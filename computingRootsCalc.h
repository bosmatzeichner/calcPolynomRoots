//
// Created by USER on 17/04/2018.
//

#ifndef COMPUTINGROOTSCALC_COMPUTINGROOTSCALC_H
#define COMPUTINGROOTSCALC_COMPUTINGROOTSCALC_H
typedef struct {
    long double real;
    long double image;
}complex_num;

struct polynom{
    int order;
    complex_num *coefficients;
};
struct input{
    long double tolerance;
    complex_num initial_val;
    struct polynom *poly;
};
//Main-----------------------
int main();
void execute_print(complex_num root);
void free_input(struct input *parameters);

struct input *getInput() ;
long double createParamTolerance() ;
int createParamOrder() ;
complex_num *createParamCoefficients(int order) ;
int getCoeffIndex();
complex_num createComplexNum() ;
complex_num createInitialVal();


//Calc----------------------
complex_num calcRoot(complex_num currentRoot, struct polynom *poly, long double tolerance) ;
long double eval_euclidean_sqrt_norm(complex_num root);
complex_num cmplx_add(complex_num first, complex_num second);
complex_num cmplx_sub(complex_num first, complex_num second);
complex_num cmplx_mul(complex_num first, complex_num second);
complex_num cmplx_div(complex_num first, complex_num second);
complex_num cmplx_mul_add(complex_num res, complex_num x, complex_num coeff);
complex_num eval_next_seq_element(complex_num root, struct polynom *poly);
complex_num eval_element(complex_num nthZ, complex_num polyAtPointZ, complex_num derivAtPointZ);
complex_num eval_poly(complex_num x, complex_num *coefs, int order);
complex_num eval_deriv(complex_num x, complex_num *coefs, int order);
complex_num *prepare_deriv_coefs(complex_num *coefs , int order);
complex_num eval_deriv_coefsPrepared(complex_num x, complex_num *coefsPrepared, int order);

#endif //COMPUTINGROOTSCALC_COMPUTINGROOTSCALC_H
