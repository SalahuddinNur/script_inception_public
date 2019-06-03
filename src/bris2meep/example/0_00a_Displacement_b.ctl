;preamble - some interesting settings
(set! filename-prefix false)
(set! output-single-precision? true)
(set-param! resolution 20)

;simulation size
(define-param sx 7) ; x size
(define-param sy 5) ; y size
(define-param sz 12) ; z size
(set! geometry-lattice (make lattice (size 7 5 12)))

;geometry specification
(set! geometry
  (list
    (make block
      (center 0 -0 0)
      (size 7 5 12)
      (material (make dielectric (epsilon 1))))
    (make block
      (center 0 -0 0)
      (size 7 1 12)
      (material (make dielectric (epsilon 14.6399))))
    (make cylinder
      (center -2.62453 -0 -5.304)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -2.62453 -0 -4.42)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -2.62453 -0 -3.536)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -2.62453 -0 -2.652)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -2.62453 -0 -1.768)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -2.62453 -0 -0.884)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -2.62453 -0 0)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -2.62453 -0 0.884)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -2.62453 -0 1.768)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -2.62453 -0 2.652)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -2.62453 -0 3.536)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -2.62453 -0 4.42)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -2.62453 -0 5.304)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -1.0934 -0 -5.304)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -1.0934 -0 -4.42)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -1.0934 -0 -3.536)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -1.0934 -0 -2.652)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -1.0934 -0 -1.768)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -1.0934 -0 -0.884)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -1.0934 -0 0)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -1.0934 -0 0.884)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -1.0934 -0 1.768)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -1.0934 -0 2.652)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -1.0934 -0 3.536)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -1.0934 -0 4.42)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -1.0934 -0 5.304)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 0.437734 -0 -5.304)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 0.437734 -0 -4.42)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 0.437734 -0 -3.536)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 0.437734 -0 -2.652)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 0.437734 -0 -1.768)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 0.437734 -0 -0.884)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 0.437734 -0 0)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 0.437734 -0 0.884)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 0.437734 -0 1.768)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 0.437734 -0 2.652)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 0.437734 -0 3.536)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 0.437734 -0 4.42)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 0.437734 -0 5.304)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 1.96887 -0 -5.304)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 1.96887 -0 -4.42)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 1.96887 -0 -3.536)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 1.96887 -0 -2.652)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 1.96887 -0 -1.768)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 1.96887 -0 -0.884)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 1.96887 -0 0)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 1.96887 -0 0.884)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 1.96887 -0 1.768)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 1.96887 -0 2.652)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 1.96887 -0 3.536)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 1.96887 -0 4.42)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 1.96887 -0 5.304)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 3.5 -0 -5.304)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 3.5 -0 -4.42)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 3.5 -0 -3.536)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 3.5 -0 -2.652)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 3.5 -0 -1.768)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 3.5 -0 1.768)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 3.5 -0 2.652)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 3.5 -0 3.536)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 3.5 -0 4.42)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 3.5 -0 5.304)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -1.85897 -0 -4.862)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -1.85897 -0 -3.978)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -1.85897 -0 -3.094)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -1.85897 -0 -2.21)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -1.85897 -0 -1.326)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -1.85897 -0 -0.442)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -1.85897 -0 0.442)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -1.85897 -0 1.326)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -1.85897 -0 2.21)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -1.85897 -0 3.094)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -1.85897 -0 3.978)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -1.85897 -0 4.862)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -0.327833 -0 -4.862)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -0.327833 -0 -3.978)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -0.327833 -0 -3.094)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -0.327833 -0 -2.21)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -0.327833 -0 -1.326)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -0.327833 -0 -0.442)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -0.327833 -0 0.442)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -0.327833 -0 1.326)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -0.327833 -0 2.21)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -0.327833 -0 3.094)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -0.327833 -0 3.978)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center -0.327833 -0 4.862)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 1.2033 -0 -4.862)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 1.2033 -0 -3.978)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 1.2033 -0 -3.094)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 1.2033 -0 -2.21)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 1.2033 -0 -1.326)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 1.2033 -0 -0.442)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 1.2033 -0 0.442)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 1.2033 -0 1.326)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 1.2033 -0 2.21)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 1.2033 -0 3.094)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 1.2033 -0 3.978)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 1.2033 -0 4.862)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 2.73443 -0 -4.862)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 2.73443 -0 -3.978)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 2.73443 -0 -3.094)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 2.73443 -0 -2.21)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 2.73443 -0 -1.326)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 2.73443 -0 -0.442)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 2.73443 -0 0.442)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 2.73443 -0 1.326)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 2.73443 -0 2.21)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 2.73443 -0 3.094)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 2.73443 -0 3.978)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
    (make cylinder
      (center 2.73443 -0 4.862)
      (radius 0.3094)
      (height 1)
      (axis (vector3 0 1 0))
      (material (make dielectric (epsilon 1))))
  )
)

