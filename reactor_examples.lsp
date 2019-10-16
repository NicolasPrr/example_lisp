(vl-load-com)
;; Mouse reactor
(vlr-remove-all :vlr-mouse-reactor)

(vlr-mouse-reactor "Doble ckick" '( (:vlr-beginDoubleClick . rightClick   )))
 
 (defun rightClick ( calling-reactor commandInf )
    (setq reactData (vlr-data calling-reactor))
     (alert 
     (strcat 
        "Se ha dado doble click en la posicion  \n" "x: " (rtos(car (car commandInf)))
         "\n y: " (rtos(cadr (car commandInf))) "\n El nombre es: " reactData
        )
     )
 )


;;Window reactor
(vlr-remove-all :vlr-window-reactor)
;; (vlr-window-reactor data callbacks)
(vlr-window-reactor "Change window size" '( (:vlr-mainFrameMovedOrResized . reSize   )))
  (defun reSize ( calling-reactor commandInf )
        (setq isMove (car (cdr commandInf)))
       (if isMove
        (alert "Se ha movido la ventana")
        (alert "Se ha cambiando el tamano de la ventana")
        )
)


(vlr-remove-all :vlr-editor-reactor)
(vlr-editor-reactor "Name command" '( (:vlr-commandWillStart . newDraw   )))

(defun newDraw ( calling-reactor commandInf )
    ;; (print commandInf)
    (alert (strcat "Soy el comando: "  (car commandInf)  ) )
)
