;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HtDP_2e_Exercise_12) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Exercise 12. Define the function cvolume, which accepts the length of a side of an equilateral cube and computes its volume.
;If you have time, consider defining csurface, too.
;
;Hint: An equilateral cube is a three-dimensional container bounded by six squares.
;You can determine the surface of a cube if you know that the square’s area is its length multiplied by itself.
;Its volume is the length multiplied with the area of one of its squares. (Why?)


;Volume of an equilateral cube
(define (cvolume x)
  (expt x 3))


;Surface of an equilateral cube
(define (csurface x)
  (* (sqr x) 6))

;The volume is the length multiplied by the area of one of its squares because the length indicates
;in the third dimension how many units of a two-dimensional side fit into the three-dimensional cube.

;For example, two-dimensional equilateral square where one side is 2 units long and no height has a volume
;of 0. As soon as you add a third dimension to this square by giving it a height of 1 unit, this new, now
;three-dimensional shape, has a volume that is equivalent to the area of the two-dimensional square. In other
;words when an equilateral square with an area of 4 units acquires a height of 1 unit, the resulting three-
;dimensional shape is composed of 4 smaller three-dimensional equilateral cubes having a volume of 1 unit each. When
;another layer of cubes is added on top of the initial layer, with 4 cubes with a volume of 1 unit each stacked
;on top of 4 cubes of equal dimensions, the resulting large shape is a cube.

;Thus, the height of a cube in x units determines how many times the area of one of its sides "fits in" to
;the space that the cube takes up.
