;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_36) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 36. Design the function image-area, which counts the number of pixels in a given image. 
(require 2htdp/image) ;putting this in here now because I know it will be necessary given we are dealing with images

;Image->Number
;multiply width and height of img to get number of pixels, i.e. area of img
;;(define (image-area img) 16)
;given: (rectangle 20 40 "solid" "red"), expect: 800
;given; <cat image>, expect: 8775
;;(define (image-area img)
;;(...img...)
(define (image-area img)
  (* (image-width img) (image-height img)))
;;tested functional examples, ie rectangle above and cat image, and they passed



