;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Ex4) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Exercise 4. Use the same setup as in exercise 3 to create an expression that deletes the ith position from str.
;Clearly this expression creates a shorter string than the given one. Which values for i are legitimate?

(define str "helloworld")
(define ind "0123456789")
(define i 10)

(string-append (substring str 0 i)
               (substring str (+ i 1) 10))

;The values for i that are legitmate range from 0 to 9 for this expression.

;Assigning the value 10 to i produces the following error message:
;"Substring: starting index is out of range
;  starting index:11
;  valid range: [0, 10]
;  string: "helloworld"

;The second substring cannot have a starting index of (+ i 1) when i is defined as 10 because the string has 9 1Strings,
;thus ranging from 0 to 10 as defined by the substring operator. The second argument to substring indicates
;up to but not including the 0-index position indicated.