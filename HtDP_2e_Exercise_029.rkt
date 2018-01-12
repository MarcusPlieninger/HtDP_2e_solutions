;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_29) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Exercise 29. After studying the costs of a show, the owner discovered several ways of lowering the cost.
;As a result of these improvements, there is no longer a fixed cost
;a variable cost of $1.50 per attendee remains.

;Modify both programs to reflect this change. When the programs are modified,
;test them again with ticket prices of $3, $4, and $5 and compare the results.

;ANSWER: The results are the same for each:
;RESULTS
;Ticket price $3 yields $630 in profits
;Ticket price $4 yields $675 in profits
;Ticket price $5 yields $420 in profits

;First Program

;(define standardticketprice 5)
;(define averageattendance 120)
;(define changeinticketprice .10)
;(define changeinaverageattendance 15)
;(define variablecostperattendee 1.50)
;
;(define (attendees ticket-price)
;  (- averageattendance (* (- ticket-price standardticketprice) (/ changeinaverageattendance changeinticketprice))))
;
;(define (revenue ticket-price)
;  (* ticket-price (attendees ticket-price)))
;
;(define (cost ticket-price)
;  (* variablecostperattendee (attendees ticket-price)))
;
;(define (profit ticket-price)
;  (- (revenue ticket-price)
;     (cost ticket-price)))
;
;(profit 3)
;(profit 4)
;(profit 5)

;RESULTS
;Ticket price $3 yields $630 in profits
;Ticket price $4 yields $675 in profits
;Ticket price $5 yields $420 in profits

;Second Program

(define (profit price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
    ;(+ 180
;          (* 0.04
     (* 1.50          ;This line is new, I deleted 180 and .04.
           (+ 120
              (* (/ 15 0.1)
                 (- 5.0 price))))))

(profit 3)
(profit 4)
(profit 5)

;RESULTS
;Ticket price $3 yields $630 in profits
;Ticket price $4 yields $675 in profits
;Ticket price $5 yields $420 in profits
