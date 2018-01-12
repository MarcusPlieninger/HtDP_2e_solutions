;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_30) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Exercise 30. Define constants for the price optimization program at the movie theater
;so that the price sensitivity of attendance (15 people for every 10 cents) becomes a computed constant.

(define STANDARDTICKETPRICE 5)
(define AVERAGEATTENDANCE 120)
(define CHANGEINTICKETPRICE .10)
(define CHANGEINAVERAGEATTENDANCE 15)
(define FIXEDCOSTPERPERFORMANCE 180)
(define VARIABLECOSTPERATTENDEE .04)

(define PRICESENSITIVITY
  (/ CHANGEINAVERAGEATTENDANCE CHANGEINTICKETPRICE))
  

(define (attendees ticket-price)
; (- averageattendance (* (- ticket-price standardticketprice) (/ changeinaverageattendance changeinticketprice))))
  (- AVERAGEATTENDANCE (* (- ticket-price STANDARDTICKETPRICE) PRICESENSITIVITY)))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ FIXEDCOSTPERPERFORMANCE (* VARIABLECOSTPERATTENDEE (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

;TEST
(profit 3)

;(Note that in this section, it is specified that global variables should be
;written in all uppercase. Thus, I emended accordingly here. Versions of this
;program in previous exercises to not reflect this rule because it wasn't
;mentioned as one.)
