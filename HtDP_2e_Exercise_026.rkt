;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_26) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Exercise 26. What do you expect as the value of this program:
(define (string-insert s i)
  (string-append (substring s 0 i)
                 "_"
                 (substring s i)))
 
(string-insert "helloworld" 6)

;Confirm your expectation with DrRacket and its stepper.

;My expectation is that DrRacket will evaluate this program according
;to the following steps:
;1. Check that there are the same number of arguments as ther are parameters.
;2. Substitute the first argument "helloworld" for the first parameter "s" in the
;   function body.
;3. Substitute the second argument "6" for the second parameter "i" in the
;   function body.
;4. Evaluate the subexpression (substring "helloworld" 0 6).
;   This evaluates to "hellow".
;   Note that DrRacket cannot yet evaluate the entire string-append expression
;   because the final subexpression still needs to be evaluated. Thus:
;7. Evaluate the subexpression (substring "helloworld" 6).
;   Racket documentation explains that substring extracts the string upt to the end
;   if a second natural number is not provided as the third argument.
;   Thus, this subexpression evaluates to "orld".
;8. Now that each substring subexpression has been evaluated to a value, the value
;   of the entire string-append expression can be determined:
;   (string-append "hellow" "_" "orld")
;   Thus:
;9. "Hellow_orld"

;Note: The stepper confirmed my expectations. However, it appears that arguments
;are substituted for parameters in one shot and not one at a time (i.e,
;parameter A then parameter B.)

;Furthermore: It is worth stressing that any and all arguments that are expressions
;must be reduced to values before the expression in which they are contained can
;be evaluated. Operators do not operate piecemeal, say, as arguments in an expression
;become available as values. All the arguments must first be available as
;values for BSL to evaluate that particular expression according to the operator.
