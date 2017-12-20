;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_38) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 38. Design the function string-remove-last,
;which produces a string like the given one with the last character removed.

;String->String
;given string strg, create a substring with character in last position omitted
;given: "string", expect: "strin"
;given: "batman", expect: "batma"
(define (string-remove-last strg)
  (substring strg 0 (- (string-length strg) 1)))
;;tests (i.e., functional examples)