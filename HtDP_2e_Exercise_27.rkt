;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_27) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Exercise 27. Our solution to the sample problem contains several constants in the middle of functions.
;As One Program, Many Definitions already points out, it is best to give names to such constants so that
;future readers understand where these numbers come from. Collect all definitions in DrRacket’s definitions area
;and change them so that all magic numbers are refactored into constant definitions. 

;(define (attendees ticket-price)
;  (- 120 (* (- ticket-price 5.0) (/ 15 0.1))))
;
;(define (revenue ticket-price)
;  (* ticket-price (attendees ticket-price)))
;
;(define (cost ticket-price)
;  (+ 180 (* 0.04 (attendees ticket-price))))
;
;(define (profit ticket-price)
;  (- (revenue ticket-price)
;     (cost ticket-price)))

(define standardticketprice 5.0)
(define averageattendance 120)
(define changeinticketprice .10)
(define changeinaverageattendance 15)
(define fixedcostperperformance 180)
(define variablecostperattendee .04)

(define (attendees ticket-price)
  (- averageattendance (* (- ticket-price standardticketprice) (/ changeinaverageattendance changeinticketprice))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ fixedcostperperformance (* variablecostperattendee (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))



