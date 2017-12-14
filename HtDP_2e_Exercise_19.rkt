;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_19) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Exercise 19. Define the function string-insert,
;which consumes a string str plus a number i and inserts "_" at the ith position of str.
;Assume i is a number between 0 and the length of the given string (inclusive).
;See exercise 3 for ideas. Ponder how string-insert copes with "".

;Initial version:

;(define (string-insert str i)
;  (string-append (substring str 0 i) "_" (substring str i (string-length str))))


;String-insert can only cope with "" aka an empty string when the argument for i is 0.
;The substring of an empy string is an empty string.
;Therefore, when an empty string is appended to "_" followed by another empty string,
;the function returns "_".

;If the argument for i is greater than 0, the resulting error messsage when substring
;is applied to an empty string is understandably "substring: ending index is out of range,"
;with DrRacket informing us that the range of the empty string is [0,0].

;To avoid this, it is necessary to use an if expression as well as the string=? operator
;to test if the argument passed for str is an empty string and if the argment passed for
;i does not exceed the length of the string.

;I implemented this expression for three cases: the case of an empty string (i.e.,
;string length is zero) where 0 is pased for i; the case of an empty string where any argument
;greater than 0 is passed for i; and  all other cases where the string length is greater
;than or equal to 1 and where i is less than the length of the string, since the position of
;i is determied according to zero-based indexing. The string length will thus be always one 1
;more than the furthest possible position for i.

;Thus, the revised version of the above:

(define (string-insert str i)
  (if (and (string=? str "") (= i 0))
      "-"
      (if (and (string=? str "") (> i 0))
          "Error: The string is empty. Only possible argument is 0."
               (if (and (>= (string-length str) 1) (< i (string-length str)))
                   (string-append (substring str 0 i) "_" (substring str i (string-length str)))
                    "Error: position indicated by i exceeds length of string."))))
