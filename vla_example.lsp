(vl-load-com)
(defun c:vla_example()
    ;; This example creates a lightweight polyline
    ;; and then rotates that polyline.
    (setq acadObj (vlax-get-acad-object))
    (setq doc (vla-get-ActiveDocument acadObj))

    ;; Create the polyline
    (setq points (vlax-make-safearray vlax-vbDouble '(0 . 11)))
    (vlax-safearray-fill points '(1 1
                                  1 3
                                  2 3
                                  3 3
                                  4 4
                                  4 2
                                 )
    )

    (setq modelSpace (vla-get-ModelSpace doc))
    (setq plineObj (vla-AddLightWeightPolyline modelSpace points))
    (vla-put-Closed plineObj :vlax-true)
    (vla-ZoomExtents acadObj)
            
    (alert "Rotate the polyline by 45 degrees.")
    
    ;; Define the rotation
    (setq basePoint (vlax-3d-point 4 4.25 0)
          rotationAngle 0.7853981)   ;; 45 degrees
    
    ;; Rotate the polyline
    (vla-Rotate plineObj basePoint rotationAngle)
    
    (vla-ZoomExtents acadObj)
    (alert "Rotation completed.")
	
	;; Define the mirror axis
    (setq point1 (vlax-3d-point 0 4.25 0)
          point2 (vlax-3d-point 4 4.25 0))

    (setq lineObj (vla-AddLine modelSpace point1 point2))

    (vla-ZoomExtents acadObj)
    (alert "Mirror the object about line.")
    
    ;; Mirror the polyline
    (setq mirrorObj (vla-Mirror plineObj point1 point2))
    
    (vla-ZoomExtents acadObj)
    (alert "Mirror completed.")
)