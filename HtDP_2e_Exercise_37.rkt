;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_37) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 37. Design the function string-rest, which produces a string like the given one
;with the first character removed.

;String->String
;given strg, produce a substring by omiting character in position 0 in strg
;(define (string-rest strg) "a")
;given: "string", expect: "tring"
;given: "batman", expect: "atman"
(define (string-rest strg)
  (substring strg 1))
;;tests passed