;;excitations specification
(set! sources
  (list
    (make source
      (src (make gaussian-src (frequency 0.294321) (width 5.99585)
))
      (component Ex)
      (center 3.475 -0.6 0)
      (size 0.0500002 0 0))
  )
)

;boundaries specification
(set! pml-layers
  (list
    (make pml (direction Y) (side Low) (thickness 0.4))
    (make pml (direction Z) (side Low) (thickness 0.4))
    (make pml (direction X) (side High) (thickness 0.4))
    (make pml (direction Y) (side High) (thickness 0.4))
    (make pml (direction Z) (side High) (thickness 0.4))
  ))
(init-fields)
(meep-fields-set-boundary fields Low X Metallic)

;simulation run specification
(run-until 2500
  (to-appended "p01a" (at-every 0.25 (in-volume (volume (center 3.25 -0 0) (size 0 0 0))
     output-efield-x output-efield-y output-efield-z output-hfield-x output-hfield-y output-hfield-z)))
  (to-appended "p02a" (at-every 0.25 (in-volume (volume (center 3.25 -0.6 0) (size 0 0 0))
     output-efield-x output-efield-y output-efield-z output-hfield-x output-hfield-y output-hfield-z)))
  (to-appended "p03a" (at-every 0.25 (in-volume (volume (center 3.25 -0 0.3) (size 0 0 0))
     output-efield-x output-efield-y output-efield-z output-hfield-x output-hfield-y output-hfield-z)))
  (to-appended "p04a" (at-every 0.25 (in-volume (volume (center 3.25 -0 0.6) (size 0 0 0))
     output-efield-x output-efield-y output-efield-z output-hfield-x output-hfield-y output-hfield-z)))
  (to-appended "p05a" (at-every 0.25 (in-volume (volume (center 3.25 -0 0.9) (size 0 0 0))
     output-efield-x output-efield-y output-efield-z output-hfield-x output-hfield-y output-hfield-z)))
  (to-appended "p06a" (at-every 0.25 (in-volume (volume (center 3.25 -0 1.2) (size 0 0 0))
     output-efield-x output-efield-y output-efield-z output-hfield-x output-hfield-y output-hfield-z)))
  (to-appended "p07a" (at-every 0.25 (in-volume (volume (center 3.25 -0 1.5) (size 0 0 0))
     output-efield-x output-efield-y output-efield-z output-hfield-x output-hfield-y output-hfield-z)))
  (to-appended "p08a" (at-every 0.25 (in-volume (volume (center 3.25 -0 -0.3) (size 0 0 0))
     output-efield-x output-efield-y output-efield-z output-hfield-x output-hfield-y output-hfield-z)))
  (to-appended "p09a" (at-every 0.25 (in-volume (volume (center 3.25 -0 -0.6) (size 0 0 0))
     output-efield-x output-efield-y output-efield-z output-hfield-x output-hfield-y output-hfield-z)))
  (to-appended "p10a" (at-every 0.25 (in-volume (volume (center 3.25 -0 -0.9) (size 0 0 0))
     output-efield-x output-efield-y output-efield-z output-hfield-x output-hfield-y output-hfield-z)))
  (to-appended "p11a" (at-every 0.25 (in-volume (volume (center 3.25 -0 -1.2) (size 0 0 0))
     output-efield-x output-efield-y output-efield-z output-hfield-x output-hfield-y output-hfield-z)))
  (to-appended "p12a" (at-every 0.25 (in-volume (volume (center 3.25 -0 -1.5) (size 0 0 0))
     output-efield-x output-efield-y output-efield-z output-hfield-x output-hfield-y output-hfield-z)))
)
