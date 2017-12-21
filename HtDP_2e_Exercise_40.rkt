;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_40) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 40.

;Given the below:

; WorldState -> WorldState 
; moves the car by 3 pixels for every clock tick
; examples: 
;   given: 20, expect 23
;   given: 78, expect 81
;(define (tock ws)
;  (+ ws 3))

;And the following expressions that were evaluated in the interactions area:

;> (tock 20)
;23

;> (tock 78)
;81


;Formulate the examples as BSL tests, that is, using the check-expect form.
;Introduce a mistake. Re-run the tests.

; WorldState -> WorldState 
; moves the car by 3 pixels for every clock tick

(check-expect (tock 20) 23)
(check-expect (tock 78) 81)

(define (tock ws)
  (+ ws 3))

;MP: (check-expect) performed as expected. When an error was introduced by
;changing 23 to 25, a dialog box signalled that the actual value was not
;the same as the expected value.

