//
// Created by USER on 17/04/2018.
//
#include <stdlib.h>
#include "computingRootsCalc.h"

complex_num calcRoot(complex_num currentRoot, struct polynom *poly, long double tolerance) {
    poly->coeffsForDeriv = prepare_deriv_coeffs(poly->coefficients,poly->order);
    while(sqrtNorm_bigger_then_tolerance(currentRoot, tolerance)){
        currentRoot = eval_next_seq_element(currentRoot, poly);
    }
    free(poly->coeffsForDeriv);
    return currentRoot;
}
complex_num eval_next_seq_element(complex_num root, struct polynom *poly) {
    complex_num valueAtPoint = eval_poly(root,poly->coefficients,poly->order);
    complex_num derivAtPoint = eval_poly(root,poly->coeffsForDeriv,poly->order-1);
    complex_num nextElement = eval_element(root,valueAtPoint,derivAtPoint);
    return nextElement;
}
int sqrtNorm_bigger_then_tolerance(complex_num root, long double tolerance) {
    long double sqrtNorm = eval_euclidean_sqrt_norm (root);
    return ( sqrtNorm >= tolerance);
}
long double eval_euclidean_sqrt_norm(complex_num root) {
    return root.real*root.real + root.image*root.image;
}

complex_num cmplx_add(complex_num first, complex_num second){
    complex_num res;
    res.real = first.real + second.real;
    res.image = first.image + second.image;
    return res;
}
complex_num cmplx_sub(complex_num first, complex_num second){
    complex_num res;
    res.real = first.real - second.real;
    res.image = first.image - second.image;
    return res;
}
complex_num cmplx_mul(complex_num first, complex_num second){
    complex_num res;
    res.real = first.real*second.real - first.image*second.image;
    res.image = first.real*second.image+ second.real*first.image;
    return res;
}
complex_num cmplx_div(complex_num first, complex_num second){
    complex_num res;
    long double divisor = (second.real*second.real + second.image*second.image);
    res.real = (first.real*second.real - first.image*second.image)/divisor;
    res.image = (first.image*second.real - first.real*second.image)/divisor;
    return res;
}
complex_num cmplx_mul_add(complex_num res, complex_num x, complex_num coeff) {
    complex_num result = cmplx_mul(res, x);
    result = cmplx_add(result,coeff);
    return result;
}
complex_num eval_element(complex_num nthZ, complex_num polyAtPointZ, complex_num derivAtPointZ){
    complex_num divPolyByDeriv = cmplx_div(polyAtPointZ, derivAtPointZ);
    complex_num nextElemnt = cmplx_sub(nthZ, divPolyByDeriv);
    return nextElemnt;
}
complex_num eval_poly(complex_num x, complex_num *coeffs, int order){
    complex_num res;
    res.real = 0.0;
    res.image = 0.0;
    for (int i = order; i >= 0 ; i--){
        res = cmplx_mul_add(res, x, coefs[i]);
    }
}
complex_num *prepare_deriv_coeffs(complex_num *coeffs , int order){
    complex_num *coefsPrepared = calloc((size_t) order+1, sizeof(complex_num));
    for (int i = order; i>0; i-- ){
        coefsPrepared[i].real = coefs[i].real * i;
        coefsPrepared[i].image = coefs[i].image;
    }
    return  coefsPrepared;
}
