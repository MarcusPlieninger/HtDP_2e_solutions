;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_7) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Exercise 7. Boolean expressions can express some everyday problems.
;Suppose you want to decide whether today is an appropriate day to go to the mall.
;You go to the mall either if it is not sunny or if today is Friday (because that is when stores post new sales items).

;Here is how you could go about it using your new knowledge about Booleans.
;First add these two lines to the definitions area of DrRacket:
;(define sunny #true)
;(define friday #false)
;Now create an expression that computes whether sunny is false or friday is true.
;So in this particular case, the answer is #false. (Why?)
;See exercise 1 for how to create expressions in DrRacket.
;How many combinations of Booleans can you associate with sunny and friday?

(define sunny #true)
;Sunny is a constant to which is assigned the Boolean value of true.

(define friday #false)
;friday is a constant to which is assigned the Boolean value of false.


(or (not sunny) friday)
;In this particular case, the answer is #false because not sunny evalutes to false and friday evaluates to false.
;A disjunction where both values are false evaluates to false.

;The logical form of this expression is the negation of one premise in a disjunction.

;The reason for the negation is that whatever the boolean value of sunny is, its negation will determine the action.
;So, if sunny is true, then it so false that there will be a trip to the mall--unless of course it is Friday.

;4 combinations of Booleans can be assocaited with sunny and friday:
;sunny false, friday true
;sunny false, friday false
;sunny true, friday true
;sunny true, friday false









