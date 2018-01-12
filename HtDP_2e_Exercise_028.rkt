;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_28) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Exercise 28. Determine the potential profit for these ticket prices: $1, $2, $3, $4, and $5.
;Which price maximizes the profit of the movie theater? Determine the best ticket price to a dime.
;ANSWER: $3 maximizes the profit of the movie theater.
;$1 ticket price yields $511.2 in profits
;$2 ticket price yields $937.2 in profits
;$3 ticket price yields $1063.2 in profits
;$4 ticket price yields $889.2 in profits
;$5 ticket price yields $415.2 in profits

;(define standardticketprice 5)
;(define averageattendance 120)
;(define changeinticketprice .10)
;(define changeinaverageattendance 15)
;(define fixedcostperperformance 180)
;(define variablecostperattendee .04)
;
;(define (attendees ticket-price)
;  (- averageattendance (* (- ticket-price standardticketprice) (/ changeinaverageattendance changeinticketprice))))
;
;(define (revenue ticket-price)
;  (* ticket-price (attendees ticket-price)))
;
;(define (cost ticket-price)
;  (+ fixedcostperperformance (* variablecostperattendee (attendees ticket-price))))
;
;(define (profit ticket-price)
;  (- (revenue ticket-price)
;     (cost ticket-price)))

;(profit 1)
;(profit 2)
;(profit 3) ;ANSWER: $3 maximizes the profit of the movie theater.
;(profit 4)
;(profit 5)

;Here is an alternative version of the same program, given as a single function definition:

(define (profit price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
     (+ 180
        (* 0.04
           (+ 120
              (* (/ 15 0.1)
                 (- 5.0 price)))))))

;Enter this definition into DrRacket and ensure that it produces the same results as the original version
;for $1, $2, $3, $4, and $5. A single look should suffice to show how much more difficult it is to
;comprehend this one function compared to the above four.

(profit 1)
(profit 2)
(profit 3)
(profit 4)
(profit 5)

;The results are the same:
;$1 ticket price yields $511.2 in profits
;$2 ticket price yields $937.2 in profits
;$3 ticket price yields $1063.2 in profits
;$4 ticket price yields $889.2 in profits
;$5 ticket price yields $415.2 in profits
