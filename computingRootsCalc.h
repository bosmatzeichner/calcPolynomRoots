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
    complex_num *coeffsForDeriv;
    };
struct input{
    long double tolerance;
    complex_num initial_val;
    struct polynom *poly;
};











//Main-----------------------
extern int main();
extern void execute_print(complex_num root);

extern void free_input(struct input *parameters);
extern struct input *getInput() ;

extern long double createParamTolerance() ;
extern int createParamOrder() ;
extern complex_num *createParamCoefficients(int order) ;
extern void initCoeff(complex_num* coeffs, int order);
extern complex_num createInitialVal();
//Calc----------------------
extern complex_num cmplx_add(complex_num first, complex_num second);
extern complex_num cmplx_sub(complex_num first, complex_num second);
extern complex_num cmplx_mul(complex_num first, complex_num second);
extern complex_num cmplx_div(complex_num first, complex_num second);

extern long double eval_euclidean_sqrt_norm(complex_num root);
extern complex_num calcRoot(complex_num currentRoot, struct polynom *poly, long double tolerance) ;
extern complex_num cmplx_mul_add(complex_num res, complex_num x, complex_num coeff);
extern complex_num eval_next_seq_element(complex_num root, struct polynom *poly);
extern complex_num eval_element(complex_num nthZ, complex_num polyAtPointZ, complex_num derivAtPointZ);
extern complex_num eval_poly(complex_num x, complex_num *coeffs, int order);
extern complex_num *prepare_deriv_coeffs(complex_num *coeffs , int order);
extern int sqrtNorm_bigger_then_tolerance(complex_num root, long double tolerance);

#endif //COMPUTINGROOTSCALC_COMPUTINGROOTSCALC_H
