;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_050) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 50. If you copy and paste the above function definition into the definitions area
; of DrRacket and click RUN, DrRacket highlights two of the three cond lines. This coloring
; tells you that your test cases do not cover the full conditional.
; Add enough tests to make DrRacket happy. 

; TrafficLight -> TrafficLight
; yields the next state given current state s
(check-expect (traffic-light-next "red") "green")
(check-expect (traffic-light-next "green") "yellow") ; added this test
(check-expect (traffic-light-next "yellow") "red") ; added this test
(define (traffic-light-next s)
  (cond
    [(string=? "red" s) "green"]
    [(string=? "green" s) "yellow"]
    [(string=? "yellow" s) "red"]))
